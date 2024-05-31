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
        <ul>
            <li>
                <button onclick="window.history.back();"><img id="logo" src="img/seta-esquerda.png" alt="logo"></button>
            </li>
            <li class="center">
                <h1 id="header-title">Detalhes da Pizza</h1>
            </li>
        </ul>
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
        <?php
        $sql = "SELECT p.idpizzas, p.nomePizza, GROUP_CONCAT(pr.nomeProduto SEPARATOR ', ') AS ingredientes
            FROM pizzas p
            JOIN pizzas_produtos pp ON p.idpizzas = pp.pizza_id
            JOIN produtos pr ON pp.produto_id = pr.idprodutos
            WHERE p.tipoPizza = 'salgada'
            GROUP BY p.idpizzas";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<div class='pizza-item' data-id='" . $row['idpizzas'] . "' data-name='" . $row['nomePizza'] . "'>";
                echo "<h3>" . $row['nomePizza'] . "</h3>";
                echo "<p>Ingredientes: " . $row['ingredientes'] . "</p>";
                echo "<div class='buttons'>";
                echo "<button class='add-button'>+</button>";
                echo "<button class='remove-button'>-</button>";
                echo "</div>";
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
                    echo "<div class='pizza-item' data-id='" . $row['idpizzas'] . "' data-name='" . $row['nomePizza'] . "'>";
                    echo "<h3>" . $row['nomePizza'] . "</h3>";
                    echo "<p>Ingredientes: " . $row['ingredientes'] . "</p>";
                    echo "<div class='buttons'>";
                    echo "<button class='add-button'>+</button>";
                    echo "<button class='remove-button'>-</button>";
                    echo "</div>";
                    echo "</div>";
                }
            } else {
                echo "Nenhuma pizza encontrada.";
            }
            ?>
        </div>
    </div>
    <div class="selection-summary">
        <form action="inserirPedidos.php" method="POST">
            <input type="hidden" name="selected_ids" id="selected-ids">
            <input type="hidden" name="total_price" id="total-price-value">
            <p id="num-sabores2"></p>
            <div id="selected-flavors"></div>
            <p>Total <span id="total-price"></span></p>
            <button type="submit" id="next-button" disabled>PRÓXIMO</button>
        </form>
    </div>
    <script src="script.js"></script>
    <script>
        function showTab(tabName) {
            var i, tabContent, tabLinks;
            tabContent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabContent.length; i++) {
                tabContent[i].style.display = "none";
            }
            tabLinks = document.getElementsByClassName("tab-button");
            for (i = 0; i < tabLinks.length; i++) {
                tabLinks[i].className = tabLinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            event.currentTarget.className += " active";
        }
    </script>
</body>

</html>