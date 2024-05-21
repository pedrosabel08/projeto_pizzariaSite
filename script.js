document.addEventListener("DOMContentLoaded", function () {
    var linhasTabela = document.querySelectorAll(".linha-tabela");

    linhasTabela.forEach(function (linha) {
        linha.addEventListener("click", function () {
            linhasTabela.forEach(function (outraLinha) {
                outraLinha.classList.remove("selecionada");
            });

            linha.classList.add("selecionada");

            var idProdutoSelecionado = linha.getAttribute("data-id");
            console.log("Linha selecionada: ID do produto = " + idProdutoSelecionado);
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    var botaoExcluir = document.getElementById("botaoExcluir");

    botaoExcluir.addEventListener("click", function () {
        var linhaSelecionada = document.querySelector(".selecionada");

        if (linhaSelecionada) {
            var idProdutoSelecionado = linhaSelecionada.getAttribute("data-id");

            document.getElementById("idProdutoExcluir").value = idProdutoSelecionado;

            document.getElementById("formExcluirProduto").submit();
        } else {
            console.log("Nenhuma linha selecionada para exclusão.");
        }
    });
});