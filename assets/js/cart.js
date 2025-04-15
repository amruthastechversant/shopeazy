
let quantity=0;

function changeQuantity(amount){
    quantity+=amount
    if (quantity <0)
        quantity=0;

    document.getElementById('quantity').innerText=quantity;
    
}

let totalPrice = 0;

function changeQuantity(increment, product_id,event) {
    const quantitySpan = event.target.parentElement.querySelector('.quantity');
    let quantity = parseInt(quantitySpan.textContent);
    let total_price = document.getElementById('price_'+product_id).textContent;
    let price=total_price/quantity;
    quantity += increment;
    if (quantity < 0){
        quantity = 0;
        event.target.parentElement.querySelector('.decrement').disabled=true;
    }
    if (quantity > 0) {
        event.target.parentElement.querySelector('.decrement').disabled = false;  // Enable the decrement button
    }
    total_price = price * quantity;
    total_price = total_price.toFixed(2);
    quantitySpan.textContent = quantity;
    document.getElementById('price_'+product_id).textContent = total_price;
    // Update total price
    updateCart(product_id, total_price, quantity);
}

function updateCart(product_id, total_price, quantity) {
    $.ajax({
        url: '/myprojects/shopeazy/users/cart/cartPageAction.cfm?updateCart=true',
        type: 'POST',
        data: {
            product_id: product_id,
            total_price: total_price,
            quantity: quantity 
        },
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                window.location.href = response.redirect_url;
            } else {
                $('#errorMessage').text(response.message).show();
            }
        },
        error: function() {
            $('#errorMessage').text('An error occurred. Please try again.').show();
        }
    });
}


