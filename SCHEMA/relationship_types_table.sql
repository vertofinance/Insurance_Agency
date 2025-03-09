-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relationship_types` (
  `relationship_id` INT NOT NULL AUTO_INCREMENT,
  `relationship_name` VARCHAR(50) NOT NULL COMMENT 'Spouse, Child, Parent, Sibling, etc.',
  `description` TEXT NULL,
  PRIMARY KEY (`relationship_id`),
  UNIQUE INDEX `relationship_name_UNIQUE` (`relationship_name` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for relationship types';

-- Initial relationship types data
INSERT INTO `relationship_types` (`relationship_name`) VALUES 
('Spouse'), ('Child'), ('Parent'), ('Sibling'), ('Other Relative'), ('Friend'), ('Business Partner');
