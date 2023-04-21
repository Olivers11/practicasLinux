-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema umg_didactica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema umg_didactica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `umg_didactica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `umg_didactica` ;

-- -----------------------------------------------------
-- Table `umg_didactica`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `umg_didactica`.`empleados` (
  `IdPK` INT NOT NULL AUTO_INCREMENT,
  `IdNumero` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(80) NOT NULL,
  `Correo` VARCHAR(150) NOT NULL,
  `Cumpleaños` DATE NOT NULL,
  PRIMARY KEY (`IdPK`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
