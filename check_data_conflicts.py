import os
import sys
import hashlib
import pandas as pd
from sqlalchemy import create_engine, inspect
import pymysql
import warnings
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Suppress warnings
warnings.filterwarnings('ignore')

# =============================================================================
# 1. CONFIGURATION
# =============================================================================

# Database Connection Configs - REPLACE WITH ACTUAL CREDENTIALS
# Format: "mysql+pymysql://user:password@host:port/database"
STAGING_DB_CONFIG = {
    "uri": os.getenv("STAGING_DB_URI", "mysql+pymysql://readonly_user:password@staging_host:3306/lims-staging")
}

PROD_DB_CONFIG = {
    "uri": os.getenv("PROD_DB_URI", "mysql+pymysql://readonly_user:password@prod_host:3306/lims-prod")
}

# Output Directory
OUTPUT_DIR = "./conflict_reports/"

# Table Configuration
# Define unique ID (PK) and Business Identity Columns (business_cols)
# If a column is missing in your DB, remove it from the list.
TABLE_CONFIG = {
    "catalogitems": {
        "pk": ["Id"],
        # Inferred from schema: Name, ShortName, CatalogSubCatagoryId
        # User mentioned 'Code' but it might be ShortName or missing. Adjust as needed.
        # "business_cols": ["Name", "ShortName", "CatalogSubCatagoryId", "SectionId"]
        "business_cols": ["ShortName"]
    },
    "catalogitemprocessors": {
        "pk": ["Id"],
        "business_cols": ["CatalogItemId", "ProcessorId"]
    },
    "catalogitemmappings": {
        "pk": ["Id"],
        "business_cols": ["ParentCatalogItemId", "ChildCatalogItemId"]
    },
    "catalogitemmachinemaps": {
        "pk": ["Id"],
        "business_cols": ["CatalogItemId", "MachineId"]
    },
    "catalogitemparameters": {
        "pk": ["Id"],
        "business_cols": ["CatalogItemId", "ParameterId"]
    },
    "parameters": {
        "pk": ["Id"],
        "business_cols": ["Name", "Code"]
    },
    "parameterreferences": {
        "pk": ["Id"],
        "business_cols": ["ParameterId", "GenderId", "AgeFrom", "AgeTo", "LowerValue", "UpperValue"]
    },
    "parameterselectvalues": {
        "pk": ["Id"],
        "business_cols": ["ParameterId", "Name", "Code"]
    },
    "testhierarchysearch": {
        "pk": ["Id"],
        "business_cols": ["CatalogItemId", "TestName", "DisciplineId", "PerformingLabId", "SectionId"]
    },
    "processors": {
        "pk": ["Id"],
        "business_cols": ["Name"]
    }
}

# =============================================================================
# 2. HELPER FUNCTIONS
# =============================================================================

def get_db_engine(uri):
    """Creates a SQLAlchemy engine."""
    return create_engine(uri, echo=False)

def get_table_data(table_name, config, engine, tag):
    """
    Reads specific columns from a table using pandas.
    Returns: DataFrame or None if error/table missing.
    """
    pk_cols = config.get("pk", [])
    bus_cols = config.get("business_cols", [])
    
    if not pk_cols or not bus_cols:
        print(f"[{tag}] ⚠️  Configuration missing PK or Business Cols for {table_name}")
        return None

    columns_to_load = list(set(pk_cols + bus_cols))
    cols_str = ", ".join([f"`{c}`" for c in columns_to_load])
    
    # Check if IsDeleted column exists
    has_is_deleted = False
    try:
        insp = inspect(engine)
        columns = [c['name'] for c in insp.get_columns(table_name)]
        if 'IsDeleted' in columns:
            has_is_deleted = True
    except Exception as e:
        # Fallback for inspection error
        pass

    where_clause = "WHERE IsDeleted = 0" if has_is_deleted else ""
    query = f"SELECT {cols_str} FROM `{table_name}` {where_clause}"
    
    try:
        print(f"[{tag}] Loading {table_name} ({'filtered' if has_is_deleted else 'all'})...")
        df = pd.read_sql(query, engine)
        print(f"[{tag}] Loaded {len(df)} rows from {table_name}")
        return df
    except Exception as e:
        print(f"[{tag}] ❌ Error loading {table_name}: {e}")
        return None

def compute_business_hash(df, business_cols):
    """
    Computes an MD5 hash of the concatenated business columns.
    Handles NULLs by converting to empty string.
    """
    if df is None or df.empty:
        return df

    # Create a copy to avoid SettingWithCopy warnings on original DF if needed
    df_hash = df.copy()
    
    # helper for string conversion with case insensitivity
    def process_col(col_name):
        return df_hash[col_name].fillna("").astype(str).str.lower()

    # Concatenate columns with separator
    combined_str = process_col(business_cols[0])
    for col in business_cols[1:]:
        combined_str = combined_str + "|" + process_col(col)
        
    # Apply MD5 hash
    df_hash['business_hash'] = combined_str.apply(
        lambda x: hashlib.md5(x.encode('utf-8')).hexdigest()
    )
    
    return df_hash

def check_id_conflicts(df_stg, df_prod, pk_cols):
    """
    Identifies ID conflicts:
    Matching PK, but different Business Hash.
    Returns DataFrame of conflicts.
    """
    # Merge on PK
    merged = pd.merge(
        df_stg, 
        df_prod, 
        on=pk_cols, 
        how='inner', 
        suffixes=('_220', '_107')
    )
    
    # Filter where Hashes differ
    conflicts = merged[merged['business_hash_220'] != merged['business_hash_107']].copy()
    
    if not conflicts.empty:
        conflicts['conflict_type'] = 'BLOCKER_ID_CONFLICT'
        
    return conflicts

def check_business_duplicates(df_stg, df_prod, pk_cols):
    """
    Identifies Business Duplicates:
    Matching Business Hash, but different PK.
    Returns DataFrame of duplicates.
    """
    # Merge on Hash
    merged = pd.merge(
        df_stg, 
        df_prod, 
        on='business_hash', 
        how='inner', 
        suffixes=('_220', '_107')
    )
    
    # Filter where PKs differ
    # We need to check all PK columns match. If ANY differ, it's a diff ID.
    # Logic: if (stg.pk1 != prod.pk1) OR (stg.pk2 != prod.pk2)...
    
    # Initial mask: all false (assume IDs match)
    ids_different = pd.Series([False] * len(merged))
    
    for pk in pk_cols:
        # Check inequality. Handle potential type mismatch if needed, but assuming DB strictness.
        ids_different = ids_different | (merged[f'{pk}_220'] != merged[f'{pk}_107'])
        
    duplicates = merged[ids_different].copy()
    
    if not duplicates.empty:
        duplicates['conflict_type'] = 'BUSINESS_DUPLICATE_DIFFERENT_ID'
        
    return duplicates

def check_staging_only_data(df_stg, df_prod):
    """
    Identifies data unique to Staging (New Data).
    Logic: Business Hash exists in Staging but NOT in Prod.
    """
    # Get set of prod hashes
    prod_hashes = set(df_prod['business_hash'].unique())
    
    # Filter staging rows where hash is NOT in prod
    staging_only = df_stg[~df_stg['business_hash'].isin(prod_hashes)].copy()
    
    return staging_only

# =============================================================================
# 3. MAIN EXECUTION
# =============================================================================

def main():
    print("========================================================")
    print("   MySQL Staging vs Prod Data Conflict Checker")
    print("========================================================")
    
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)
        
    summary_data = []
    
    # 1. Connect
    try:
        eng_stg = get_db_engine(STAGING_DB_CONFIG['uri'])
        eng_prod = get_db_engine(PROD_DB_CONFIG['uri'])
        
        # Test connection
        with eng_stg.connect() as _: pass
        with eng_prod.connect() as _: pass
        print("✅ DB Connections Successful")
    except Exception as e:
        print(f"❌ DB Connection Error: {e}")
        sys.exit(1)

    overall_status = "GO"

    for table_name, config in TABLE_CONFIG.items():
        print(f"\nProcessing Table: {table_name}")
        
        # 2. Load
        df_stg = get_table_data(table_name, config, eng_stg, "STG")
        df_prod = get_table_data(table_name, config, eng_prod, "PROD")
        
        stg_count = len(df_stg) if df_stg is not None else 0
        prod_count = len(df_prod) if df_prod is not None else 0
        
        id_conflict_count = 0
        bus_dup_count = 0
        stg_only_count = 0
        
        if df_stg is not None and df_prod is not None and not df_stg.empty and not df_prod.empty:
            
            # 3. Hash
            print(f"   Computing Hashes for {table_name}...")
            bus_cols = config['business_cols']
            pk_cols = config['pk']
            
            df_stg = compute_business_hash(df_stg, bus_cols)
            df_prod = compute_business_hash(df_prod, bus_cols)
            
            # 4. Compare
            
            # A. ID Conflicts
            id_conflicts = check_id_conflicts(df_stg, df_prod, pk_cols)
            id_conflict_count = len(id_conflicts)
            
            if id_conflict_count > 0:
                print(f"   ❌ Found {id_conflict_count} ID CONFLICTS!")
                csv_path = os.path.join(OUTPUT_DIR, f"{table_name}_ID_CONFLICT.csv")
                # Remove hash columns from report
                drop_cols = [c for c in id_conflicts.columns if 'business_hash' in c]
                id_conflicts.drop(columns=drop_cols, inplace=True, errors='ignore')
                
                # Reorder: PKs first
                cols = pk_cols + [c for c in id_conflicts.columns if c not in pk_cols]
                id_conflicts = id_conflicts[cols]
                
                id_conflicts.to_csv(csv_path, index=False)
                overall_status = "NO_GO"
            
            # B. Business Duplicates
            bus_dups = check_business_duplicates(df_stg, df_prod, pk_cols)
            bus_dup_count = len(bus_dups)
            
            if bus_dup_count > 0:
                print(f"   ⚠️ Found {bus_dup_count} BUSINESS DUPLICATES")
                csv_path = os.path.join(OUTPUT_DIR, f"{table_name}_BUSINESS_DUPLICATE.csv")
                drop_cols = [c for c in bus_dups.columns if 'business_hash' in c]
                bus_dups.drop(columns=drop_cols, inplace=True, errors='ignore')
                
                # Reorder: PK_220, PK_107 first
                pk_220 = [f"{c}_220" for c in pk_cols]
                pk_107 = [f"{c}_107" for c in pk_cols]
                priority = pk_220 + pk_107
                cols = priority + [c for c in bus_dups.columns if c not in priority]
                bus_dups = bus_dups[cols]
                
                bus_dups.to_csv(csv_path, index=False)
                
            # C. Staging Only (New Data)
            stg_only = check_staging_only_data(df_stg, df_prod)
            stg_only_count = len(stg_only)
            
            if stg_only_count > 0:
                print(f"   ℹ️  Found {stg_only_count} NEW STAGING RECORDS")
                csv_path = os.path.join(OUTPUT_DIR, f"{table_name}_STAGING_ONLY.csv")
                drop_cols = [c for c in stg_only.columns if 'business_hash' in c]
                stg_only.drop(columns=drop_cols, inplace=True, errors='ignore')
                
                # Reorder: PKs first
                cols = pk_cols + [c for c in stg_only.columns if c not in pk_cols]
                stg_only = stg_only[cols]
                
                stg_only.to_csv(csv_path, index=False)
        
        else:
            print("   ⚠️ Skipping comparison due to load error or empty table.")

        summary_data.append({
            "table_name": table_name,
            "staging_row_count": stg_count,
            "prod_row_count": prod_count,
            "id_conflict_count": id_conflict_count,
            "business_duplicate_count": bus_dup_count,
            "staging_only_count": stg_only_count,
            "status": "NO_GO" if id_conflict_count > 0 else "GO"
        })
        
    # 5. Summary Report
    summary_df = pd.DataFrame(summary_data)
    summary_path = os.path.join(OUTPUT_DIR, "SUMMARY.csv")
    summary_df.to_csv(summary_path, index=False)
    
    print("\n========================================================")
    print(f"Processing Complete.")
    print(f"Final GO/NO-GO Status: {overall_status}")
    print(f"Reports generated in: {OUTPUT_DIR}")
    print("========================================================")

if __name__ == "__main__":
    main()
