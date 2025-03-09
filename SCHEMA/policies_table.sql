-- -----------------------------------------------------
-- Table `policies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `policies` (
  `policy_id` INT NOT NULL AUTO_INCREMENT,
  `policy_number` VARCHAR(50) NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `sum_insured` DECIMAL(15,2) NOT NULL,
  `premium` DECIMAL(15,2) NOT NULL,
  `commission_amount` DECIMAL(15,2) NOT NULL,
  `issue_date` DATE NOT NULL,
  `start_date` DATE NOT NULL,
  `expiry_date` DATE NOT NULL,
  `status_id` INT NOT NULL,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`policy_id`),
  UNIQUE INDEX `policy_number_UNIQUE` (`policy_number` ASC),
  INDEX `fk_policies_customers_idx` (`customer_id` ASC),
  INDEX `fk_policies_insurance_products_idx` (`product_id` ASC),
  INDEX `fk_policies_policy_statuses_idx` (`status_id` ASC),
  INDEX `fk_policies_users_idx` (`created_by` ASC),
  INDEX `expiry_date_idx` (`expiry_date` ASC),
  CONSTRAINT `fk_policies_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customers` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_policies_insurance_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `insurance_products` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_policies_policy_statuses`
    FOREIGN KEY (`status_id`)
    REFERENCES `policy_statuses` (`status_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_policies_users`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores policy information';
