<?php
// Inclui o arquivo de conexão
include 'conexao.php';

// Query para selecionar os dados da tabela
$sql = "SELECT * FROM produtos";
$result = $conn->query($sql);

// Verifica se há resultados e armazena-os em um array
$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Verifica se os dados do formulário foram enviados
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Coleta os dados do formulário
    $nomeProduto = $_POST['nomeProduto'];
    $quantidade = $_POST['quantidade'];

    // Converte a data de validade para o formato esperado pelo MySQL
    $validadeFormatada = date('Y-m-d', strtotime($_POST['validade']));

    // Query para inserir os dados na tabela produtos
    $sql = "INSERT INTO produtos (nomeProduto, quantidade, validade) VALUES ('$nomeProduto', '$quantidade', '$validadeFormatada')";

    // Executa a query
    if ($conn->query($sql) === TRUE) {
        // Mensagem de sucesso
        echo "<script>alert('Novo produto inserido com sucesso!');window.location.href='estoque.php';</script>";
    } else {
        // Mensagem de erro
        echo "Erro ao inserir produto: " . $conn->error;
    }
}
// Fecha a conexão com o banco de dados
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
            <h2>Lista de Produtos</h2>
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
                        <label for="nomeProduto">Nome Produto</label>
                        <input type="text" name="nomeProduto" id="nomeProduto">
                    </li>
                    <li>
                        <label for="quantidade">Quantidade</label>
                        <input type="text" name="quantidade" id="quantidade">
                    </li>
                    <li>
                        <label for="validade">Validade</label>
                        <input type="date" name="validade" id="validade">
                    </li>
                    <li>
                        <button type="submit">Inserir Produto</button>
                    </li>

                </ul>
            </form>
            <form id="formExcluirProduto" action="excluir_produto.php" method="POST">
                <input type="hidden" name="idprodutos" id="idProdutoExcluir">
                <button type="button" id="botaoExcluir">Excluir Item</button>
            </form>

        </div>
    </main>
    <footer>
        <p>&copy; sexo</p>
    </footer>

    <script src="script.js"></script>
</body>

</html>