function navigateToPizza(pizzaName, numSabores) {
    const url = new URL('http://localhost/projeto_pizzariaSite/Vendas/pizzas.php', window.location.origin);
    url.searchParams.set('pizza', pizzaName);
    url.searchParams.set('num_sabores', numSabores);
    window.location.href = url;
}

document.addEventListener("DOMContentLoaded", function () {
    const params = new URLSearchParams(window.location.search);
    const nomeCliente = params.get('nome');

    if (nomeCliente) {
        const loginButton = document.getElementById('login-button');
        const greeting = document.getElementById('greeting');
        const clienteNomeSpan = document.getElementById('cliente-nome');

        loginButton.style.display = 'none';

        clienteNomeSpan.textContent = nomeCliente;
        greeting.style.display = 'inline';
    }
});