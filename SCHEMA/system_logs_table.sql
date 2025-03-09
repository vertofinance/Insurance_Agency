CREATE TABLE IF NOT EXISTS `system_logs` (
  `log_id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL COMMENT 'User who performed the action',
  `log_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` VARCHAR(50) NOT NULL COMMENT 'INFO, WARNING, ERROR, SECURITY, etc.',
  `activity` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `ip_address` VARCHAR(45) NULL,
  `user_agent` VARCHAR(255) NULL,
  PRIMARY KEY (`log_id`),
  INDEX `fk_system_logs_users_idx` (`user_id` ASC),
  INDEX `log_date_idx` (`log_date` ASC),
  INDEX `log_type_idx` (`log_type` ASC),
  CONSTRAINT `fk_system_logs_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Stores system activity logs';
