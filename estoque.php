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
        $data_form = date("d-m-Y", strtotime($row['validade']));
        $row['validade'] = $data_form;

        $data[] = $row;
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

    <h2>Lista de Produtos</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Nome do Produto</th>
            <th>Quantidade</th>
            <th>Validade</th>
        </tr>
        <?php foreach ($data as $produto): ?>
            <tr>
                <td><?php echo $produto['idprodutos']; ?></td>
                <td><?php echo $produto['nomeProduto']; ?></td>
                <td><?php echo $produto['quantidade']; ?></td>
                <td><?php echo $produto['validade']; ?></td>
            </tr>
        <?php endforeach; ?>
    </table>

    <footer>
        <p>&copy; sexo</p>
    </footer>
</body>

</html>