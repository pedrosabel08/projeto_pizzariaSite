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
  `tipoPizza` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpizzas`))
ENGINE = InnoDB
AUTO_INCREMENT = 241
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_pizzaria`.`unidademedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`unidademedida` (
  `idunidadeMedida` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idunidadeMedida`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_pizzaria`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_pizzaria`.`produtos` (
  `idprodutos` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `unidadeMedida` INT NOT NULL,
  `validade` DATE NOT NULL,
  PRIMARY KEY (`idprodutos`),
  INDEX `fk_produtos_unidadeMedida1_idx` (`unidadeMedida` ASC),
  CONSTRAINT `fk_produtos_unidadeMedida1`
    FOREIGN KEY (`unidadeMedida`)
    REFERENCES `bd_pizzaria`.`unidademedida` (`idunidadeMedida`))
ENGINE = InnoDB
AUTO_INCREMENT = 241
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
  INDEX `fk_pizza_idx` (`pizza_id` ASC),
  INDEX `fk_produto_idx` (`produto_id` ASC),
  CONSTRAINT `fk_pizza`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `bd_pizzaria`.`pizzas` (`idpizzas`),
  CONSTRAINT `fk_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `bd_pizzaria`.`produtos` (`idprodutos`))
ENGINE = InnoDB
AUTO_INCREMENT = 957
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `bd_pizzaria` ;

-- -----------------------------------------------------
-- function inserirIngredientesPizzas
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inserirIngredientesPizzas`() RETURNS int
    DETERMINISTIC
BEGIN

INSERT INTO pizzas_produtos (pizza_id, produto_id, quantidade) VALUES
('1', '1', '100'),
('1', '6', '100'),
('1', '5', '10'),
('1', '2', '20'),
('1', '4', '20'),
('1', '3', '20'),
('2', '1', '100'),
('2', '6', '100'),
('2', '5', '10'),
('2', '7', '100'),
('2', '8', '30'),
('3', '1', '100'),
('3', '6', '100'),
('3', '5', '10'),
('3', '9', '100'),
('4', '1', '100'),
('4', '6', '100'),
('4', '5', '10'),
('4', '9', '100'),
('4', '10', '30'),
('5', '1', '100'),
('5', '6', '100'),
('5', '5', '10'),
('5', '11', '100'),
('6', '1', '100'),
('6', '6', '100'),
('6', '5', '10'),
('6', '12', '100'),
('7', '1', '100'),
('7', '6', '100'),
('7', '5', '10'),
('7', '13', '100'),
('8', '1', '100'),
('8', '6', '100'),
('8', '5', '10'),
('8', '14', '100'),
('9', '1', '100'),
('9', '6', '100'),
('9', '5', '10'),
('9', '14', '100'),
('9', '7', '50'),
('10', '1', '100'),
('10', '6', '100'),
('10', '5', '10'),
('10', '15', '100'),
('11', '1', '100'),
('11', '6', '100'),
('11', '5', '10'),
('11', '16', '100'),
('11', '17', '50'),
('12', '1', '100'),
('12', '6', '100'),
('12', '5', '10'),
('12', '18', '100'),
('13', '1', '100'),
('13', '6', '100'),
('13', '5', '10'),
('13', '18', '100'),
('13', '17', '50'),
('14', '1', '100'),
('14', '6', '100'),
('14', '5', '10'),
('14', '19', '100'),
('14', '17', '50'),
('15', '1', '100'),
('15', '6', '100'),
('15', '5', '10'),
('15', '20', '50'),
('15', '21', '20'),
('16', '1', '100'),
('16', '6', '100'),
('16', '5', '10'),
('16', '13', '100'),
('16', '20', '30'),
('16', '17', '30'),
('17', '1', '100'),
('17', '6', '100'),
('17', '5', '10'),
('17', '8', '100'),
('18', '1', '100'),
('18', '6', '100'),
('18', '5', '10'),
('18', '16', '80'),
('18', '18', '40'),
('19', '1', '100'),
('19', '6', '100'),
('19', '5', '10'),
('19', '19', '100'),
('20', '1', '100'),
('20', '6', '100'),
('20', '5', '10'),
('20', '20', '100'),
('21', '1', '100'),
('21', '6', '100'),
('21', '5', '10'),
('21', '21', '70'),
('21', '22', '50'),
('21', '6', '30'),
('21', '23', '20'),
('22', '1', '100'),
('22', '6', '100'),
('22', '5', '10'),
('22', '18', '20'),
('22', '24', '20'),
('22', '13', '20'),
('23', '1', '100'),
('23', '6', '100'),
('23', '5', '10'),
('23', '11', '100'),
('23', '16', '30'),
('23', '1', '20'),
('24', '1', '100'),
('24', '6', '100'),
('24', '5', '10'),
('24', '10', '80'),
('24', '19', '40'),
('25', '1', '100'),
('25', '6', '100'),
('25', '5', '10'),
('25', '10', '80'),
('25', '16', '30'),
('25', '19', '30'),
('26', '1', '100'),
('26', '6', '100'),
('26', '5', '10'),
('26', '14', '100'),
('26', '7', '50'),
('27', '1', '100'),
('27', '6', '100'),
('27', '5', '10'),
('27', '7', '100'),
('27', '8', '50'),
('27', '26', '30'),
('28', '1', '100'),
('28', '6', '100'),
('28', '5', '10'),
('28', '11', '100'),
('28', '6', '30'),
('29', '1', '100'),
('29', '6', '100'),
('29', '5', '10'),
('29', '27', '70'),
('29', '28', '70'),
('29', '6', '30'),
('29', '12', '70'),
('29', '29', '20'),
('30', '1', '100'),
('30', '6', '100'),
('30', '5', '10'),
('30', '30', '100'),
('31', '1', '100'),
('31', '6', '100'),
('31', '5', '10'),
('31', '30', '100'),
('31', '0', '20'),
('31', '2', '20'),
('32', '1', '100'),
('32', '6', '100'),
('32', '5', '10'),
('32', '14', '100'),
('32', '31', '30'),
('32', '32', '30'),
('33', '1', '100'),
('33', '6', '100'),
('33', '5', '10'),
('33', '14', '100'),
('33', '32', '50'),
('34', '1', '100'),
('34', '6', '100'),
('34', '5', '10'),
('34', '33', '100'),
('34', '31', '50'),
('34', '19', '50'),
('35', '1', '100'),
('35', '6', '100'),
('35', '5', '10'),
('35', '34', '100'),
('35', '32', '50'),
('36', '1', '100'),
('36', '6', '100'),
('36', '5', '10'),
('36', '9', '100'),
('36', '32', '30'),
('36', '35', '30'),
('36', '36', '10'),
('36', '37', '50'),
('37', '1', '100'),
('37', '6', '100'),
('37', '5', '10'),
('37', '33', '100'),
('37', '6', '30'),
('37', '8', '20'),
('37', '10', '20'),
('38', '1', '100'),
('38', '6', '100'),
('38', '5', '10'),
('38', '28', '100'),
('39', '1', '100'),
('39', '6', '100'),
('39', '5', '10'),
('39', '38', '80'),
('39', '39', '50'),
('40', '1', '100'),
('40', '6', '100'),
('40', '5', '10'),
('40', '27', '100'),
('40', '40', '30'),
('40', '35', '30'),
('41', '1', '100'),
('41', '6', '100'),
('41', '5', '10'),
('41', '16', '30'),
('41', '27', '100'),
('41', '32', '30'),
('42', '1', '100'),
('42', '6', '100'),
('42', '5', '10'),
('42', '41', '100'),
('42', '43', '30'),
('42', '25', '50'),
('43', '1', '100'),
('43', '6', '100'),
('43', '5', '10'),
('43', '42', '100'),
('43', '43', '30'),
('43', '25', '50'),
('44', '1', '100'),
('44', '6', '100'),
('44', '5', '10'),
('44', '33', '100'),
('44', '6', '30'),
('44', '31', '30'),
('45', '1', '100'),
('45', '6', '100'),
('45', '5', '10'),
('45', '28', '100'),
('45', '40', '30'),
('45', '32', '30'),
('46', '1', '100'),
('46', '6', '100'),
('46', '5', '10'),
('46', '33', '100'),
('46', '16', '30'),
('46', '43', '30'),
('46', '7', '50'),
('47', '1', '100'),
('47', '6', '100'),
('47', '5', '10'),
('47', '33', '100'),
('47', '16', '50'),
('47', '35', '50'),
('47', '23', '20'),
('48', '1', '100'),
('48', '6', '100'),
('48', '5', '10'),
('48', '20', '100'),
('48', '10', '70'),
('48', '13', '40'),
('49', '1', '100'),
('49', '6', '100'),
('49', '5', '10'),
('49', '34', '100'),
('49', '10', '50'),
('49', '32', '40'),
('50', '1', '100'),
('50', '6', '100'),
('50', '5', '10'),
('50', '61', '100'),
('50', '62', '40'),
('51', '1', '100'),
('51', '6', '100'),
('51', '5', '10'),
('51', '63', '100'),
('52', '1', '100'),
('52', '6', '100'),
('52', '5', '10'),
('52', '64', '100'),
('53', '1', '100'),
('53', '6', '100'),
('53', '5', '10'),
('53', '64', '100'),
('53', '0', '20'),
('53', '2', '20'),
('54', '1', '100'),
('54', '6', '100'),
('54', '5', '10'),
('54', '64', '100'),
('54', '35', '50'),
('55', '1', '100'),
('55', '6', '100'),
('55', '5', '10'),
('55', '21', '80'),
('55', '65', '100'),
('56', '1', '100'),
('56', '6', '100'),
('56', '5', '10'),
('56', '18', '20'),
('56', '24', '20'),
('56', '13', '20'),
('56', '68', '20'),
('56', '35', '20'),
('57', '1', '100'),
('57', '6', '100'),
('57', '5', '10'),
('57', '66', '100'),
('57', '16', '50'),
('57', '32', '30'),
('58', '1', '100'),
('58', '6', '100'),
('58', '5', '10'),
('58', '67', '100'),
('58', '31', '40'),
('59', '1', '100'),
('59', '6', '100'),
('59', '5', '10'),
('59', '35', '100'),
('59', '68', '50'),
('60', '1', '100'),
('60', '6', '100'),
('60', '5', '10'),
('60', '68', '80'),
('60', '42', '30'),
('61', '1', '100'),
('61', '6', '100'),
('61', '5', '10'),
('61', '64', '100'),
('61', '18', '20'),
('61', '24', '20'),
('61', '13', '20'),
('62', '44', '100'),
('62', '46', '80'),
('62', '47', '30'),
('63', '48', '100'),
('63', '26', '30'),
('63', '45', '80'),
('64', '44', '100'),
('64', '49', '50'),
('64', '47', '30'),
('65', '48', '100'),
('66', '44', '100'),
('67', '44', '100'),
('67', '50', '30'),
('68', '44', '100'),
('68', '51', '50'),
('69', '52', '80'),
('69', '4', '80'),
('69', '32', '30'),
('70', '48', '100'),
('70', '49', '80'),
('70', '30', '30'),
('71', '44', '100'),
('71', '55', '80'),
('72', '26', '50'),
('72', '56', '100'),
('73', '26', '20'),
('73', '57', '50'),
('73', '48', '100'),
('73', '58', '20'),
('73', '47', '50'),
('74', '26', '30'),
('74', '57', '40'),
('74', '44', '100'),
('74', '59', '70'),
('75', '26', '30'),
('75', '47', '100'),
('75', '60', '60'),
('75', '61', '10'),
('76', '26', '30'),
('76', '44', '100'),
('76', '47', '100'),
('76', '62', '50');


RETURN 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inserirPizzas
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inserirPizzas`() RETURNS int
    DETERMINISTIC
BEGIN
SET @id := 0;

UPDATE pizzas SET idpizzas = @id := @id + 1;

INSERT INTO pizzas (nomePizza, tipoPizza) VALUES
('Alho e Óleo', 'salgada'),
('Atum', 'salgada'),
('Bacon', 'salgada'),
('Bacon com Milho', 'salgada'),
('Bolonhesa', 'salgada'),
('Brócolis', 'salgada'),
('Brócolis com Bacon', 'salgada'),
('Calabresa', 'salgada'),
('Chester com Catupiry', 'salgada'),
('Frango', 'salgada'),
('Frango com Catupiry', 'salgada'),
('Lombinho com Catupiry', 'salgada'),
('Marguerita', 'salgada'),
('Milão', 'salgada'),
('Milho', 'salgada'),
('Mussarela', 'salgada'),
('Napolitana', 'salgada'),
('Palmito', 'salgada'),
('Peito de Peru', 'salgada'),
('Portuguesa', 'salgada'),
('Quatro Queijos', 'salgada'),
('Romana', 'salgada'),
('Brócolis com Palmito', 'salgada'),
('Vegetariana', 'salgada'),
('Frango Caipira', 'salgada'),
('Dom Napoli', 'salgada'),
('Calabresa Acebolada', 'salgada'),
('Baiana', 'salgada'),
('Coração', 'salgada'),
('Coração Alho e Óleo', 'salgada'),
('Frango Especial', 'salgada'),
('Gaúcha', 'salgada'),
('Linguiça Blumenau', 'salgada'),
('Mexicana', 'salgada'),
('Dom João', 'salgada'),
('Pepperoni', 'salgada'),
('Tomate Seco com Rúcula', 'salgada'),
('Salame Italiano', 'salgada'),
('Do Cheff', 'salgada'),
('Strogonoff de Carne', 'salgada'),
('Strogonoff de Frango', 'salgada'),
('Magnifica', 'salgada'),
('Pepperoni Especial', 'salgada'),
('Moda da Casa', 'salgada'),
('Moda Pizzaiolo', 'salgada'),
('Peru Light', 'salgada'),
('Alemã', 'salgada'),
('Pepper Brie', 'salgada'),
('Camarão', 'salgada'),
('Mignon', 'salgada'),
('Mignon Alho e Óleo', 'salgada'),
('Mignon com Cheddar', 'salgada'),
('Parmegiana', 'salgada'),
('Seis Queijos', 'salgada'),
('Carne Seca', 'salgada'),
('Costelinha ao Barbecue', 'salgada'),
('Gorgonzola Premium', 'salgada'),
('Gorgonzola Especial', 'salgada'),
('Mignon Four Cheese', 'salgada'),
('Sensação Preto', 'doce'),
('Banana Nevada', 'doce'),
('Brigadeiro', 'doce'),
('Chocolate Branco', 'doce'),
('Chocolate Preto', 'doce'),
('Confete', 'doce'),
('Prestígio', 'doce'),
('Romeu e Julieta', 'doce'),
('Sensação Branco', 'doce'),
('Sonho de Valsa', 'doce'),
('Capuccino', 'doce'),
('Banoffe', 'doce'),
('Charge', 'doce'),
('Beijinho', 'doce'),
('Dois Amores', 'doce');
RETURN 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inserirProdutos
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inserirProdutos`() RETURNS int
    DETERMINISTIC
BEGIN
-- Molho de tomate
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (1, 'Molho de tomate', '5000', 1, '2025-05-20');

    -- Alho
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (2, 'Alho', '500', 1, '2025-05-20');

    -- Alho Frito
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (3, 'Alho Frito', '500', 1, '2025-05-20');

    -- Óleo
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (4, 'Óleo', '10', 2, '2025-05-20');

    -- Orégano
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (5, 'Orégano', '2000', 1, '2025-05-20');

    -- Queijo Mussarela
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (6, 'Queijo Mussarela', '10000', 1, '2025-05-20');

    -- Atum
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (7, 'Atum', '500', 1, '2025-05-20');

    -- Cebola
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (8, 'Cebola', '1000', 1, '2025-05-20');

    -- Bacon
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (9, 'Bacon', '2000', 1, '2025-05-20');

    -- Milho
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (10, 'Milho', '2000', 1, '2025-05-20');

    -- Carne Moída
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (11, 'Carne Moída', '2000', 1, '2025-05-20');

    -- Brócolis
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (12, 'Brócolis', '500', 1, '2025-05-20');

    -- Calabresa
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (13, 'Calabresa', '2000', 1, '2025-05-20');

    -- Chester
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (14, 'Chester', '2000', 1, '2025-05-20');

    -- Catupiry
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (15, 'Catupiry', '2000', 1, '2025-05-20');

    -- Frango
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (16, 'Frango', '2000', 1, '2025-05-20');

    -- Lombo
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (17, 'Lombo', '2000', 1, '2025-05-20');

    -- Tomate
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (18, 'Tomate', '2000', 1, '2025-05-20');

    -- Manjericão
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (19, 'Manjericão', '2000', 1, '2025-05-20');

    -- Parmesão
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (20, 'Parmesão', '2000', 1, '2025-05-20');

    -- Palmito
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (21, 'Palmito', '2000', 1, '2025-05-20');

    -- Peito de Peru
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (22, 'Peito de Peru', '2000', 1, '2025-05-20');

    -- Presunto
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (23, 'Presunto', '2000', 1, '2025-05-20');

    -- Ovo
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (24, 'Ovo', '2000', 1, '2025-05-20');

    -- Azeitona
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (25, 'Azeitona', '2000', 1, '2025-05-20');

    -- Provolone
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (26, 'Provolone', '2000', 1, '2025-05-20');

    -- Batata Palha
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (27, 'Batata Palha', '2000', 1, '2025-05-20');

    -- Creme de Leite
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (28, 'Creme de Leite', '2000', 1, '2025-05-20');

	-- Salame Italiano
    INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (29, 'Salame Italiano', '2000', 1, '2025-05-20');

	-- Pepperoni
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (30, 'Pepperoni', '2000', 1, '2025-05-20');

-- Molho de Pimenta
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (31, 'Molho de pimenta', '2000', 1, '2025-05-20');

-- Coração
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (32, 'Coração', '2000', 1, '2025-05-20');

-- Barbecue
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (33, 'Barbecue', '2000', 1, '2025-05-20');

-- Cream cheese
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (34, 'Cream Cheese', '2000', 1, '2025-05-20');

-- Tiras de Carne
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (35, 'Tiras de Carne', '2000', 1, '2025-05-20');

-- Linguiça Blumenau
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (36, 'Linguiça Blumenau', '2000', 1, '2025-05-20');

-- Cheddar
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (37, 'Cheddar', '2000', 1, '2025-05-20');

-- Pimenta biquinho
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (38, 'Pimenta biquinho', '2000', 1, '2025-05-20');

-- Doritos
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (39, 'Doritos', '2000', 1, '2025-05-20');

-- Tomate Seco
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (40, 'Tomate seco', '2000', 1, '2025-05-20');

-- Rúcula
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (41, 'Rúcula', '2000', 1, '2025-05-20');

-- Azeitonas Pretas
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (42, 'Azeitonas pretas', '2000', 1, '2025-05-20');

-- Strogonoff de carne
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (43, 'Strogonoff de carne', '2000', 1, '2025-05-20');

-- Strogonoff de frango
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (44, 'Strogonoff de frango', '2000', 1, '2025-05-20');

-- Champignon
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (45, 'Champignon', '2000', 1, '2025-05-20');

-- Chocolate Preto
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (46, 'Chocolate Preto', '2000', 1, '2025-05-20');

-- Chocolate Branco
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (47, 'Chocolate Branco', '2000', 1, '2025-05-20');

-- Morango
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (48, 'Morango', '2000', 1, '2025-05-20');

-- Leite Condensado
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (49, 'Leite Condensado', '2000', 1, '2025-05-20');

-- Banana
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (50, 'Banana', '2000', 1, '2025-05-20');

-- Granulado
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (51, 'Granulado', '2000', 1, '2025-05-20');

-- Confetti
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (52, 'Confetti', '2000', 1, '2025-05-20');

-- Creme de coco
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (53, 'Creme de coco', '2000', 1, '2025-05-20');

-- Goiabada
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (54, 'Goiabada', '2000', 1, '2025-05-20');

-- Sonho de valsa
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (55, 'Sonho de valsa', '2000', 1, '2025-05-20');

-- Capuccino
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (56, 'Capuccino', '2000', 1, '2025-05-20');

-- Doce de leite
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (57, 'Doce de leite', '2000', 1, '2025-05-20');

-- Canela
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (58, 'Canela', '2000', 1, '2025-05-20');

-- Amendoim
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (59, 'Amendoim', '2000', 1, '2025-05-20');

-- Coco ralado
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (60, 'Coco ralado', '2000', 1, '2025-05-20');

-- Cereja
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (61, 'Cereja', '2000', 1, '2025-05-20');

-- Marshmallow
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (62, 'Marshmallow', '2000', 1, '2025-05-20');

-- Queijo brie
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (63, 'Queijo brie', '2000', 1, '2025-05-20');

-- Geleia de pimenta
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (64, 'Geleia de pimenta', '2000', 1, '2025-05-20');

-- Camarão
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (65, 'Camarão', '2000', 1, '2025-05-20');

-- Mignon
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (66, 'Mignon', '2000', 1, '2025-05-20');

-- Filé
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (67, 'Filé', '2000', 1, '2025-05-20');

-- Carne seca desfiada
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (68, 'Carne seca desfiada', '2000', 1, '2025-05-20');

-- Costelinha suína desfiada
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (69, 'Costelinha suína desfiada', '2000', 1, '2025-05-20');

-- Gorgonzola
INSERT INTO produtos (idprodutos, nomeProduto, quantidade, unidadeMedida, validade) VALUES (70, 'Gorgonzola', '2000', 1, '2025-05-20');

RETURN 1;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inserirUnidadeMedida
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inserirUnidadeMedida`() RETURNS int
    DETERMINISTIC
BEGIN
	INSERT INTO unidademedida (idunidademedida, nome) VALUES (1, 'Gramas');
	INSERT INTO unidademedida (idunidademedida, nome) VALUES (2, 'Litros');

RETURN 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure inserir_ingredientes_salgada
-- -----------------------------------------------------

DELIMITER $$
USE `bd_pizzaria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_ingredientes_salgada`(IN pizza_id INT)
BEGIN
    INSERT INTO `bd_pizzaria`.`pizzas_produtos` (pizza_id, produto_id, quantidade) VALUES (pizza_id, 1, 100);
    INSERT INTO `bd_pizzaria`.`pizzas_produtos` (pizza_id, produto_id, quantidade) VALUES (pizza_id, 6, 100);
	INSERT INTO `bd_pizzaria`.`pizzas_produtos` (pizza_id, produto_id, quantidade) VALUES (pizza_id, 5, 10);

END$$

DELIMITER ;
USE `bd_pizzaria`;

DELIMITER $$
USE `bd_pizzaria`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bd_pizzaria`.`after_pizza_insert`
AFTER INSERT ON `bd_pizzaria`.`pizzas`
FOR EACH ROW
BEGIN
    IF NEW.tipoPizza = 'salgada' THEN
        CALL `inserir_ingredientes_salgada`(NEW.idpizzas);
    END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
