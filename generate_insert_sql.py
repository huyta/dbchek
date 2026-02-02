
import csv
import os

CSV_PATH = 'catalogitems_202602021056.csv'
OUTPUT_SQL = 'insert_catalog_items.sql'

def generate_insert_script():
    if not os.path.exists(CSV_PATH):
        print(f"Error: {CSV_PATH} not found.")
        return

    with open(CSV_PATH, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        rows = list(reader)
    
    if not rows:
        print("No rows found in CSV.")
        return

    columns = reader.fieldnames
    print(f"DEBUG: Found columns: {columns}")
    sql_statements = []
    
    sql_statements.append("-- Script to insert catalog items from CSV")
    sql_statements.append("START TRANSACTION;")
    sql_statements.append("SET FOREIGN_KEY_CHECKS = 0;")
    sql_statements.append("")

    for row in rows:
        values = []
        for col in columns:
            val = row[col]
            if col in ['CreatedTimestamp', 'UpdatedTimestamp']:
                values.append('NOW()')
            elif val is None or val.strip() == '':
                values.append('NULL')
            else:
                # Escape single quotes
                val_escaped = val.replace("'", "''")
                values.append(f"'{val_escaped}'")
        
        col_names = ", ".join([f"`{c}`" for c in columns])
        val_string = ", ".join(values)
        
        # Using REPLACE INTO to handle potential collisions if cleanup wasn't perfect, 
        # or INSERT IGNORE. User asked to "insert", but given the context of conflict resolution,
        # we assume the IDs are now free (due to the previous task) or we want to overwrite.
        # Let's use INSERT INTO. If it fails, the user will know the previous step didn't run.
        sql_statements.append(f"INSERT INTO `catalogitems` ({col_names}) VALUES ({val_string});")

    sql_statements.append("")
    sql_statements.append("SET FOREIGN_KEY_CHECKS = 1;")
    sql_statements.append("COMMIT;")

    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write("\n".join(sql_statements))

    print(f"Generated {OUTPUT_SQL} with {len(rows)} inserts.")

if __name__ == "__main__":
    generate_insert_script()
