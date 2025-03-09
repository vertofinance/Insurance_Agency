-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(50) NOT NULL COMMENT 'Agency Admin, Sales Agent, Agency Manager, Audit Manager',
  `description` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC)
) ENGINE = InnoDB COMMENT = 'Stores the different user roles in the system';

-- Initial roles data
-- INSERT INTO `user_roles` (`role_name`, `description`) VALUES 
-- ('Agency Admin', 'Administers system, sets parameters, creates users'),
-- ('Sales Agent', 'Handles sales, customer management, and file uploads'),
-- ('Agency Manager', 'Approves sales agents activities, has all sales agent capabilities'),
-- ('Audit Manager', 'Checks system integrity, views logs, audits system');
