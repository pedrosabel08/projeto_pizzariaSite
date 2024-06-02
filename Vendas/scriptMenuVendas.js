document.addEventListener("DOMContentLoaded", function () {
    const params = new URLSearchParams(window.location.search);
    const nomeCliente = params.get('nome');
    const clienteId = params.get('cliente_id');

    if (nomeCliente) {
        const loginButton = document.getElementById('login-button');
        const greeting = document.getElementById('greeting');
        const clienteNomeSpan = document.getElementById('cliente-nome');

        loginButton.style.display = 'none';
        clienteNomeSpan.textContent = nomeCliente;
        greeting.style.display = 'inline';
    }

    // Armazena o clienteId em uma variável global para ser usada no onclick dos itens de pizza
    window.clienteId = clienteId;
});

function navigateToPizza(pizzaName, numSabores) {
    const url = new URL('http://localhost/projeto_pizzariaSite/Vendas/pizzas.php', window.location.origin);
    url.searchParams.set('pizza', pizzaName);
    url.searchParams.set('num_sabores', numSabores);
    url.searchParams.set('cliente_id', window.clienteId); // Usando o clienteId armazenado globalmente
    window.location.href = url;
}