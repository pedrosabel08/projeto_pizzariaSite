<?php
session_start();
require 'conexao.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['nome'];
    $sobrenome = $_POST['sobrenome'];
    $telefone = $_POST['telefone'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $sql = "INSERT INTO clientes (nome, sobrenome, telefone, email, senha) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $nome, $sobrenome, $telefone, $email, $senha);

    if ($stmt->execute()) {
        echo "<script>alert('Cadastro de cliente realizado com sucesso!');</script>";
        header("Location: endereco.php?cliente_id=" . $conn->insert_id);
    } else {
        echo "Erro ao realizar cadastro: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
