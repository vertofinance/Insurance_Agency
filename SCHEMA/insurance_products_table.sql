-- -----------------------------------------------------
-- Table `insurance_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `insurance_products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  `category_id` INT NOT NULL,
  `insurer_id` INT NOT NULL COMMENT 'Principal insurer offering this product',
  `description` TEXT NULL,
  `base_rate` DECIMAL(10,2) NULL COMMENT 'Base rate for premium calculation',
  `min_premium` DECIMAL(10,2) NULL,
  `max_premium` DECIMAL(10,2) NULL,
  `commission_rate` DECIMAL(5,2) NOT NULL COMMENT 'Commission percentage for the agency',
  `requires_beneficiary` BOOLEAN NOT NULL DEFAULT FALSE,
  `requires_kin` BOOLEAN NOT NULL DEFAULT FALSE,
  `available_durations` VARCHAR(255) NULL COMMENT 'JSON array of available durations in days',
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_name_insurer_UNIQUE` (`product_name` ASC, `insurer_id` ASC),
  INDEX `fk_insurance_products_product_categories_idx` (`category_id` ASC),
  INDEX `fk_insurance_products_principal_insurers_idx` (`insurer_id` ASC),
  INDEX `fk_insurance_products_users_idx` (`created_by` ASC),
  CONSTRAINT `fk_insurance_products_product_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `product_categories` (`category_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_insurance_products_principal_insurers`
    FOREIGN KEY (`insurer_id`)
    REFERENCES `principal_insurers` (`insurer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_insurance_products_users`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores insurance products information';
