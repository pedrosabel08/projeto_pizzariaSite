<?php
include ("conexao.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['selected_ids']) && isset($_POST['total_price']) && isset($_POST['cliente_id']) && isset($_POST['pizza_name'])) {
        $selectedIds = $_POST['selected_ids'];
        $totalPrice = $_POST['total_price'];
        $clienteId = $_POST['cliente_id'];
        $pizzaName = $_POST['pizza_name'];

        $selectedIdsArray = explode(',', $selectedIds);

        $quantidade = 1;

        $pizzaSizeMapping = [
            'PIZZA GIGANTE' => 4,
            'PIZZA GRANDE' => 3,
            'PIZZA MÉDIA' => 2,
            'PIZZA BABY' => 1
        ];

        // Verificar se o nome da pizza está no mapeamento
        if (!isset($pizzaSizeMapping[$pizzaName])) {
            echo "Nome da pizza inválido.";
            exit;
        }

        $tamanho_idtamanho = $pizzaSizeMapping[$pizzaName];
        
        $pedidoItensIds = [];

        $sqlItens = "INSERT INTO pedidos_itens (pizzas_idpizzas, preco_unitario, quantidade, tamanho_idtamanho) VALUES (?, ?, ?, ?)";

        foreach ($selectedIdsArray as $pizzaId) {
            if ($stmt = mysqli_prepare($conn, $sqlItens)) {
                mysqli_stmt_bind_param($stmt, "idii", $pizzaId, $totalPrice, $quantidade, $tamanho_idtamanho);
                mysqli_stmt_execute($stmt);
                $pedidoItemId = mysqli_insert_id($conn);
                $pedidoItensIds[] = $pedidoItemId;
                mysqli_stmt_close($stmt);
            } else {
                echo "Erro ao preparar a declaração: " . mysqli_error($conn);
            }
        }

        $forma_entrega_id = 1;

        $sqlPedido = "INSERT INTO pedidos (data_pedido, total, forma_entrega_id, clientes_id) VALUES (NOW(), ?, ?, ?)";

        if ($stmtPedido = mysqli_prepare($conn, $sqlPedido)) {
            mysqli_stmt_bind_param($stmtPedido, "dii", $totalPrice, $forma_entrega_id, $clienteId);
            mysqli_stmt_execute($stmtPedido);
            $pedidoId = mysqli_insert_id($conn);
            mysqli_stmt_close($stmtPedido);

            foreach ($pedidoItensIds as $pedidoItemId) {
                $sqlPedidoItens = "INSERT INTO pedido_pedidos_itens (pedido_id, pedido_item_id) VALUES (?, ?)";
                if ($stmtPedidoItens = mysqli_prepare($conn, $sqlPedidoItens)) {
                    mysqli_stmt_bind_param($stmtPedidoItens, "ii", $pedidoId, $pedidoItemId);
                    mysqli_stmt_execute($stmtPedidoItens);
                    mysqli_stmt_close($stmtPedidoItens);
                } else {
                    echo "Erro ao preparar a declaração: " . mysqli_error($conn);
                }
            }

            echo "<script>alert('Pedido cadastrado com sucesso!');window.location.href='pedidos.php';</script>";
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
?>