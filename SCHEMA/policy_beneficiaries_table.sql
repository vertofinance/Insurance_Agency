-- -----------------------------------------------------
-- Table `policy_beneficiaries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `policy_beneficiaries` (
  `policy_beneficiary_id` INT NOT NULL AUTO_INCREMENT,
  `policy_id` INT NOT NULL,
  `beneficiary_id` INT NOT NULL,
  `percentage` DECIMAL(5,2) NOT NULL COMMENT 'Percentage of benefit allocation',
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`policy_beneficiary_id`),
  INDEX `fk_policy_beneficiaries_policies_idx` (`policy_id` ASC),
  INDEX `fk_policy_beneficiaries_beneficiaries_idx` (`beneficiary_id` ASC),
  INDEX `fk_policy_beneficiaries_users_idx` (`created_by` ASC),
  CONSTRAINT `fk_policy_beneficiaries_policies`
    FOREIGN KEY (`policy_id`)
    REFERENCES `policies` (`policy_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_policy_beneficiaries_beneficiaries`
    FOREIGN KEY (`beneficiary_id`)
    REFERENCES `beneficiaries` (`beneficiary_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_policy_beneficiaries_users`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Links policies to beneficiaries with allocation percentages';

