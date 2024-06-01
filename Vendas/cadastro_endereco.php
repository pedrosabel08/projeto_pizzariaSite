<?php
require 'conexao.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['cliente_id']) && isset($_POST['logradouro']) && isset($_POST['numero']) && isset($_POST['bairro']) && isset($_POST['cidade'])) {
        $cliente_id = $_POST['cliente_id'];
        $logradouro = $_POST['logradouro'];
        $numero = $_POST['numero'];
        $complemento = isset($_POST['complemento']) ? $_POST['complemento'] : '';
        $bairro = $_POST['bairro'];
        $cidade = $_POST['cidade'];

        // Proteção contra SQL Injection
        $cliente_id = $conn->real_escape_string($cliente_id);
        $logradouro = $conn->real_escape_string($logradouro);
        $numero = $conn->real_escape_string($numero);
        $complemento = $conn->real_escape_string($complemento);
        $bairro = $conn->real_escape_string($bairro);
        $cidade = $conn->real_escape_string($cidade);

        $sql = "INSERT INTO endereco (cliente_id, logradouro, numero, complemento, bairro, cidade) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("isisss", $cliente_id, $logradouro, $numero, $complemento, $bairro, $cidade);
        
        if ($stmt->execute()) {
            echo "<script>alert('Cadastro de endereço realizado com sucesso!');</script>";
            header("Location: login_cadastro.html");
        } else {
            echo "Erro ao realizar cadastro: " . $stmt->error;
        }
        
        $stmt->close();
        $conn->close();
    } else {
        echo "Todos os campos são obrigatórios!";
    }
}
?>