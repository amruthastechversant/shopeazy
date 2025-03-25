<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="../../layouts/header.cfm">
<body>
<!--- header div--->
    <cfinclude  template="../../layouts/navbar.cfm">
    <div class="row pt-5 pb-5">
        <div class="col-2"></div>
        <div class="col-8 checkout-col-12">
            <h3 class="text-center mt-0">Checkout</h3>
            <div class="checkout-item">
                <label for="address">Address:</label>
                <input type="text" id="address" placeholder="Enter your address">
            </div>
            <div class="checkout-item">
                <label for="payment-option">Payment Option:</label>
                <select id="payment-option">
                    <option value="credit-card">Credit Card</option>
                    <option value="paypal">PayPal</option>
                    <option value="bank-transfer">Bank Transfer</option>
                </select>
            </div>
            <div class="checkout-item">
                <label for="total-price">Total Price:</label>
                <div id="total-price">$100.00</div>
            </div>
            <button class="pay-now-btn" onclick="window.location.href='#application.appBasePath#users/orders/confirmationPage.cfm'">Pay Now</button>
        </div>
    </div>


    <cfinclude  template="../../layouts/footer.cfm">  
</body>
</html>
</cfoutput>
