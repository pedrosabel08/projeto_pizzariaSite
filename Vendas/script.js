function showTab(tabName) {
    var i;
    var tabContents = document.getElementsByClassName("tab-content");
    var tabButtons = document.getElementsByClassName("tab-button");

    for (i = 0; i < tabContents.length; i++) {
        tabContents[i].classList.remove("active");
    }

    for (i = 0; i < tabButtons.length; i++) {
        tabButtons[i].classList.remove("active");
    }

    document.getElementById(tabName).classList.add("active");
    event.target.classList.add("active");
}

function navigateToPizza(pizzaName) {
    const url = new URL('pizzas.html', window.location.origin);
    url.searchParams.set('pizza', pizzaName);
    window.location.href = url;
}

document.addEventListener("DOMContentLoaded", function () {
    const params = new URLSearchParams(window.location.search);
    const pizzaName = params.get('pizza');
    const numSabores = params.get('num_sabores');
    if (pizzaName) {
        const headerTitle = document.getElementById('header-title');
        if (headerTitle) {
            headerTitle.textContent = pizzaName;
        }

        const numSaboresElement = document.getElementById('num-sabores');
        if (numSaboresElement && numSabores) {
            numSaboresElement.textContent += `Selecione até ${numSabores} sabores`;
        }
    }
});