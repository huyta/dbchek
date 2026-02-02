START TRANSACTION;
-- Disable foreign key checks temporarily to avoid constraint issues during the swap
SET FOREIGN_KEY_CHECKS = 0;

-- Initialize @new_id based on current max Id
SELECT @max_id := MAX(Id) FROM catalogitems;
SET @current_new_id = @max_id;

CREATE TEMPORARY TABLE IF NOT EXISTS moved_catalog_items (Id INT);
-- Processing Conflict ID: 2480
SET @current_new_id = @current_new_id + 1;
SET @old_id = 2480;
-- Backup original data and mapping
CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;
CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;
INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;
INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);
DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;
CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;
UPDATE tmp_catalog_move SET Id = @current_new_id;
INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;
INSERT INTO moved_catalog_items VALUES (@current_new_id);
UPDATE accessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemaccessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitempanels SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemparameters SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemprocessors SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemprintermaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitems SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE testhierarchysearch SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
DELETE FROM catalogitems WHERE Id = @old_id;
DROP TEMPORARY TABLE tmp_catalog_move;

-- Processing Conflict ID: 2483
SET @current_new_id = @current_new_id + 1;
SET @old_id = 2483;
-- Backup original data and mapping
CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;
CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;
INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;
INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);
DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;
CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;
UPDATE tmp_catalog_move SET Id = @current_new_id;
INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;
INSERT INTO moved_catalog_items VALUES (@current_new_id);
UPDATE accessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemaccessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitempanels SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemparameters SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemprocessors SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemprintermaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitems SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE testhierarchysearch SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
DELETE FROM catalogitems WHERE Id = @old_id;
DROP TEMPORARY TABLE tmp_catalog_move;

-- Processing Conflict ID: 2486
SET @current_new_id = @current_new_id + 1;
SET @old_id = 2486;
-- Backup original data and mapping
CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;
CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;
INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;
INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);
DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;
CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;
UPDATE tmp_catalog_move SET Id = @current_new_id;
INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;
INSERT INTO moved_catalog_items VALUES (@current_new_id);
UPDATE accessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemaccessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitempanels SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemparameters SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemprocessors SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemprintermaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitems SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE testhierarchysearch SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
DELETE FROM catalogitems WHERE Id = @old_id;
DROP TEMPORARY TABLE tmp_catalog_move;

-- Processing Conflict ID: 2489
SET @current_new_id = @current_new_id + 1;
SET @old_id = 2489;
-- Backup original data and mapping
CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;
CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;
INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;
INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);
DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;
CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;
UPDATE tmp_catalog_move SET Id = @current_new_id;
INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;
INSERT INTO moved_catalog_items VALUES (@current_new_id);
UPDATE accessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemaccessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitempanels SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemparameters SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemprocessors SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemprintermaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitems SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE testhierarchysearch SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
DELETE FROM catalogitems WHERE Id = @old_id;
DROP TEMPORARY TABLE tmp_catalog_move;

-- Processing Conflict ID: 2492
SET @current_new_id = @current_new_id + 1;
SET @old_id = 2492;
-- Backup original data and mapping
CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;
CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;
INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;
INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);
DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;
CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;
UPDATE tmp_catalog_move SET Id = @current_new_id;
INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;
INSERT INTO moved_catalog_items VALUES (@current_new_id);
UPDATE accessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemaccessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitempanels SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemparameters SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemprocessors SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemprintermaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitems SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE testhierarchysearch SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
DELETE FROM catalogitems WHERE Id = @old_id;
DROP TEMPORARY TABLE tmp_catalog_move;

-- Processing Conflict ID: 2495
SET @current_new_id = @current_new_id + 1;
SET @old_id = 2495;
-- Backup original data and mapping
CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;
CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;
INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;
INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);
DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;
CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;
UPDATE tmp_catalog_move SET Id = @current_new_id;
INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;
INSERT INTO moved_catalog_items VALUES (@current_new_id);
UPDATE accessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemaccessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitempanels SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemparameters SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemprocessors SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemprintermaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitems SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE testhierarchysearch SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
DELETE FROM catalogitems WHERE Id = @old_id;
DROP TEMPORARY TABLE tmp_catalog_move;

-- Processing Conflict ID: 2498
SET @current_new_id = @current_new_id + 1;
SET @old_id = 2498;
-- Backup original data and mapping
CREATE TABLE IF NOT EXISTS catalog_conflict_data_backup LIKE catalogitems;
CREATE TABLE IF NOT EXISTS catalog_conflict_map_backup (OldId INT NOT NULL, NewId INT NOT NULL, MovedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (OldId, NewId)) ENGINE=InnoDB;
INSERT IGNORE INTO catalog_conflict_data_backup SELECT * FROM catalogitems WHERE Id = @old_id;
INSERT INTO catalog_conflict_map_backup (OldId, NewId) VALUES (@old_id, @current_new_id);
DROP TEMPORARY TABLE IF EXISTS tmp_catalog_move;
CREATE TEMPORARY TABLE tmp_catalog_move SELECT * FROM catalogitems WHERE Id = @old_id;
UPDATE tmp_catalog_move SET Id = @current_new_id;
INSERT INTO catalogitems SELECT * FROM tmp_catalog_move;
INSERT INTO moved_catalog_items VALUES (@current_new_id);
UPDATE accessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemaccessioncategories SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitempanels SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemparameters SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE catalogitemprocessors SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemmachinemaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitemprintermaps SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE orderitems SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
UPDATE testhierarchysearch SET CatalogItemId = @current_new_id WHERE CatalogItemId = @old_id;
DELETE FROM catalogitems WHERE Id = @old_id;
DROP TEMPORARY TABLE tmp_catalog_move;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
-- Output the moved items so they can be exported and imported to 220
SELECT * FROM catalogitems WHERE Id IN (SELECT Id FROM moved_catalog_items);
DROP TEMPORARY TABLE moved_catalog_items;
-- Done