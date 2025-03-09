-- -----------------------------------------------------
-- Table `customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_number` VARCHAR(20) NOT NULL COMMENT 'Unique identifier for the customer',
  `id_type_id` INT NOT NULL,
  `id_number` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NULL COMMENT 'NULL for corporate customers',
  `last_name` VARCHAR(50) NULL COMMENT 'NULL for corporate customers',
  `company_name` VARCHAR(100) NULL COMMENT 'NULL for individual customers',
  `dob` DATE NULL COMMENT 'Date of birth for individuals, NULL for corporates',
  `mobile` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NULL,
  `street_address` VARCHAR(255) NOT NULL,
  `district_id` INT NOT NULL,
  `birth_country_id` INT NULL COMMENT 'Country of birth, NULL for corporates',
  `residence_country_id` INT NOT NULL COMMENT 'Country of residence',
  `category_id` INT NOT NULL COMMENT 'Individual, Corporate, Sole Proprietor',
  `registration_date` DATE NULL COMMENT 'Required for corporate customers',
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` INT NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_number_UNIQUE` (`customer_number` ASC),
  UNIQUE INDEX `id_number_id_type_UNIQUE` (`id_number` ASC, `id_type_id` ASC),
  INDEX `fk_customers_id_types_idx` (`id_type_id` ASC),
  INDEX `fk_customers_districts_idx` (`district_id` ASC),
  INDEX `fk_customers_countries_birth_idx` (`birth_country_id` ASC),
  INDEX `fk_customers_countries_residence_idx` (`residence_country_id` ASC),
  INDEX `fk_customers_customer_categories_idx` (`category_id` ASC),
  INDEX `fk_customers_users_created_idx` (`created_by` ASC),
  INDEX `fk_customers_users_deleted_idx` (`deleted_by` ASC),
  CONSTRAINT `fk_customers_id_types`
    FOREIGN KEY (`id_type_id`)
    REFERENCES `id_types` (`id_type_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_districts`
    FOREIGN KEY (`district_id`)
    REFERENCES `districts` (`district_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_countries_birth`
    FOREIGN KEY (`birth_country_id`)
    REFERENCES `countries` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_countries_residence`
    FOREIGN KEY (`residence_country_id`)
    REFERENCES `countries` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_customer_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `customer_categories` (`category_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_users_created`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_users_deleted`
    FOREIGN KEY (`deleted_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores customer information';
