function navigateToPizza(pizzaName, numSabores) {
    const url = new URL('http://localhost/projeto_pizzariaSite/Vendas/pizzas.php', window.location.origin);
    url.searchParams.set('pizza', pizzaName);
    url.searchParams.set('num_sabores', numSabores);
    window.location.href = url;
}