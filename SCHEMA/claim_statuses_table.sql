-- -----------------------------------------------------
-- Table `claim_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `claim_statuses` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(50) NOT NULL COMMENT 'Filed, Under Review, Approved, Rejected, Paid, etc.',
  `description` TEXT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE INDEX `status_name_UNIQUE` (`status_name` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for claim statuses';

-- Initial claim statuses data
INSERT INTO `claim_statuses` (`status_name`) VALUES 
('Filed'), ('Under Review'), ('Additional Info Required'), ('Approved'), ('Rejected'), ('Paid');
