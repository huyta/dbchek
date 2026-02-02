import csv
import os

csv_file_path = 'catalogitems_202602021056.csv'
output_sql_path = 'insert_catalogitems.sql'
table_name = 'catalogitems'

# Full schema definition map: Column Name -> Default Value (as string for SQL)
# Derived from the provided CREATE TABLE statement.
# For NOT NULL columns without default, we assume they must be in CSV.
# For nullable columns without default, they default to NULL.
SCHEMA_DEFAULTS = {
    'Id': 'NULL', # Auto increment, but if CSV has value we use it. If missing, NULL/0 implies auto-inc.
    'CatalogSubCatagoryId': None, # NOT NULL, no default
    'ProcessorId': None, # NOT NULL, no default
    'Name': 'NULL',
    'ShortName': 'NULL',
    'CatalogItemTypeId': 'NULL',
    'AccessionNumber': None, # NOT NULL
    'Value': None, # NOT NULL
    'IsDeleted': None, # NOT NULL
    'CreatedTimestamp': None, # NOT NULL
    'CreatedBy': 'NULL',
    'UpdatedTimestamp': 'NULL',
    'UpdatedBy': 'NULL',
    'RemarksToProcessor': 'NULL',
    'Section': 'NULL',
    'ValidationLevel': 'NULL',
    'SIUnit': 'NULL',
    'PackingOptionId': 'NULL',
    'Method': 'NULL',
    'UrgentTAT': 'NULL',
    'LTAT': 'NULL',
    'TAT': 'NULL',
    'ReorderTime': 'NULL',
    'SampleRetentionPeriod': 'NULL',
    'IsSensitive': 'NULL',
    'IsISO': 'NULL',
    'IsAllowedForLabUser': 'NULL',
    'AllowAppointment': 'NULL',
    'IsCnS': None, # NOT NULL
    'IsSlitSmear': None, # NOT NULL
    'IsOutsourced': None, # NOT NULL
    'AnatomicalSiteId': None, # NOT NULL
    'SectionId': None, # NOT NULL
    'PrintName': 'NULL',
    'ApproverText': 'NULL',
    'FootNotes': 'NULL',
    'NotifyTAT': None, # NOT NULL
    'MachineId': None, # NOT NULL
    'AccessionCategoryId': None, # NOT NULL
    'IsUniqueSampleNoRequired': 'NULL',
    'IsBloodTest': '0',
    'IsPapSmearTest': '0',
    'ParentCatelogItemId': 'NULL',
    'InvalidateAllowedTime': 'NULL',
    'AllowInvalidateRejection': '0', # NOT NULL DEFAULT '0'
    'IsAutoCompleteAllowed': '0',
    'IsRoutineHema': '0', # bit(1) DEFAULT b'0' -> 0
    'Disclaimer': 'NULL',
    'IsInactive': '0',
    'TubeId': '1', # DEFAULT '1'
    'PrintGroup': 'NULL',
    'BarcodeQuantity': '1', # DEFAULT '1'
    'ExternalBarcodeQuantity': '1', # DEFAULT '1'
    'IsAutoCompleteNeedAllParametersFilled': '0',
    'UrgentLTAT': 'NULL',
    'IsAutoGenPrelimaryReport': '0', # NOT NULL DEFAULT '0'
    'IsShowPrelimaryReportButton': '0', # NOT NULL DEFAULT '0'
    'TatLtatWeekendPhInclusion': '0', # NOT NULL DEFAULT '0'
    'IsUrgentNotAllowed': '0', # NOT NULL DEFAULT '0'
    'IsAppointmentRequired': '0', # NOT NULL DEFAULT '0'
    'IsMoreTubeRequired': '0', # NOT NULL DEFAULT '0'
    'Information': 'NULL',
    'SharingGroupId': 'NULL',
    'showPerPatForm': '0', # NOT NULL DEFAULT '0'
    'warningLabTurnAroundTimePercentage': 'NULL',
    'warningLabUrgentTurnAroundTimePercentage': 'NULL'
}

# Order of columns as per CREATE TABLE (important for readability and consistency)
COLUMN_ORDER = [
    'Id', 'CatalogSubCatagoryId', 'ProcessorId', 'Name', 'ShortName', 'CatalogItemTypeId', 
    'AccessionNumber', 'Value', 'IsDeleted', 'CreatedTimestamp', 'CreatedBy', 'UpdatedTimestamp', 
    'UpdatedBy', 'RemarksToProcessor', 'Section', 'ValidationLevel', 'SIUnit', 'PackingOptionId', 
    'Method', 'UrgentTAT', 'LTAT', 'TAT', 'ReorderTime', 'SampleRetentionPeriod', 'IsSensitive', 
    'IsISO', 'IsAllowedForLabUser', 'AllowAppointment', 'IsCnS', 'IsSlitSmear', 'IsOutsourced', 
    'AnatomicalSiteId', 'SectionId', 'PrintName', 'ApproverText', 'FootNotes', 'NotifyTAT', 
    'MachineId', 'AccessionCategoryId', 'IsUniqueSampleNoRequired', 'IsBloodTest', 'IsPapSmearTest', 
    'ParentCatelogItemId', 'InvalidateAllowedTime', 'AllowInvalidateRejection', 'IsAutoCompleteAllowed', 
    'IsRoutineHema', 'Disclaimer', 'IsInactive', 'TubeId', 'PrintGroup', 'BarcodeQuantity', 
    'ExternalBarcodeQuantity', 'IsAutoCompleteNeedAllParametersFilled', 'UrgentLTAT', 
    'IsAutoGenPrelimaryReport', 'IsShowPrelimaryReportButton', 'TatLtatWeekendPhInclusion', 
    'IsUrgentNotAllowed', 'IsAppointmentRequired', 'IsMoreTubeRequired', 'Information', 
    'SharingGroupId', 'showPerPatForm', 'warningLabTurnAroundTimePercentage', 
    'warningLabUrgentTurnAroundTimePercentage'
]

def format_value(value, column_name):
    # Handle NULL cases from CSV
    if value is None or value.strip() == '':
        return 'NULL'
    
    val_str = str(value)
    
    # Escape single quotes and backslashes
    val_escaped = val_str.replace("'", "''")
    val_escaped = val_escaped.replace("\\", "\\\\")
    
    # Check if column is numeric.
    # While we could rely on isdigit(), some fields might be hex or have decimals.
    # Safe bet: Quote everything except specific numeric types or known safe ints.
    # But let's stick to the heuristic: if it looks like a number, don't quote.
    # Exception: Long numbers that might be strings? No, SQL handles '123' as 123 usually.
    # But let's check basic isdigit for cleanliness.
    
    if val_str.lstrip('-').replace('.', '', 1).isdigit():
         # Also check if it starts with 0 and is not just "0". Leading zeros -> likely string (e.g. barcodes), but here we are dealing with catalog settings.
         # AccessionNumber is tinyint.
         # ShortName is string.
        if column_name in ['ShortName', 'Name', 'PrintName', 'Date', 'CreatedTimestamp', 'UpdatedTimestamp', 'Section', 'Method', 'SIUnit', 'ValidationLevel']:
            return f"'{val_escaped}'"
        return val_str
    
    return f"'{val_escaped}'"

def main():
    print(f"Reading {csv_file_path}...")
    with open(csv_file_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        headers = reader.fieldnames
        
        # Prepare the columns string using the defined order
        columns_str = ", ".join([f"`{col}`" for col in COLUMN_ORDER])
        
        sql_statements = []
        sql_statements.append("SET FOREIGN_KEY_CHECKS=0;")
        
        row_count = 0
        batch_size = 100
        values_batch = []
        
        # Base Insert Statement
        prefix = f"INSERT INTO `{table_name}` ({columns_str}) VALUES"
        
        for row in reader:
            row_values = []
            for col in COLUMN_ORDER:
                if col in headers:
                    # Column exists in CSV, use value from CSV
                    val = row.get(col)
                    row_values.append(format_value(val, col))
                else:
                    # Column missing in CSV, use default
                    default_val = SCHEMA_DEFAULTS.get(col)
                    if default_val is None:
                        # This shouldn't happen for valid CSVs relative to schema, 
                        # but if a required field is missing from CSV and we have no default...
                        # We will assume 'NULL' or empty string/0 safely if really needed, 
                        # OR raise error.
                        # For now, let's output NULL and warn.
                        print(f"WARNING: Column '{col}' missing in CSV and has no default. Using NULL.")
                        row_values.append('NULL')
                    else:
                        row_values.append(default_val)
            
            values_str = "(" + ", ".join(row_values) + ")"
            values_batch.append(values_str)
            row_count += 1
            
            if len(values_batch) >= batch_size:
                sql_statements.append(f"{prefix} {', '.join(values_batch)};")
                values_batch = []
        
        if values_batch:
             sql_statements.append(f"{prefix} {', '.join(values_batch)};")
        
        sql_statements.append("SET FOREIGN_KEY_CHECKS=1;")
        
        print(f"Generated {len(sql_statements)} statements for {row_count} rows.")
        
        with open(output_sql_path, 'w', encoding='utf-8') as out:
            out.write('\n'.join(sql_statements))
            
    print(f"Written to {output_sql_path}")

if __name__ == '__main__':
    main()
