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

function filterTable() {
    const input = document.getElementById('filterInput');
    const filter = input.value.toLowerCase();
    const table = document.getElementById('tabelaEstoque');
    const trs = table.getElementsByTagName('tr');
    
    for (let i = 1; i < trs.length; i++) {
        const tds = trs[i].getElementsByTagName('td');
        let display = false;
        
        if (tds[0].textContent.toLowerCase().indexOf(filter) > -1) {
            display = true;
        }
        
        trs[i].style.display = display ? '' : 'none';
    }
}