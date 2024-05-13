<?php
$servername = "localhost"; // nome do servidor
$username = "root"; // nome de usuário do MySQL
$password = "pedro.amor0808"; // senha do MySQL
$dbname = "bd_pizzaria"; // nome do banco de dados
$port = "3307";

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Verifica a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}
