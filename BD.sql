-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_pizzaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_pizzaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_pizzaria` ;
USE `bd_pizzaria` ;

-- -----------------------------------------------------
-- Table `bd_pizzaria`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`produtos` (
  `idprodutos` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `validade` DATE NOT NULL,
  PRIMARY KEY (`idprodutos`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
