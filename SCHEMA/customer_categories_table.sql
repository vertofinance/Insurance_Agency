-- -----------------------------------------------------
-- Table `customer_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer_categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(50) NOT NULL COMMENT 'Individual, Corporate, Sole Proprietor',
  `description` TEXT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for customer categories';

-- Initial customer categories data
INSERT INTO `customer_categories` (`category_name`) VALUES 
('Individual'), ('Corporate'), ('Sole Proprietor');
