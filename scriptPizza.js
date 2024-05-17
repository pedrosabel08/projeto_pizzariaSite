document.addEventListener('DOMContentLoaded', () => {
    const ingredientsContainer = document.getElementById('ingredients-container');
    const addIngredientButton = document.getElementById('add-ingredient');

    function createIngredientRow() {
        const ingredientRow = document.createElement('div');
        ingredientRow.className = 'ingredient-row';

        const ingredientSelect = document.createElement('select');
        ingredientSelect.name = 'ingredients[]';
        ingredientSelect.className = 'ingredient-select';

        const firstSelect = document.querySelector('.ingredient-select');
        ingredientSelect.innerHTML = firstSelect.innerHTML;

        const ingredientQuantity = document.createElement('input');
        ingredientQuantity.type = 'number';
        ingredientQuantity.name = 'quantities[]';
        ingredientQuantity.className = 'ingredient-quantity';
        ingredientQuantity.placeholder = 'Quantidade';
        ingredientQuantity.min = '1';

        const removeButton = document.createElement('button');
        removeButton.type = 'button';
        removeButton.className = 'remove-ingredient';
        removeButton.textContent = 'Remover';
        removeButton.addEventListener('click', () => {
            ingredientRow.remove();
        });

        ingredientRow.appendChild(ingredientSelect);
        ingredientRow.appendChild(ingredientQuantity);
        ingredientRow.appendChild(removeButton);

        return ingredientRow;
    }

    addIngredientButton.addEventListener('click', () => {
        const newIngredientRow = createIngredientRow();
        ingredientsContainer.appendChild(newIngredientRow);
    });
});
