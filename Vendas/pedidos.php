<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Último Pedido</title>
    <link rel="stylesheet" href="stylePedidos.css">
</head>

<body>
    <div class="container">
        <header class="header">
            <h1>Último Pedido</h1>
        </header>
        <main class="main-content">
            <div class="product">
                <?php
                include ("conexao.php");

                $sql = "SELECT
                    p.idpedidos,
                    p.data_pedido,
                    p.total,
                    pi.preco_unitario,
                    pz.nomePizza AS nomePizza,
                    t.tamanho AS tamanho,
                    GROUP_CONCAT(DISTINCT pr.nomeProduto SEPARATOR ', ') AS ingredientes
                FROM
                    pedidos p
                JOIN
                    pedido_pedidos_itens ppi ON p.idpedidos = ppi.pedido_id
                JOIN
                    pedidos_itens pi ON ppi.pedido_item_id = pi.idpedidos_itens
                JOIN
                    pizzas pz ON pi.pizzas_idpizzas = pz.idpizzas
                JOIN
                    pizzas_produtos pp ON pz.idpizzas = pp.pizza_id
                JOIN
                    produtos pr ON pp.produto_id = pr.idprodutos
                JOIN
                    tamanho t ON pi.tamanho_idtamanho = t.idtamanho
                WHERE
                    p.idpedidos = (SELECT MAX(idpedidos) FROM pedidos)
                GROUP BY
                    p.idpedidos, pi.preco_unitario, pz.nomePizza, t.tamanho
                ORDER BY
                    pi.idpedidos_itens";
                $result = mysqli_query($conn, $sql);
                $totalPedido = 0;

                if (mysqli_num_rows($result) > 0) {
                    $pedidoAtual = null;
                    while ($row = mysqli_fetch_assoc($result)) {
                        if ($pedidoAtual !== $row['idpedidos']) {
                            if ($pedidoAtual !== null) {
                                echo "</ul>";
                                echo "</div>";
                            }
                            echo "<div class='pedido'>";
                            echo "<h2>Pedido #" . $row['idpedidos'] . "</h2>";
                            echo "<p>Data do Pedido: " . $row['data_pedido'] . "</p>";
                            echo "<p>Total: R$ " . number_format($row['total'], 2, ',', '.') . "</p>";
                            echo "<p><strong>Tamanho da Pizza: " . $row['tamanho'] . "</strong></p>";
                            echo "<ul>";
                            $pedidoAtual = $row['idpedidos'];
                            $totalPedido += $row['total'];
                        }
                        echo "<li>";
                        echo "<p>Sabor: " . $row['nomePizza'] . "</p>";
                        echo "<p>Ingredientes: " . $row['ingredientes'] . "</p>";
                        echo "</li>";
                    }
                    echo "</ul>";
                    echo "</div>";
                } else {
                    echo "Nenhum produto encontrado.";
                }

                // Recuperar formas de entrega
                $formasEntrega = mysqli_query($conn, "SELECT idforma_entrega, tipo FROM forma_entrega");

                mysqli_close($conn);
                ?>
            </div>
        </main>
        <footer class="footer">
            <form action="pizzas.php" method="post" class="order-more-form">
                <input type="hidden" name="pedido_ids" value="<?php echo $pedidoAtual; ?>">
                <input type="hidden" name="total_price" value="<?php echo $totalPedido; ?>">
                <button type="submit" class="order-more">+ PEDIR MAIS</button>
            </form>
            <div id="total2">TOTAL: R$ </div>
            <form action="finalizar_venda.php" method="post">
                <input type="hidden" name="pedido_ids" value="<?php echo $pedidoAtual; ?>">
                <input type="hidden" name="total_price" value="<?php echo $totalPedido; ?>">
                <div class="form-group">
                    <label for="forma_entrega">Forma de Entrega:</label>
                    <select name="forma_entrega_id" id="forma_entrega" required>
                        <?php
                        while ($row = mysqli_fetch_assoc($formasEntrega)) {
                            echo "<option value='" . $row['idforma_entrega'] . "'>" . $row['tipo'] . "</option>";
                        }
                        ?>
                    </select>
                </div>
                <button type="submit" class="finalize-order">FINALIZAR VENDA</button>
            </form>
        </footer>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var totalDiv = document.getElementById("total2");
            var formattedPizzaPrice = <?php echo number_format($totalPedido, 2, '.', ''); ?>;
            totalDiv.textContent += formattedPizzaPrice;
        });
    </script>
</body>

</html>