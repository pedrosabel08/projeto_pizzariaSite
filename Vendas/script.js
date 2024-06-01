document.addEventListener("DOMContentLoaded", function () {
    const params = new URLSearchParams(window.location.search);
    const pizzaName = params.get('pizza');
    const numSabores = params.get('num_sabores');
    if (pizzaName) {
        const headerTitle = document.getElementById('header-title');
        const price = document.getElementById('total-price')
        const totalPriceInput = document.getElementById('total-price-value')

        let pizzaPrice;

        if (pizzaName == 'PIZZA GIGANTE') {
            pizzaPrice = 87.90;
        }

        if (pizzaName == 'PIZZA GRANDE') {
            pizzaPrice = 76.90;
        }

        if (pizzaName == 'PIZZA MÉDIA') {
            pizzaPrice = 58.90;
        }

        if (pizzaName == 'PIZZA BABY') {
            pizzaPrice = 29.90;
        }

        if (headerTitle) {
            headerTitle.textContent = pizzaName;
        }

        if (price && totalPriceInput) {
            price.textContent = 'R$ ' + pizzaPrice.toFixed(2);
            totalPriceInput.value = pizzaPrice.toFixed(2);
        }

        const numSaboresElements = document.querySelectorAll('#num-sabores, #num-sabores2');

        numSaboresElements.forEach(element => {
            if (element && numSabores) {
                element.textContent += `Selecione até ${numSabores} sabores`;
            }
        });
    }

    let selectedFlavors = [];
    const maxFlavors = parseInt(numSabores) || 2;

    const flavorButtons = document.querySelectorAll('.add-button, .remove-button');
    const selectedFlavorsContainer = document.getElementById('selected-flavors');
    const nextButton = document.getElementById('next-button');
    const selectedIdsInput = document.getElementById('selected-ids');

    flavorButtons.forEach(button => {
        button.addEventListener('click', () => {
            const optionDiv = button.closest('.pizza-item');
            if (!optionDiv) return;

            const flavorId = optionDiv.getAttribute('data-id');
            const flavorName = optionDiv.getAttribute('data-name');

            if (button.classList.contains('add-button')) {
                if (selectedFlavors.length < maxFlavors) {
                    selectedFlavors.push({ id: flavorId, name: flavorName });

                    updateSelectedFlavors();
                    checkNextButton();
                } else {
                    alert(`Você já selecionou o número máximo de sabores (${maxFlavors}).`);
                }
            } else if (button.classList.contains('remove-button')) {
                const index = selectedFlavors.findIndex(flavor => flavor.name === flavorName);
                if (index !== -1) {
                    selectedFlavors.splice(index, 1);
                    updateSelectedFlavors();
                    checkNextButton();
                }
            }
        });
    });

    function updateSelectedFlavors() {
        const uniqueFlavors = Array.from(new Set(selectedFlavors.map(flavor => flavor.name)));
        const flavorCounts = countFlavorOccurrences(selectedFlavors.map(flavor => flavor.name));
        const totalFlavors = selectedFlavors.length;
    
        const flavorList = uniqueFlavors.map(name => {
            const count = flavorCounts[name];
            const fraction = `${count}/${totalFlavors}`;
            return `<p>${fraction} ${name}</p>`;
        });
    
        selectedFlavorsContainer.innerHTML = flavorList.join('');
    
        const selectedIds = selectedFlavors.map(flavor => flavor.id).join(',');
        selectedIdsInput.value = selectedIds;
    }

    function checkNextButton() {
        if (selectedFlavors.length === maxFlavors) {
            nextButton.disabled = false;
        } else {
            nextButton.disabled = true;
        }
    }

    function countFlavorOccurrences(flavors) {
        const counts = {};
        flavors.forEach(flavor => {
            counts[flavor] = (counts[flavor] || 0) + 1;
        });
        return counts;
    }
});