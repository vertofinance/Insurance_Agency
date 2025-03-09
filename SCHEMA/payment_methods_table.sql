-- -----------------------------------------------------
-- Table `payment_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `method_id` INT NOT NULL AUTO_INCREMENT,
  `method_name` VARCHAR(50) NOT NULL COMMENT 'Cash, Bank Transfer, Mobile Money, Cheque',
  `description` TEXT NULL,
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`method_id`),
  UNIQUE INDEX `method_name_UNIQUE` (`method_name` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for payment methods';

-- Initial payment methods data
INSERT INTO `payment_methods` (`method_name`) VALUES
('Cash'), ('Bank Transfer'), ('Mobile Money'), ('Cheque');
