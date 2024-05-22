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
CREATE SCHEMA IF NOT EXISTS `bd_pizzaria`;
USE `bd_pizzaria` ;

-- -----------------------------------------------------
-- Table `bd_pizzaria`.`pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`pizzas` (
  `idpizzas` INT(11) NOT NULL AUTO_INCREMENT,
  `nomePizza` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpizzas`))
ENGINE = InnoDB
AUTO_INCREMENT = 3;


-- -----------------------------------------------------
-- Table `bd_pizzaria`.`unidademedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`unidademedida` (
  `idunidadeMedida` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idunidadeMedida`))
ENGINE = InnoDB
AUTO_INCREMENT = 4;


-- -----------------------------------------------------
-- Table `bd_pizzaria`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`produtos` (
  `idprodutos` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `unidadeMedida` INT(11) NOT NULL,
  `validade` DATE NOT NULL,
  PRIMARY KEY (`idprodutos`),
  INDEX `fk_produtos_unidadeMedida1_idx` (`unidadeMedida` ASC),
  CONSTRAINT `fk_produtos_unidadeMedida1`
    FOREIGN KEY (`unidadeMedida`)
    REFERENCES `bd_pizzaria`.`unidademedida` (`idunidadeMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 171;


-- -----------------------------------------------------
-- Table `bd_pizzaria`.`pizzas_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`pizzas_produtos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `pizza_id` INT(11) NOT NULL,
  `produto_id` INT(11) NOT NULL,
  `quantidade` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pizza_idx` (`pizza_id` ASC) ,
  INDEX `fk_produto_idx` (`produto_id` ASC) ,
  CONSTRAINT `fk_pizza`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `bd_pizzaria`.`pizzas` (`idpizzas`),
  CONSTRAINT `fk_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `bd_pizzaria`.`produtos` (`idprodutos`))
ENGINE = InnoDB
AUTO_INCREMENT = 4;

USE `bd_pizzaria` ;

-- -----------------------------------------------------
-- function inserirProdutos
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inserirProdutos`() RETURNS int(11)
    DETERMINISTIC
BEGIN
    -- Molho de tomate
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Molho de tomate', '5000', 1, '2025-05-20');

    -- Alho
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Alho', '500', 1, '2025-05-20');

    -- Alho Frito
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Alho Frito', '500', 1, '2025-05-20');

    -- Óleo
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Óleo', '10', 2, '2025-05-20');

    -- Orégano 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Orégano', '2000', 1, '2025-05-20');

    -- Queijo Mussarela
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Queijo Mussarela', '10000', 1, '2025-05-20');

    -- Atum 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Atum', '500', 1, '2025-05-20');

    -- Cebola
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Cebola', '1000', 1, '2025-05-20');

    -- Bacon 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Bacon', '2000', 1, '2025-05-20');

    -- Milho 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Milho', '2000', 1, '2025-05-20');

    -- Carne Moída
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Carne Moída', '2000', 1, '2025-05-20');

    -- Brócolis
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Brócolis', '500', 1, '2025-05-20');

    -- Calabresa
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Calabresa', '2000', 1, '2025-05-20');

    -- Chester
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Chester', '2000', 1, '2025-05-20');

    -- Catupiry
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Catupiry', '2000', 1, '2025-05-20');

    -- Frango
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Frango', '2000', 1, '2025-05-20');

    -- Lombo
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Lombo', '2000', 1, '2025-05-20');

    -- Tomate
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Tomate', '2000', 1, '2025-05-20');

    -- Manjericão
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Manjericão', '2000', 1, '2025-05-20');

    -- Parmesão 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Parmesão', '2000', 1, '2025-05-20');

    -- Palmito 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Palmito', '2000', 1, '2025-05-20');

    -- Peito de Peru
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Peito de Peru', '2000', 1, '2025-05-20');

    -- Presunto 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Presunto', '2000', 1, '2025-05-20');

    -- Ovo 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Ovo', '2000', 1, '2025-05-20');

    -- Azeitona
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Azeitona', '2000', 1, '2025-05-20');

    -- Provolone 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Provolone', '2000', 1, '2025-05-20');

    -- Batata Palha
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Batata Palha', '2000', 1, '2025-05-20');

    -- Creme de Leite
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Creme de Leite', '2000', 1, '2025-05-20');

    -- Salame Italiano
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Salame Italiano', '2000', 1, '2025-05-20');

    -- Pepperoni
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Pepperoni', '2000', 1, '2025-05-20');

    -- Molho de Pimenta
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Molho de pimenta', '2000', 1, '2025-05-20');

    -- Coração
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Coração', '2000', 1, '2025-05-20');

    -- Barbecue
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Barbecue', '2000', 1, '2025-05-20');

    -- Cream cheese
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Cream Cheese', '2000', 1, '2025-05-20');

    -- Tiras de Carne
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Tiras de Carne', '2000', 1, '2025-05-20');

    -- Linguiça Blumenau
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Linguiça Blumenau', '2000', 1, '2025-05-20');

    -- Cheddar
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Cheddar', '2000', 1, '2025-05-20');

    -- Pimenta biquinho
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Pimenta biquinho', '2000', 1, '2025-05-20');

    -- Doritos
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Doritos', '2000', 1, '2025-05-20');

    -- Tomate Seco 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Tomate seco', '2000', 1, '2025-05-20');

    -- Rúcula
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Rúcula', '2000', 1, '2025-05-20');

    -- Azeitonas Pretas
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Azeitonas pretas', '2000', 1, '2025-05-20');

    -- Strogonoff de carne
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Strogonoff de carne', '2000', 1, '2025-05-20');

    -- Strogonoff de frango
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Strogonoff de frango', '2000', 1, '2025-05-20');

    -- Champignon
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Champignon', '2000', 1, '2025-05-20');

    -- Chocolate Preto
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Chocolate Preto', '2000', 1, '2025-05-20');

    -- Chocolate Branco
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Chocolate Branco', '2000', 1, '2025-05-20');

    -- Morango
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Morango', '2000', 1, '2025-05-20');

    -- Leite Condensado
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Leite Condensado', '2000', 1, '2025-05-20');

    -- Banana 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Banana', '2000', 1, '2025-05-20');

    -- Granulado 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Granulado', '2000', 1, '2025-05-20');

    -- Confetti
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Confetti', '2000', 1, '2025-05-20');

    -- Creme de coco
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Creme de coco', '2000', 1, '2025-05-20');

    -- Goiabada
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Goiabada', '2000', 1, '2025-05-20');

    -- Sonho de valsa
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Sonho de valsa', '2000', 1, '2025-05-20');

    -- Capuccino
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Capuccino', '2000', 1, '2025-05-20');

    -- Doce de leite
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Doce de leite', '2000', 1, '2025-05-20');

    -- Canela
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Canela', '2000', 1, '2025-05-20');

    -- Amendoim
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Amendoim', '2000', 1, '2025-05-20');

    -- Coco ralado
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Coco ralado', '2000', 1, '2025-05-20');

    -- Cereja
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Cereja', '2000', 1, '2025-05-20');

    -- Marshmallow
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Marshmallow', '2000', 1, '2025-05-20');

    -- Queijo brie
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Queijo brie', '2000', 1, '2025-05-20');

    -- Geleia de pimenta
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Geleia de pimenta', '2000', 1, '2025-05-20');

    -- Camarão
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Camarão', '2000', 1, '2025-05-20');

    -- Mignon
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Mignon', '2000', 1, '2025-05-20');

    -- Filé
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Filé', '2000', 1, '2025-05-20');

    -- Carne seca desfiada
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Carne seca desfiada', '2000', 1, '2025-05-20');

    -- Costelinha suína desfiada
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Costelinha suína desfiada', '2000', 1, '2025-05-20');

    -- Gorgonzola 
    INSERT INTO produtos (nomeProduto, quantidade, unidadeMedida, validade) VALUES ('Gorgonzola', '2000', 1, '2025-05-20');

    RETURN 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inserirUnidadeMedida
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inserirUnidadeMedida`() RETURNS int(11)
BEGIN
	INSERT INTO unidademedida (idunidademedida, nome) VALUES (1, 'Gramas');
	INSERT INTO unidademedida (idunidademedida, nome) VALUES (2, 'Litros');

RETURN 1;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
