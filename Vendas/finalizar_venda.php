<?php
include("conexao.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['pedido_ids']) && isset($_POST['forma_entrega_id']) && isset($_POST['total_price'])) {
        $pedidoIds = $_POST['pedido_ids'];
        $formaEntregaId = $_POST['forma_entrega_id'];
        $totalPrice = $_POST['total_price'];

        $pedidoIdsArray = explode(',', $pedidoIds);

        // Inserir nova venda
        $sqlVenda = "INSERT INTO vendas (forma_entrega_id, data_venda, total) VALUES (?, NOW(), ?)";
        if ($stmtVenda = mysqli_prepare($conn, $sqlVenda)) {
            mysqli_stmt_bind_param($stmtVenda, "id", $formaEntregaId, $totalPrice);
            mysqli_stmt_execute($stmtVenda);
            $vendaId = mysqli_insert_id($conn);
            mysqli_stmt_close($stmtVenda);

            // Associar pedidos à venda
            foreach ($pedidoIdsArray as $pedidoId) {
                $sqlVendaPedidos = "INSERT INTO venda_pedidos (vendas_idvendas, pedidos_idpedidos) VALUES (?, ?)";
                if ($stmtVendaPedidos = mysqli_prepare($conn, $sqlVendaPedidos)) {
                    mysqli_stmt_bind_param($stmtVendaPedidos, "ii", $vendaId, $pedidoId);
                    mysqli_stmt_execute($stmtVendaPedidos);
                    mysqli_stmt_close($stmtVendaPedidos);
                } else {
                    echo "Erro ao preparar a declaração: " . mysqli_error($conn);
                }
            }

            echo "<script>alert('Venda finalizada com sucesso!');window.location.href='vendas.php';</script>";
        } else {
            echo "Erro ao preparar a declaração: " . mysqli_error($conn);
        }
    } else {
        echo "Dados do formulário incompletos.";
    }
} else {
    echo "Método de requisição inválido.";
}

mysqli_close($conn);