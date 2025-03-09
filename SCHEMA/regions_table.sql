-- -----------------------------------------------------
-- Table `regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `regions` (
  `region_id` INT NOT NULL AUTO_INCREMENT,
  `region_name` VARCHAR(100) NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`region_id`),
  INDEX `fk_regions_countries_idx` (`country_id` ASC),
  CONSTRAINT `fk_regions_countries`
    FOREIGN KEY (`country_id`)
    REFERENCES `countries` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Lookup table for regions/states/provinces';
