-- -----------------------------------------------------
-- Table `districts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `districts` (
  `district_id` INT NOT NULL AUTO_INCREMENT,
  `district_name` VARCHAR(100) NOT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`district_id`),
  INDEX `fk_districts_regions_idx` (`region_id` ASC),
  CONSTRAINT `fk_districts_regions`
    FOREIGN KEY (`region_id`)
    REFERENCES `regions` (`region_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB COMMENT = 'Lookup table for districts';
