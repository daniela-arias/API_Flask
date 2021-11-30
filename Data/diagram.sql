-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tbb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tbb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tbb` DEFAULT CHARACTER SET utf8 ;
USE `tbb` ;

-- -----------------------------------------------------
-- Table `tbb`.`Season`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbb`.`Season` (
  `id_Season` INT NOT NULL AUTO_INCREMENT,
  `Number` INT NULL,
  PRIMARY KEY (`id_Season`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tbb`.`Episode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbb`.`Episode` (
  `id_episode` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Number_episode` VARCHAR(45) NULL,
  `Season_id_Season` INT NOT NULL,
  PRIMARY KEY (`id_episode`),
  INDEX `fk_Episode_Season1_idx` (`Season_id_Season` ASC) VISIBLE,
  CONSTRAINT `fk_Episode_Season1`
    FOREIGN KEY (`Season_id_Season`)
    REFERENCES `tbb`.`Season` (`id_Season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tbb`.`Actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbb`.`Actors` (
  `id_Actors` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Actors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tbb`.`Dialogue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbb`.`Dialogue` (
  `id_Dialogue` INT NOT NULL AUTO_INCREMENT,
  `Episode_id_episode` INT NOT NULL,
  `Actors_id_Actors` INT NOT NULL,
  `Dialogue` VARCHAR(1000) NULL,
  PRIMARY KEY (`id_Dialogue`),
  INDEX `fk_Dialogue_Episode_idx` (`Episode_id_episode` ASC) VISIBLE,
  INDEX `fk_Dialogue_Actors1_idx` (`Actors_id_Actors` ASC) VISIBLE,
  CONSTRAINT `fk_Dialogue_Episode`
    FOREIGN KEY (`Episode_id_episode`)
    REFERENCES `tbb`.`Episode` (`id_episode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dialogue_Actors1`
    FOREIGN KEY (`Actors_id_Actors`)
    REFERENCES `tbb`.`Actors` (`id_Actors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
