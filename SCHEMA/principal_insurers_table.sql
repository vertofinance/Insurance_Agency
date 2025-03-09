-- -----------------------------------------------------
-- Table `principal_insurers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `principal_insurers` (
  `insurer_id` INT NOT NULL AUTO_INCREMENT,
  `insurer_name` VARCHAR(100) NOT NULL,
  `address` TEXT NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contact_person` VARCHAR(100) NULL,
  `tin_number` VARCHAR(50) NOT NULL COMMENT 'Tax Identification Number',
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` INT NULL,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`insurer_id`),
  UNIQUE INDEX `insurer_name_UNIQUE` (`insurer_name` ASC),
  UNIQUE INDEX `tin_number_UNIQUE` (`tin_number` ASC),
  INDEX `fk_principal_insurers_users_idx` (`created_by` ASC),
  CONSTRAINT `fk_principal_insurers_users`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores information about principal insurers';
