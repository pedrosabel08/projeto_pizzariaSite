var totalPriceInput = document.getElementById("total");

var totalDiv = document.getElementById("total2");

var formattedPizzaPrice = totalPedido.toFixed(2);

totalPriceInput.value = formattedPizzaPrice;

totalDiv.textContent = "TOTAL: R$ " + formattedPizzaPrice;
console.log("total2");