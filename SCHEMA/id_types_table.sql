-- -----------------------------------------------------
-- Table `id_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `id_types` (
  `id_type_id` INT NOT NULL AUTO_INCREMENT,
  `id_type_name` VARCHAR(50) NOT NULL COMMENT 'NIDA, TIN, Voters ID, Drivers License, Passport',
  `description` TEXT NULL,
  PRIMARY KEY (`id_type_id`),
  UNIQUE INDEX `id_type_name_UNIQUE` (`id_type_name` ASC)
) ENGINE = InnoDB COMMENT = 'Lookup table for types of identification';

-- Initial ID types data
INSERT INTO `id_types` (`id_type_name`) VALUES 
('NIDA'), ('TIN'), ('Voters ID'), ('Drivers License'), ('Passport');
