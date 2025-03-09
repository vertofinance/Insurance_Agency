-- -----------------------------------------------------
-- Table `policy_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `policy_statuses` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(50) NOT NULL COMMENT 'Active, Expired, Canceled, Pending, etc.',
  `description` TEXT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE INDEX `status_name_UNIQUE` (`status_name` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for policy statuses';

-- Initial policy statuses data
INSERT INTO `policy_statuses` (`status_name`) VALUES 
('Pending'), ('Active'), ('Expired'), ('Canceled'), ('Suspended');
