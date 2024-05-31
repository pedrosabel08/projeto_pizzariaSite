<?php
include ("conexao.php");

?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pizzaria - Seleção de Sabores</title>
    <link rel="stylesheet" href="stylePizzaVenda.css">
</head>

<body>
    <div class="header">
        <h1 id="header-title">Detalhes da Pizza</h1>
    </div>
    <div class="container">
        <ul>
            <li>
                <h2>Sabores</h2>
            </li>
            <li>
                <p id="num-sabores"></p>
            </li>
            <div class="tabs">
                <li>
                    <button class="tab-button active" onclick="showTab('salgadas')">SALGADAS</button>
                </li>
                <li>
                    <button class="tab-button" onclick="showTab('doces')">DOCES</button>
                </li>
        </ul>
    </div>
    <div id="salgadas" class="tab-content active">
        <div class="pizza-item">
            <?php
            // Supondo que você já tenha uma conexão com o banco de dados
            $sql = "SELECT p.idpizzas, p.nomePizza, GROUP_CONCAT(pr.nomeProduto SEPARATOR ', ') AS ingredientes
        FROM pizzas p
        JOIN pizzas_produtos pp ON p.idpizzas = pp.pizza_id
        JOIN produtos pr ON pp.produto_id = pr.idprodutos
        WHERE p.tipoPizza = 'salgada'
        GROUP BY p.idpizzas";
            $result = mysqli_query($conn, $sql);

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<div class='pizza-item'>";
                    echo "<h3>" . $row['nomePizza'] . "</h3>";
                    echo "<p>Ingredientes: " . $row['ingredientes'] . "</p>";
                    echo "</div>";
                }
            } else {
                echo "Nenhuma pizza encontrada.";
            }
            ?>
        </div>
    </div>
    <div id="doces" class="tab-content">
        <div class="pizza-item">
            <?php
            $sql = "SELECT p.idpizzas, p.nomePizza, GROUP_CONCAT(pr.nomeProduto SEPARATOR ', ') AS ingredientes
                    FROM pizzas p
                    JOIN pizzas_produtos pp ON p.idpizzas = pp.pizza_id
                    JOIN produtos pr ON pp.produto_id = pr.idprodutos
                    WHERE p.tipoPizza = 'doce'
                    GROUP BY p.idpizzas";
            $result = mysqli_query($conn, $sql);

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<div class='pizza-item'>";
                    echo "<h3>" . $row['nomePizza'] . "</h3>";
                    echo "<p>Ingredientes: " . $row['ingredientes'] . "</p>";
                    echo "</div>";
                }
            } else {
                echo "Nenhuma pizza encontrada.";
            }
            ?>
        </div>
    </div>
    <script src="script.js"></script>
</body>

</html>