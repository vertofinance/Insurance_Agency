-- -----------------------------------------------------
-- Table `claims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `claims` (
  `claim_id` INT NOT NULL AUTO_INCREMENT,
  `claim_number` VARCHAR(50) NOT NULL,
  `policy_id` INT NOT NULL,
  `incident_date` DATE NOT NULL,
  `filing_date` DATE NOT NULL,
  `description` TEXT NOT NULL,
  `claimed_amount` DECIMAL(15,2) NOT NULL,
  `approved_amount` DECIMAL(15,2) NULL,
  `status_id` INT NOT NULL,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` INT NULL,
  PRIMARY KEY (`claim_id`),
  UNIQUE INDEX `claim_number_UNIQUE` (`claim_number` ASC),
  INDEX `fk_claims_policies_idx` (`policy_id` ASC),
  INDEX `fk_claims_claim_statuses_idx` (`status_id` ASC),
  INDEX `fk_claims_users_created_idx` (`created_by` ASC),
  INDEX `fk_claims_users_updated_idx` (`updated_by` ASC),
  CONSTRAINT `fk_claims_policies`
    FOREIGN KEY (`policy_id`)
    REFERENCES `policies` (`policy_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_claims_claim_statuses`
    FOREIGN KEY (`status_id`)
    REFERENCES `claim_statuses` (`status_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_claims_users_created`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_claims_users_updated`
    FOREIGN KEY (`updated_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores insurance claims information';
