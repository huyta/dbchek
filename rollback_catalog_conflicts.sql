-- Rollback Script for Catalog Conflicts
-- USE WITH CAUTION: This will revert the ID moves and restore the original data.
-- It assumes 'catalog_conflict_map_backup' and 'catalog_conflict_data_backup' exist.

START TRANSACTION;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Revert references in related tables
-- We update the Foreign Keys back from NewId to OldId
UPDATE accessioncategories T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE catalogitemaccessioncategories T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE catalogitemmachinemaps T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
-- UPDATE catalogitemmappings T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE catalogitempanels T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE catalogitemparameters T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE catalogitemprocessors T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE orderitemmachinemaps T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE orderitemprintermaps T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE orderitems T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;
UPDATE testhierarchysearch T JOIN catalog_conflict_map_backup M ON T.CatalogItemId = M.NewId SET T.CatalogItemId = M.OldId;

-- 2. Clear the 'Imported/Conflict' data at the Old ID
-- These are the rows that were inserted/used after we freed up the ID.
-- We must remove them to make space for the backup restoration.
DELETE C 
FROM catalogitems C
JOIN catalog_conflict_map_backup M ON C.Id = M.OldId;

-- 3. Restore the Original Data from Backup
-- This inserts the rows exactly as they were (with OldId)
INSERT IGNORE INTO catalogitems 
SELECT * FROM catalog_conflict_data_backup;

-- 4. Delete the 'Moved' copies (NewId)
-- Since we've restored the original and updated refs, these temp copies are invalid.
DELETE C 
FROM catalogitems C
JOIN catalog_conflict_map_backup M ON C.Id = M.NewId;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;

-- Optional: Clean up backup tables
-- DROP TABLE catalog_conflict_map_backup;
-- DROP TABLE catalog_conflict_data_backup;
