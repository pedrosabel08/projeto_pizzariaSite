<?php
include 'conexao.php';

$sql = "SELECT * FROM produtos";
$result = $conn->query($sql);

$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nomeProduto = $_POST['nomeProduto'];
    $quantidade = $_POST['quantidade'];

    $validadeFormatada = date('Y-m-d', strtotime($_POST['validade']));

    $sql = "INSERT INTO produtos (nomeProduto, quantidade, validade) VALUES ('$nomeProduto', '$quantidade', '$validadeFormatada')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Novo produto inserido com sucesso!');window.location.href='estoque.php';</script>";
    } else {
        echo "Erro ao inserir produto: " . $conn->error;
    }
}
$conn->close();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Estoque</title>
</head>

<body>

    <main>
        <div class="tabela">

            <h2>Estoque</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Nome do Produto</th>
                    <th>Quantidade</th>
                    <th>Validade</th>
                </tr>
                <?php foreach ($data as $produto): ?>
                    <tr class="linha-tabela" data-id="<?php echo $produto['idprodutos']; ?>">
                        <td><?php echo $produto['idprodutos']; ?></td>
                        <td><?php echo $produto['nomeProduto']; ?></td>
                        <td><?php echo $produto['quantidade']; ?></td>
                        <td><?php echo $produto['validade']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </table>
        </div>
        <div class="inserir">
            <h2>Inserir produto: </h2>

            <form action="estoque.php" method="POST">
                <ul>
                    <li>
                        <label for="nomeProduto">Nome Produto: </label>
                        <input type="text" name="nomeProduto" id="nomeProduto">
                    </li>
                    <li>
                        <label for="quantidade">Quantidade: </label>
                        <input type="text" name="quantidade" id="quantidade">
                    </li>
                    <li>
                        <label for="validade">Validade: </label>
                        <input type="date" name="validade" id="validade">
                    </li>
                    <li>
                        <button type="submit">Inserir Produto</button>
                    </li>

                </ul>
            </form>
            <form id="formExcluirProduto" action="excluir.php" method="POST">
                <input type="hidden" name="idprodutos" id="idProdutoExcluir">
                <button type="button" id="botaoExcluir">Excluir Item</button>
            </form>

        </div>
    </main>
    <button class="btn" onclick="window.location.href='produtos.html'">Voltar</button>

    <footer>
        <p>&copy; sexo</p>
    </footer>

    <script src="script.js"></script>
</body>

</html>