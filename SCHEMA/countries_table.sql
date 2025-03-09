-- -----------------------------------------------------
-- Table `countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(100) NOT NULL,
  `country_code` CHAR(2) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC),
  UNIQUE INDEX `country_code_UNIQUE` (`country_code` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for countries';
