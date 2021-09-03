-- MySQL Script generated by MySQL Workbench
-- Fri Sep  3 20:18:00 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`nodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nodes` (
  `idnode` INT NOT NULL,
  `nodename` VARCHAR(45) NULL,
  `idtask` INT NOT NULL,
  PRIMARY KEY (`idnode`, `idtask`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`taskstate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`taskstate` (
  `idtaskstate` INT NOT NULL,
  `taskstatename` VARCHAR(45) NULL,
  PRIMARY KEY (`idtaskstate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tasks` (
  `idusers` INT NOT NULL,
  `task_name` VARCHAR(45) NULL,
  `arguments` VARCHAR(45) NULL,
  `number_of_cores` INT NULL,
  `priority` INT NULL,
  `idtask` INT NOT NULL AUTO_INCREMENT,
  `command` VARCHAR(45) NULL,
  `idtaskstate` INT NOT NULL,
  PRIMARY KEY (`idtask`),
  INDEX `idtaskstate_idx` (`idtaskstate` ASC) VISIBLE,
  CONSTRAINT `idtask`
    FOREIGN KEY (`idtask`)
    REFERENCES `mydb`.`nodes` (`idtask`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idtaskstate`
    FOREIGN KEY (`idtaskstate`)
    REFERENCES `mydb`.`taskstate` (`idtaskstate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `add_to_queue` TINYINT(1) NULL,
  `launch_for_execution` TINYINT NULL,
  `stop` TINYINT NULL,
  `resume_execution` TINYINT NULL,
  `change_priority` TINYINT NULL,
  `fix_completion` TINYINT NULL,
  `delete` TINYINT NULL,
  `user_login` VARCHAR(45) NULL,
  `user_name` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC) VISIBLE,
  CONSTRAINT `idusers`
    FOREIGN KEY (`idusers`)
    REFERENCES `mydb`.`tasks` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
