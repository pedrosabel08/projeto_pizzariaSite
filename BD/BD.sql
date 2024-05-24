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

INSERT INTO pizzas_produtos (id, pizza_id, produto_id, quantidade) VALUES
('2065', '1', '1', '100'),
('2066', '1', '6', '100'),
('2067', '1', '5', '10'),
('2068', '1', '2', '30'),
('2069', '1', '4', '30'),
('2070', '1', '3', '20'),
('2071', '2', '1', '100'),
('2072', '2', '6', '100'),
('2073', '2', '5', '10'),
('2074', '2', '7', '100'),
('2075', '2', '8', '30'),
('2076', '3', '1', '100'),
('2077', '3', '6', '100'),
('2078', '3', '5', '10'),
('2079', '3', '9', '100'),
('2080', '4', '1', '100'),
('2081', '4', '6', '100'),
('2082', '4', '5', '10'),
('2083', '4', '9', '100'),
('2084', '4', '10', '30'),
('2085', '5', '1', '100'),
('2086', '5', '6', '100'),
('2087', '5', '5', '10'),
('2088', '5', '11', '100'),
('2089', '6', '1', '100'),
('2090', '6', '6', '100'),
('2091', '6', '5', '10'),
('2092', '6', '12', '100'),
('2093', '7', '1', '100'),
('2094', '7', '6', '100'),
('2095', '7', '5', '10'),
('2096', '7', '12', '100'),
('2097', '7', '9', '50'),
('2102', '8', '1', '100'),
('2103', '8', '6', '100'),
('2104', '8', '5', '10'),
('2105', '8', '13', '100'),
('2106', '9', '1', '100'),
('2107', '9', '6', '100'),
('2108', '9', '5', '10'),
('2109', '9', '14', '100'),
('2110', '9', '15', '50'),
('2111', '10', '1', '100'),
('2112', '10', '6', '100'),
('2113', '10', '5', '10'),
('2114', '10', '16', '100'),
('2115', '11', '1', '100'),
('2116', '11', '6', '100'),
('2117', '11', '5', '10'),
('2118', '11', '16', '100'),
('2119', '11', '15', '50'),
('2120', '12', '1', '100'),
('2121', '12', '6', '100'),
('2122', '12', '5', '10'),
('2123', '12', '17', '100'),
('2124', '12', '15', '50'),
('2125', '13', '1', '100'),
('2126', '13', '6', '100'),
('2127', '13', '5', '10'),
('2128', '13', '18', '50'),
('2129', '13', '19', '40'),
('2130', '14', '1', '100'),
('2131', '14', '6', '100'),
('2132', '14', '5', '10'),
('2133', '14', '13', '100'),
('2134', '14', '18', '50'),
('2135', '14', '15', '30'),
('2136', '15', '1', '100'),
('2137', '15', '6', '100'),
('2138', '15', '5', '10'),
('2139', '15', '10', '100'),
('2140', '16', '1', '100'),
('2141', '16', '6', '100'),
('2142', '16', '5', '10'),
('2144', '17', '1', '100'),
('2145', '17', '6', '100'),
('2146', '17', '5', '10'),
('2147', '17', '18', '50'),
('2148', '17', '20', '80'),
('2149', '18', '1', '100'),
('2150', '18', '6', '100'),
('2151', '18', '5', '10'),
('2152', '18', '21', '100'),
('2157', '19', '1', '100'),
('2158', '19', '6', '100'),
('2159', '19', '5', '10'),
('2160', '19', '22', '100'),
('2161', '20', '1', '100'),
('2162', '20', '6', '100'),
('2163', '20', '5', '10'),
('2164', '20', '23', '50'),
('2165', '20', '24', '50'),
('2166', '20', '8', '50'),
('2167', '20', '25', '20'),
('2168', '21', '1', '100'),
('2169', '21', '6', '100'),
('2170', '21', '5', '10'),
('2171', '21', '20', '30'),
('2172', '21', '26', '30'),
('2173', '21', '15', '30'),
('2174', '22', '1', '100'),
('2175', '22', '6', '100'),
('2176', '22', '5', '10'),
('2177', '22', '13', '100'),
('2178', '22', '18', '50'),
('2179', '22', '3', '20'),
('2180', '23', '1', '100'),
('2181', '23', '6', '100'),
('2182', '23', '5', '10'),
('2183', '23', '12', '100'),
('2184', '23', '21', '50'),
('2185', '24', '1', '100'),
('2186', '24', '6', '100'),
('2187', '24', '5', '10'),
('2188', '24', '12', '50'),
('2189', '24', '18', '50'),
('2190', '24', '21', '30'),
('2191', '25', '1', '100'),
('2192', '25', '6', '100'),
('2193', '25', '5', '10'),
('2194', '25', '16', '100'),
('2195', '25', '9', '50'),
('2196', '25', '27', '40'),
('2197', '26', '1', '100'),
('2198', '26', '6', '100'),
('2199', '26', '5', '10'),
('2200', '26', '9', '100'),
('2201', '26', '10', '30'),
('2202', '26', '28', '30'),
('2203', '27', '1', '100'),
('2204', '27', '6', '100'),
('2205', '27', '5', '10'),
('2206', '27', '13', '100'),
('2207', '27', '8', '50'),
('2208', '28', '1', '100'),
('2209', '28', '6', '100'),
('2210', '28', '5', '10'),
('2211', '28', '29', '100'),
('2212', '28', '30', '100'),
('2213', '28', '8', '30'),
('2214', '28', '14', '50'),
('2215', '28', '31', '20'),
('2216', '29', '1', '100'),
('2217', '29', '6', '100'),
('2218', '29', '5', '10'),
('2219', '29', '32', '100'),
('2220', '30', '1', '100'),
('2221', '30', '6', '100'),
('2222', '30', '5', '10'),
('2223', '30', '32', '100'),
('2224', '30', '2', '20'),
('2225', '30', '4', '20'),
('2226', '31', '1', '100'),
('2227', '31', '6', '100'),
('2228', '31', '5', '10'),
('2229', '31', '16', '100'),
('2230', '31', '33', '50'),
('2231', '31', '34', '30'),
('2232', '32', '1', '100'),
('2233', '32', '6', '100'),
('2234', '32', '5', '10'),
('2235', '32', '16', '100'),
('2236', '32', '34', '50'),
('2237', '33', '1', '100'),
('2238', '33', '6', '100'),
('2239', '33', '5', '10'),
('2240', '33', '35', '100'),
('2241', '33', '33', '50'),
('2242', '33', '21', '50'),
('2243', '34', '1', '100'),
('2244', '34', '6', '100'),
('2245', '34', '5', '10'),
('2246', '34', '36', '100'),
('2247', '34', '34', '50'),
('2248', '35', '1', '100'),
('2249', '35', '6', '100'),
('2250', '35', '5', '10'),
('2251', '35', '11', '100'),
('2252', '35', '34', '30'),
('2253', '35', '37', '50'),
('2254', '35', '38', '10'),
('2255', '35', '39', '50'),
('2256', '36', '1', '100'),
('2257', '36', '6', '100'),
('2258', '36', '5', '10'),
('2259', '36', '35', '100'),
('2260', '36', '8', '50'),
('2261', '36', '2', '20'),
('2262', '36', '4', '20'),
('2263', '37', '1', '100'),
('2264', '37', '6', '100'),
('2265', '37', '5', '10'),
('2266', '37', '30', '100'),
('2267', '38', '1', '100'),
('2268', '38', '6', '100'),
('2269', '38', '5', '10'),
('2270', '38', '40', '80'),
('2271', '38', '41', '70'),
('2272', '39', '1', '100'),
('2273', '39', '6', '100'),
('2274', '39', '5', '10'),
('2275', '39', '29', '100'),
('2276', '39', '42', '30'),
('2277', '39', '37', '50'),
('2278', '40', '1', '100'),
('2279', '40', '6', '100'),
('2280', '40', '5', '10'),
('2281', '40', '18', '50'),
('2282', '40', '29', '100'),
('2283', '40', '34', '50'),
('2284', '41', '1', '100'),
('2285', '41', '6', '100'),
('2286', '41', '5', '10'),
('2287', '41', '43', '100'),
('2288', '41', '45', '50'),
('2289', '41', '27', '50'),
('2290', '42', '1', '100'),
('2291', '42', '6', '100'),
('2292', '42', '5', '10'),
('2293', '42', '44', '100'),
('2294', '42', '45', '50'),
('2295', '42', '27', '50'),
('2296', '43', '1', '100'),
('2297', '43', '6', '100'),
('2298', '43', '5', '10'),
('2299', '43', '35', '100'),
('2300', '43', '8', '30'),
('2301', '43', '33', '50'),
('2302', '44', '1', '100'),
('2303', '44', '6', '100'),
('2304', '44', '5', '10'),
('2305', '44', '30', '100'),
('2306', '44', '42', '20'),
('2307', '44', '34', '50'),
('2308', '45', '1', '100'),
('2309', '45', '6', '100'),
('2310', '45', '5', '10'),
('2311', '45', '35', '100'),
('2312', '45', '8', '30'),
('2313', '45', '45', '50'),
('2314', '45', '9', '50'),
('2315', '46', '1', '100'),
('2316', '46', '6', '100'),
('2317', '46', '5', '10'),
('2318', '46', '35', '100'),
('2319', '46', '18', '30'),
('2320', '46', '37', '30'),
('2321', '46', '25', '20'),
('2322', '47', '1', '100'),
('2323', '47', '6', '100'),
('2324', '47', '5', '10'),
('2325', '47', '22', '100'),
('2326', '47', '12', '80'),
('2327', '47', '15', '50'),
('2328', '48', '1', '100'),
('2329', '48', '6', '100'),
('2330', '48', '5', '10'),
('2331', '48', '36', '100'),
('2332', '48', '12', '80'),
('2333', '48', '34', '50'),
('2334', '49', '1', '100'),
('2335', '49', '6', '100'),
('2336', '49', '5', '10'),
('2337', '49', '63', '100'),
('2338', '49', '64', '70'),
('2339', '50', '1', '100'),
('2340', '50', '6', '100'),
('2341', '50', '5', '10'),
('2342', '50', '65', '100'),
('2343', '51', '1', '100'),
('2344', '51', '6', '100'),
('2345', '51', '5', '10'),
('2346', '51', '66', '100'),
('2347', '52', '1', '100'),
('2348', '52', '6', '100'),
('2349', '52', '5', '10'),
('2350', '52', '66', '100'),
('2351', '52', '2', '30'),
('2352', '52', '4', '30'),
('2353', '53', '1', '100'),
('2354', '53', '6', '100'),
('2355', '53', '5', '10'),
('2356', '53', '66', '100'),
('2357', '53', '37', '50'),
('2358', '54', '1', '100'),
('2359', '54', '6', '100'),
('2360', '54', '5', '10'),
('2361', '54', '23', '100'),
('2362', '54', '67', '100'),
('2363', '55', '1', '100'),
('2364', '55', '6', '100'),
('2365', '55', '5', '10'),
('2366', '55', '20', '20'),
('2367', '55', '26', '20'),
('2368', '55', '15', '20'),
('2369', '55', '70', '20'),
('2370', '55', '37', '20'),
('2371', '56', '1', '100'),
('2372', '56', '6', '100'),
('2373', '56', '54', '50'),
('2374', '56', '34', '50'),
('2375', '56', '68', '100'),
('2376', '56', '18', '40'),
('2377', '57', '1', '100'),
('2378', '57', '6', '100'),
('2379', '57', '5', '10'),
('2380', '57', '69', '100'),
('2381', '57', '33', '50'),
('2382', '58', '1', '100'),
('2383', '58', '6', '100'),
('2384', '58', '5', '10'),
('2385', '58', '35', '100'),
('2386', '58', '70', '70'),
('2387', '59', '1', '100'),
('2388', '59', '6', '100'),
('2389', '59', '5', '10'),
('2390', '59', '70', '100'),
('2391', '59', '42', '30'),
('2392', '60', '1', '100'),
('2393', '60', '6', '100'),
('2394', '60', '5', '10'),
('2395', '60', '66', '100'),
('2396', '60', '20', '30'),
('2397', '60', '26', '30'),
('2398', '60', '15', '30'),
('2399', '61', '46', '100'),
('2400', '61', '48', '90'),
('2401', '61', '49', '30'),
('2402', '62', '28', '30'),
('2403', '62', '50', '100'),
('2404', '62', '47', '80'),
('2405', '63', '46', '100'),
('2406', '63', '51', '60'),
('2407', '63', '49', '30'),
('2408', '64', '46', '100'),
('2409', '65', '47', '100'),
('2410', '66', '46', '100'),
('2411', '66', '52', '50'),
('2412', '67', '46', '100'),
('2413', '67', '53', '80'),
('2420', '69', '47', '100'),
('2421', '69', '48', '80'),
('2422', '69', '49', '50'),
('2427', '70', '46', '100'),
('2428', '70', '55', '80'),
('2429', '71', '28', '40'),
('2430', '71', '56', '100'),
('2431', '71', '28', '30'),
('2432', '71', '57', '40'),
('2433', '71', '50', '100'),
('2434', '71', '58', '20'),
('2435', '71', '47', '50'),
('2437', '72', '28', '30'),
('2438', '72', '57', '50'),
('2439', '72', '46', '100'),
('2440', '72', '59', '60'),
('2441', '73', '28', '30'),
('2442', '73', '47', '100'),
('2443', '73', '60', '80'),
('2444', '73', '59', '40'),
('2445', '74', '28', '30'),
('2446', '74', '46', '100'),
('2447', '74', '47', '100'),
('2448', '74', '62', '60'),
('2449', '75', '47', '100'),
('2450', '75', '48', '80'),
('2451', '75', '49', '40'),
('2452', '76', '6', '100'),
('2453', '76', '54', '50'),
('2454', '76', '34', '50');
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
