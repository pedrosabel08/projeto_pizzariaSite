-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_pizzaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_pizzaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_pizzaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bd_pizzaria` ;

-- -----------------------------------------------------
-- Table `bd_pizzaria`.`pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`pizzas` (
  `idpizzas` INT NOT NULL AUTO_INCREMENT,
  `nomePizza` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpizzas`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_pizzaria`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`produtos` (
  `idprodutos` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `validade` DATE NOT NULL,
  PRIMARY KEY (`idprodutos`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_pizzaria`.`pizzas_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`pizzas_produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pizza_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pizza_idx` (`pizza_id` ASC) VISIBLE,
  INDEX `fk_produto_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizza`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `bd_pizzaria`.`pizzas` (`idpizzas`),
  CONSTRAINT `fk_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `bd_pizzaria`.`produtos` (`idprodutos`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `bd_pizzaria` ;

-- -----------------------------------------------------
-- function inserirProdutos
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inserirProdutos`() RETURNS int
    DETERMINISTIC
BEGIN
-- Molho de tomate
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (1, 'Molho de tomate', '5 unidades', '2025-06-30');

-- Queijo mozzarella ou muçarela
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (2, 'Queijo mozzarella', '4kg', '2025-05-15');

-- Pepperoni (salame picante)
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (3, 'Pepperoni', '2kg', '2025-04-20');

-- Cogumelos
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (4, 'Cogumelos', '3 caixas', '2025-05-10');

-- Pimentões (verde, vermelho, amarelo)
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (5, 'Pimentão verde', '1kg', '2025-04-30');
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (6, 'Pimentão vermelho', '1kg', '2025-04-30');
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (7, 'Pimentão amarelo', '1kg', '2025-04-30');

-- Cebola
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (8, 'Cebola', '2kg', '2025-05-05');

-- Azeitonas pretas ou verdes
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (9, 'Azeitonas pretas', '500g', '2025-05-20');
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (10, 'Azeitonas verdes', '500g', '2025-05-20');

-- Tomate fresco ou em rodelas
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (11, 'Tomate', '3kg', '2025-05-25');

-- Presunto
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (12, 'Presunto', '2kg', '2025-05-10');

-- Bacon
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (13, 'Bacon', '1kg', '2025-05-15');

-- Salame
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (14, 'Salame', '1kg', '2025-04-25');

-- Abacaxi (em combinação com presunto, em uma pizza havaiana)
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (15, 'Abacaxi em calda', '2 latas', '2025-08-31');

-- Linguiça calabresa
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (16, 'Linguiça calabresa', '1kg', '2025-05-10');

-- Anchovas
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (17, 'Anchovas', '500g', '2025-04-30');

-- Manjericão fresco
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (18, 'Manjericão fresco', '3 maços', '2025-05-15');

-- Espinafre
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (19, 'Espinafre', '1 maço', '2025-05-05');

-- Frango desfiado ou grelhado
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (20, 'Frango desfiado', '1kg', '2025-05-10');

-- Alho
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, validade) VALUES (21, 'Alho', '500g', '2025-05-20');


    RETURN 1;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
