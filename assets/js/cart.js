
let quantity=0;

function changeQuantity(amount){
    quantity+=amount
    if (quantity <0)
        quantity=0;

    document.getElementById('quantity').innerText=quantity;
    
}

let totalPrice = 0;

function changeQuantity(increment, price,event) {
    const quantitySpan = event.target.parentElement.querySelector('.quantity');
    let quantity = parseInt(quantitySpan.textContent);
    quantity += increment;
    if (quantity < 0) quantity = 0;

    quantitySpan.textContent = quantity;

    // Update total price
    updateTotalPrice();
}

function updateTotalPrice() {
    totalPrice = 0;

    // Add up the total price based on quantities and prices
    const quantities = document.querySelectorAll('.quantity');
    const prices = document.querySelectorAll('.a-price-whole');
    
    for (let i = 0; i < quantities.length; i++) {
        const quantity = parseInt(quantities[i].textContent);
        const price = parseInt(prices[i].textContent.replace(',', '')); // remove commas if present
        totalPrice += quantity * price;
    }

    // Update the total price display
    document.getElementById('totalPrice').textContent = totalPrice.toLocaleString();
}


