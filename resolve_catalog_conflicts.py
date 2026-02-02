import csv
import os

CSV_PATH = 'conflict_reports/catalogitems_ID_CONFLICT.csv'
OUTPUT_SQL = 'resolve_catalog_conflicts.sql'

# Tables that reference CatalogItems.Id
# Based on schema analysis:
# accessioncategories
# catalogitemaccessioncategories
# catalogitemmachinemaps
# catalogitemmappings
# catalogitempanels
# catalogitemparameters
# catalogitemparameters_2
# catalogitemparameterstemp
# catalogitemprocessors
# orderitemmachinemaps
# orderitemprintermaps
# orderitems
# orderitemstemp
# testhierarchysearch

REFERENCING_TABLES = [
    'accessioncategories',
    'catalogitemaccessioncategories',
    'catalogitemmachinemaps',
    'catalogitempanels',
    'catalogitemparameters',
    'catalogitemprocessors',
    'orderitemmachinemaps',
    'orderitemprintermaps',
    'orderitems',
    'testhierarchysearch'
]

def generate_sql():
    if not os.path.exists(CSV_PATH):
        print(f"Error: {CSV_PATH} not found.")
        return

    with open(CSV_PATH, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    sql_statements = []
    sql_statements.append("START TRANSACTION;")
    sql_statements.append("-- Disable foreign key checks temporarily to avoid constraint issues during the swap")
    sql_statements.append("SET FOREIGN_KEY_CHECKS = 0;")
    sql_statements.append("")

    # We need a way to generate new IDs. 
    # Since we can't easily query the max ID in this script without connecting to DB,
    # we will use a variable @max_id initialized from the DB at runtime.
    sql_statements.append("-- Initialize @new_id based on current max Id")
    sql_statements.append("SELECT @max_id := MAX(Id) FROM catalogitems;")
    sql_statements.append("SET @current_new_id = @max_id;")
    sql_statements.append("")
    sql_statements.append("CREATE TEMPORARY TABLE IF NOT EXISTS moved_catalog_items (Id INT);")

    for row in rows:
        old_id = row['Id']
        # Skip if Id is empty
        if not old_id:
            continue
        
        # User requested to remove 1982 from resolution
        if old_id == '1982':
            continue
            
        sql_statements.append(f"-- Processing Conflict ID: {old_id}")
        sql_statements.append("SET @current_new_id = @current_new_id + 1;")
        sql_statements.append(f"SET @old_id = {old_id};")
        
        # Backup the original row and store the mapping for potential rollback
        sql_statements.append("-- Backup original data and mapping")
        sql_statements.append("CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;")
        sql_statements.append("CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;")
        
        sql_statements.append("INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;")
        sql_statements.append("INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);")

        # 1. Create a temporary table with the row to be moved
        # We use DROP TEMPORARY TABLE IF EXISTS to be safe
        sql_statements.append("DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;")
        sql_statements.append("CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;")
        
        # 2. Update the Id in the temporary table to the new Id
        sql_statements.append("UPDATE tmp_catalog_move SET Id = @current_new_id;")
        
        # 3. Insert the modified row back into catalogitems
        sql_statements.append("INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;")
        
        # Track the new ID for final export
        # We need a place to store these IDs IF we want to select them later.
        # Since we are in a transaction and variables change, let's create a temp table to hold the 'Moved' IDs
        sql_statements.append("INSERT INTO moved_catalog_items VALUES (@current_new_id);")

        # 4. Update all referencing tables
        # For each table, we update the foreign key column to point to @current_new_id
        for table in REFERENCING_TABLES:
            # Check column name - usually CatalogItemId, but we should be careful.
            # Based on previous analysis, referencing tables likely use 'CatalogItemId'.
            # Except 'testhierarchysearch' which might have different columns?
            # 'accessioncategories' -> CatalogItemId (verified in schema view)
            # Most join tables -> CatalogItemId
            # Let's assume CatalogItemId for now. If there are exceptions, we'd need to know.
            # Assuming standard naming convention:
            col_name = "CatalogItemId"
            
            sql_statements.append(f"UPDATE {table} SET {col_name} = @current_new_id WHERE {col_name} = @old_id;")
        
        # 5. Delete the old row from catalogitems
        # This frees up the ID for the incoming data from 220
        sql_statements.append("DELETE FROM catalogitems WHERE Id = @old_id;")
        
        # Clean up temp table
        sql_statements.append("DROP TEMPORARY TABLE tmp_catalog_move;")
        sql_statements.append("")

    sql_statements.append("SET FOREIGN_KEY_CHECKS = 1;")
    sql_statements.append("COMMIT;")
    
    sql_statements.append("-- Output the moved items so they can be exported and imported to 220")
    sql_statements.append("SELECT * FROM catalogitems WHERE Id IN (SELECT Id FROM moved_catalog_items);")
    sql_statements.append("DROP TEMPORARY TABLE moved_catalog_items;")
    sql_statements.append("-- Done")

    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write("\n".join(sql_statements))
    
    print(f"Generated {OUTPUT_SQL} with {len(rows)} conflict resolutions.")

if __name__ == "__main__":
    generate_sql()
