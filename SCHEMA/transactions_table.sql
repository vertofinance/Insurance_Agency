-- -----------------------------------------------------
-- Table `transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `policy_id` INT NOT NULL,
  `transaction_number` VARCHAR(50) NOT NULL,
  `amount` DECIMAL(15,2) NOT NULL,
  `method_id` INT NOT NULL,
  `transaction_date` DATE NOT NULL,
  `reference_number` VARCHAR(100) NULL COMMENT 'Bank reference, mobile money code, etc.',
  `status` ENUM('Pending', 'Completed', 'Failed') NOT NULL DEFAULT 'Pending',
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  UNIQUE INDEX `transaction_number_UNIQUE` (`transaction_number` ASC),
  INDEX `fk_transactions_policies_idx` (`policy_id` ASC),
  INDEX `fk_transactions_payment_methods_idx` (`method_id` ASC),
  INDEX `fk_transactions_users_idx` (`created_by` ASC),
  CONSTRAINT `fk_transactions_policies`
    FOREIGN KEY (`policy_id`)
    REFERENCES `policies` (`policy_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transactions_payment_methods`
    FOREIGN KEY (`method_id`)
    REFERENCES `payment_methods` (`method_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transactions_users`
    FOREIGN KEY (`created_by`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores payment transactions';
