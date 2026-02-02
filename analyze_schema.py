
import re

schema_path = '/Users/matt/Documents/GitHub/dbchek/hkl-lims-staging-schema-153.sql'

def find_references():
    with open(schema_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    # Split into statements (roughly by ;)
    # or just find create table blocks
    
    tables = []
    
    # Regex for CREATE TABLE
    table_pattern = re.compile(r'CREATE TABLE `(\w+)` \((.*?)\)(?: ENGINE=|$)', re.DOTALL | re.IGNORECASE)
    
    matches = table_pattern.findall(content)
    
    referencing_tables = []
    
    for table_name, body in matches:
        if 'CatalogItemId' in body or 'REFERENCES `catalogitems`' in body.lower():
            referencing_tables.append(table_name)
            
    return referencing_tables

if __name__ == "__main__":
    refs = find_references()
    print("Tables referencing CatalogItems:")
    for t in sorted(refs):
        print(t)
