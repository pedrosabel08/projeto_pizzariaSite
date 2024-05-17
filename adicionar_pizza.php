<?php

include("conexao.php");

$pizza_name = $_POST['pizza_name'];
$ingredients = $_POST['ingredients'];
$quantities = $_POST['quantities'];

$sql_pizza = "INSERT INTO pizzas (nomePizza) VALUES (?)";
$stmt_pizza = $conn->prepare($sql_pizza);
$stmt_pizza->bind_param("s", $pizza_name);
$stmt_pizza->execute();
$pizza_id = $stmt_pizza->insert_id;
$stmt_pizza->close();

$sql_ingredient = "INSERT INTO pizzas_produtos (pizza_id, produto_id, quantidade) VALUES (?, ?, ?)";
$stmt_ingredient = $conn->prepare($sql_ingredient);

for ($i = 0; $i < count($ingredients); $i++) {
    $ingredient_id = $ingredients[$i];
    $quantity = $quantities[$i];
    $stmt_ingredient->bind_param("iii", $pizza_id, $ingredient_id, $quantity);
    $stmt_ingredient->execute();
}

$stmt_ingredient->close();
$conn->close();

header("Location: sucesso.html");
exit();
?>
