
let quantity=0;
const appBasePath = '#application.appBasePath#';

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
    let unit_price =  total_price / quantity;
    quantity += increment;
    if (quantity <= 1){
        event.target.parentElement.querySelector('.decrement').disabled=true;
    }else{
        event.target.parentElement.querySelector('.decrement').disabled = false;  // Enable the decrement button
    }
    total_price = unit_price * quantity;
    total_price = total_price.toFixed(2);//decimal point to 2
    quantitySpan.textContent = quantity;
    document.getElementById('price_'+product_id).textContent = total_price;
    // Update total price
    updateCart(product_id, total_price, quantity);
    updateCartTotalPrice();
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

function updateCartTotalPrice(){
    function setText(id,value){
        const e1=document.getElementById(id);
        if(e1) e1.textContent=value.toFixed(2);

    }
    let total=0;
    document.querySelectorAll('.a-price-whole').forEach(priceEl => {
        total += parseFloat(priceEl.textContent);
    });

const discount=10;
const subtotal=total-discount;
const tax=subtotal*0.5;
const finalTotal=subtotal+tax;
setText('totalPrice',total);
setText('discount',discount);
setText('subtotal',subtotal);
setText('tax',tax);
setText('finalTotal',finalTotal);
// document.getElementById('totalPrice').textContent=total.toFixed(2);
// document.getElementById('discount').textContent=discount.toFixed(2);
// document.getElementById('subtotal').textContent=subtotal.toFixed(2);
// console.log(document.getElementById('subtotal'));   
// document.getElementById('tax').textContent=tax.toFixed(2);
// document.getElementById('finalTotal').textContent=finalTotal.toFixed(2);
}
document.addEventListener("DOMContentLoaded",function(){
    updateCartTotalPrice();
});

function getTotalPrice(){
    const finalTotal=document.getElementById('finalTotal').innerText;
    const encodeTotal=encodeURIComponent(finalTotal);
    window.location.href='../orders/checkout.cfm?finalTotal=' +encodeTotal;
}