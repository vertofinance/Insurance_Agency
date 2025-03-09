-- -----------------------------------------------------
-- Table `document_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `document_types` (
  `doc_type_id` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(50) NOT NULL COMMENT 'ID Copy, Policy Document, Claim Form, Proof of Payment, etc.',
  `description` TEXT NULL,
  `is_required` BOOLEAN NOT NULL DEFAULT FALSE,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`doc_type_id`),
  UNIQUE INDEX `type_name_UNIQUE` (`type_name` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for document types';

-- Initial document types data
INSERT INTO `document_types` (`type_name`, `is_required`) VALUES
('ID Copy', TRUE),
('Policy Document', TRUE),
('Claim Form', FALSE),
('Proof of Payment', FALSE),
('Medical Report', FALSE);