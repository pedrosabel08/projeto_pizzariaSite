<?php
session_start();
require 'conexao.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $sql = "SELECT * FROM clientes WHERE email = ? AND senha = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $senha);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $_SESSION['loggedin'] = true;
        $_SESSION['email'] = $email;
        header("Location: welcome.php");
    } else {
        echo "Email ou senha incorretos.";
    }
    $stmt->close();
    $conn->close();
}
?>