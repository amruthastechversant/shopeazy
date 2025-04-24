<cfif NOT structKeyExists(session, "isLoggedIn") OR NOT session.isLoggedIn>
    <cflocation url="#application.appBasePath#users/cart/cartPage.cfm?showLogin=1" addtoken="no">
</cfif>
<cfinclude  template="checkoutAction.cfm">
<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="../../layouts/header.cfm">
<script src="../../assets/js/cart.js"></script>
<body>
<!--- header div--->
    <cfinclude  template="../../layouts/navbar.cfm">
    <div class="row pt-5 pb-5">
        <div class="col-2"></div>
        <div class="col-8 checkout-col-12">
            <h3 class="text-center mt-0">Checkout</h3>
            <form action="checkoutAction.cfm?finalTotal=#url.finalTotal#" method="POST">
            <div class="checkout-item">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Enter your address">
            </div>
            <div class="checkout-item">
                <label for="payment_option">Payment Option:</label>
                <select id="payment_option" name="payment_option">
                    <option value="Credit Card">Credit Card</option>
                    <option value="PayPal">PayPal</option>
                    <option value="Bank Transfer">Bank Transfer</option>
                </select>
            </div>
            <div class="checkout-item">
                <label for="finaltotalprice">Total Price:</label>
                <div id="finaltotalprice">#encodeForHTML(url.finalTotal)#</div>
            </div>
            <button type="submit" class="pay-now-btn"  name="confirmOrder" >Pay Now</button>
            </form>
        </div>
    </div>


    <cfinclude  template="../../layouts/footer.cfm">  
</body>
</html>
</cfoutput>
