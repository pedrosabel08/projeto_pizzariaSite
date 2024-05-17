<?php
include ("conexao.php");

// Consulta SQL para obter as pizzas e seus ingredientes
$sql = "SELECT p.idpizzas, p.nomePizza, pr.nomeProduto, pp.quantidade 
        FROM pizzas AS p
        LEFT JOIN pizzas_produtos AS pp ON p.idpizzas = pp.pizza_id
        LEFT JOIN produtos AS pr ON pp.produto_id = pr.idprodutos
        ORDER BY p.idpizzas, pr.nomeProduto";

$result = $conn->query($sql);

$pizzas = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $pizza_id = $row['idpizzas'];
        if (!isset($pizzas[$pizza_id])) {
            $pizzas[$pizza_id] = [
                'nomePizza' => $row['nomePizza'],
                'ingredientes' => []
            ];
        }
        if ($row['nomeProduto']) {
            $pizzas[$pizza_id]['ingredientes'][] = [
                'nomeProduto' => $row['nomeProduto'],
                'quantidade' => $row['quantidade']
            ];
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylePizza.css">
    <title>Adicionar Pizza</title>
</head>

<body>
    <main>
        <div class="pizzas">
            <h2>Pizzas Cadastradas</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Nome da Pizza</th>
                        <th>Ingredientes</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($pizzas as $pizza): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($pizza['nomePizza']); ?></td>
                            <td>
                                <?php if (count($pizza['ingredientes']) > 0): ?>
                                    <ul>
                                        <?php foreach ($pizza['ingredientes'] as $ingrediente): ?>
                                            <li>
                                                <?php echo htmlspecialchars($ingrediente['nomeProduto']) . " - " . htmlspecialchars($ingrediente['quantidade']); ?>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                <?php else: ?>
                                    Nenhum ingrediente cadastrado.
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <div class="addPizza">
            <h2>Adicionar Pizza</h2>
            <form id="pizza-form" method="post" action="adicionar_pizza.php">
                <div class="Nome">
                    <label for="pizza_name">Nome da Pizza:</label>
                    <input type="text" id="pizza_name" name="pizza_name" required>
                </div>
                <div id="ingredients-container">
                    <div class="ingredient-row">
                        <select name="ingredients[]" class="ingredient-select">
                            <?php
                            // Conexão com o banco de dados
                            $conn = new mysqli($servername, $username, $password, $dbname, $port);
                            if ($conn->connect_error) {
                                die("Conexão falhou: " . $conn->connect_error);
                            }

                            // Busca ingredientes
                            $sql = "SELECT idprodutos, nomeProduto FROM produtos";
                            $result = $conn->query($sql);

                            if ($result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    echo "<option value='" . $row["idprodutos"] . "'>" . $row["nomeProduto"] . "</option>";
                                }
                            }

                            $conn->close();
                            ?>
                        </select>
                        <input type="number" name="quantities[]" class="ingredient-quantity" placeholder="Quantidade"
                            min="1">
                        <button type="button" class="remove-ingredient">Remover</button>
                    </div>
                </div>
                <button type="button" id="add-ingredient">Adicionar Ingrediente</button>
                <button type="submit">Salvar Pizza</button>
            </form>
        </div>
    </main>
    <script src="scriptPizza.js"></script>
</body>

</html>