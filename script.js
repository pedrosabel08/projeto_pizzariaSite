document.addEventListener("DOMContentLoaded", function () {
    var linhasTabela = document.querySelectorAll(".linha-tabela");

    linhasTabela.forEach(function (linha) {
        linha.addEventListener("click", function () {
            // Remove a classe 'selecionada' de todas as linhas da tabela
            linhasTabela.forEach(function (outraLinha) {
                outraLinha.classList.remove("selecionada");
            });

            // Adiciona a classe 'selecionada' à linha clicada
            linha.classList.add("selecionada");

            // Obtém o ID do produto da linha selecionada
            var idProdutoSelecionado = linha.getAttribute("data-id");
            console.log("Linha selecionada: ID do produto = " + idProdutoSelecionado);
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Seleciona o botão de exclusão
    var botaoExcluir = document.getElementById("botaoExcluir");

    // Adiciona um ouvinte de evento de clique ao botão
    botaoExcluir.addEventListener("click", function () {
        // Seleciona a linha marcada como selecionada
        var linhaSelecionada = document.querySelector(".selecionada");

        // Verifica se uma linha foi selecionada
        if (linhaSelecionada) {
            // Obtém o ID do produto da linha selecionada
            var idProdutoSelecionado = linhaSelecionada.getAttribute("data-id");

            // Define o valor do campo hidden com o ID do produto a ser excluído
            document.getElementById("idProdutoExcluir").value = idProdutoSelecionado;

            // Submeta o formulário
            document.getElementById("formExcluirProduto").submit();
        } else {
            console.log("Nenhuma linha selecionada para exclusão.");
        }
    });
});