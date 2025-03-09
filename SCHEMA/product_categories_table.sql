-- -----------------------------------------------------
-- Table `product_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(50) NOT NULL COMMENT 'Medical, Life, General',
  `description` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC)
) ENGINE = InnoDB COMMENT = 'Stores insurance product categories';

-- Initial product categories data
INSERT INTO `product_categories` (`category_name`, `description`) VALUES 
('Medical', 'Health insurance products'),
('Life', 'Life insurance products'),
('General', 'General insurance products including motor, property, etc.');
