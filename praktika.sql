-- MySQL Script generated by MySQL Workbench
-- Fri Sep  3 20:56:38 2021
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
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `add_to_queue` TINYINT(1) NULL,
  `launch_for_execution` TINYINT NULL,
  `stopped` TINYINT NULL,
  `resume_execution` TINYINT NULL,
  `change_priority` TINYINT NULL,
  `fix_completion` TINYINT NULL,
  `deleted` TINYINT NULL,
  `user_login` VARCHAR(45) NULL,
  `user_name` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC) VISIBLE)
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
  INDEX `idusers_idx` (`idusers` ASC) VISIBLE,
  CONSTRAINT `idtask`
    FOREIGN KEY (`idtask`)
    REFERENCES `mydb`.`nodes` (`idtask`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idtaskstate`
    FOREIGN KEY (`idtaskstate`)
    REFERENCES `mydb`.`taskstate` (`idtaskstate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idusers`
    FOREIGN KEY (`idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO users (add_to_queue, launch_for_execution, stopped, resume_execution, change_priority, fix_completion, deleted, user_login, user_name, user_password )

VALUES(0, 0, 0, 0, 0, 0, 0, 'login1', 'name1', 'password1' );

INSERT INTO users (add_to_queue, launch_for_execution, stopped, resume_execution, change_priority, fix_completion, deleted, user_login, user_name, user_password )

VALUES(0, 0, 0, 0, 0, 0, 0, 'login2', 'name2', 'password2' );

INSERT INTO users (add_to_queue, launch_for_execution, stopped, resume_execution, change_priority, fix_completion, deleted, user_login, user_name, user_password )

VALUES(0, 0, 0, 0, 0, 0, 0, 'login3', 'name3', 'password3' );

INSERT INTO tasks (task_name, arguments, number_of_cores, priority, idusers)

VALUES('task1', '1111', 1, 1, 1 );

INSERT INTO tasks (task_name, arguments, number_of_cores, priority, idusers)

VALUES('task2', '2222', 2, 2, 2 );

INSERT INTO tasks (task_name, arguments, number_of_cores, priority, idusers)
VALUES('task3', '3333', 3, 3, 3 );

INSERT INTO tasks (task_name, arguments, number_of_cores, priority, idusers)

VALUES('task4', '4444', 4, 4, 4 );

INSERT INTO taskstate (idtaskstate, taskstatename)

VALUES(1, 'queued');

INSERT INTO taskstate (idtaskstate, taskstatename)

VALUES(2, 'in_progress');

INSERT INTO taskstate (idtaskstate, taskstatename)

VALUES(3, 'paused');

INSERT INTO taskstate (idtaskstate, taskstatename)

VALUES(3, 'completed');

INSERT INTO taskstate (idtaskstate, taskstatename)

VALUES(3, 'deleted');

INSERT INTO nodes (idnode, nodename, idtask)

VALUES(1, 'node1', 1);

INSERT INTO nodes (idnode, nodename, idtask)

VALUES(2, 'node2', 2);




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
