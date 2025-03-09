-- -----------------------------------------------------
-- Table `beneficiaries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beneficiaries` (
  `beneficiary_id` INT NOT NULL AUTO_INCREMENT,
  `beneficiary_number` VARCHAR(20) NOT NULL,
  `id_type_id` INT NOT NULL,
  `id_number` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `dob` DATE NOT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NULL,
  `street_address` VARCHAR(255) NOT NULL,
  `district_id` INT NOT NULL,
  `residence_country_id` INT NOT NULL,
  `relationship_id` INT NOT NULL COMMENT 'Relationship to the policy holder',
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` INT NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`beneficiary_id`),
  UNIQUE INDEX `beneficiary_number_UNIQUE` (`beneficiary_number` ASC),
  UNIQUE INDEX `id_number_id_type_UNIQUE` (`id_number` ASC, `id_type_id` ASC),
  INDEX `fk_beneficiaries_id_types_idx` (`id_type_id` ASC),
  INDEX `fk_beneficiaries_districts_idx` (`district_id` ASC),
  INDEX `fk_beneficiaries_countries_idx` (`residence_country_id` ASC),
  INDEX `fk_beneficiaries_relationship_types_idx` (`relationship_id` ASC),
  INDEX `fk_beneficiaries_users_created_idx` (`created_by` ASC),
  INDEX `fk_beneficiaries_users_deleted_idx` (`deleted_by` ASC),
  CONSTRAINT `fk_beneficiaries_id_types`
    FOREIGN KEY (`id_type_id`)
    REFERENCES `id_types` (`id_type_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_beneficiaries_districts`
    FOREIGN KEY (`district_id`)
    REFERENCES `districts` (`district_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_beneficiaries_countries`
    FOREIGN KEY (`residence_country_id`)
    REFERENCES `countries` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_beneficiaries_relationship_types`
    FOREIGN KEY (`relationship_id`)
    REFERENCES `relationship_types` (`relationship_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_beneficiaries_users_created`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_beneficiaries_users_deleted`
    FOREIGN KEY (`deleted_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores beneficiary information';
