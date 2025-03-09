-- -----------------------------------------------------
-- Table `policy_kins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `policy_kins` (
  `policy_kin_id` INT NOT NULL AUTO_INCREMENT,
  `policy_id` INT NOT NULL,
  `kin_id` INT NOT NULL,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`policy_kin_id`),
  INDEX `fk_policy_kins_policies_idx` (`policy_id` ASC),
  INDEX `fk_policy_kins_next_of_kins_idx` (`kin_id` ASC),
  INDEX `fk_policy_kins_users_idx` (`created_by` ASC),
  CONSTRAINT `fk_policy_kins_policies`
    FOREIGN KEY (`policy_id`)
    REFERENCES `policies` (`policy_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_policy_kins_next_of_kins`
    FOREIGN KEY (`kin_id`)
    REFERENCES `next_of_kins` (`kin_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_policy_kins_users`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Links policies to next of kins';
