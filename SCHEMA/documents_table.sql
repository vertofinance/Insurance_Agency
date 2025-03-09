-- -----------------------------------------------------
-- Table `documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `documents` (
  `document_id` INT NOT NULL AUTO_INCREMENT,
  `doc_type_id` INT NOT NULL,
  `reference_id` INT NOT NULL COMMENT 'ID of related entity (policy_id, claim_id, etc.)',
  `reference_type` VARCHAR(50) NOT NULL COMMENT 'Policy, Claim, Customer, etc.',
  `file_name` VARCHAR(255) NOT NULL,
  `file_path` VARCHAR(500) NOT NULL COMMENT 'Storage location of the file',
  `file_size` BIGINT NOT NULL COMMENT 'Size in bytes',
  `file_type` VARCHAR(50) NOT NULL COMMENT 'PDF, JPG, PNG, etc.',
  `uploaded_by` INT NOT NULL,
  `uploaded_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`document_id`),
  INDEX `fk_documents_doc_types_idx` (`doc_type_id` ASC),
  INDEX `fk_documents_users_idx` (`uploaded_by` ASC),
  INDEX `reference_idx` (`reference_id` ASC, `reference_type` ASC),
  CONSTRAINT `fk_documents_doc_types`
    FOREIGN KEY (`doc_type_id`)
    REFERENCES `document_types` (`doc_type_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_documents_users`
    FOREIGN KEY (`uploaded_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores uploaded documents related to various entities';
