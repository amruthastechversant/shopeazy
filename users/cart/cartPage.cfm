
<cfif structKeyExists(URL, "showLogin") AND URL.showLogin EQ "1">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("userloginModal").style.display = "block";
        });
    </script>
</cfif>

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="#application.appBasePath#layouts/header.cfm">
<cfinclude  template="cartPageAction.cfm">
<link rel="stylesheet" href="../../assets/css/cartPage.css">
<script src="../../assets/js/cart.js"></script>
<body>
   <cfinclude  template="../../layouts/navbar.cfm">
<div class="container mt-5 mb-5">
   <div class="row"> 
        <!-- Product List Section -->
            <div class="col-md-8">
            <!-- Products -->
                 <div id="deletemessage"></div>
                        <cfif structKeyExists(session, "cart") AND arrayLen(session.cart) GT  0>
                        <cfloop array="#cartItems#" index="item">
                            <div class="col-12 mb-4" style="width: 18rem;">
                                <div class="mx-auto">
                                    <input type="checkbox" name="" value="">
                                    <div class="d-flex ">
                                        <img src="#application.appBasePath##item.image_path#" class="card-img-top" alt="...">
                                        <div class="card-body d-flex flex-column justify-content-between ml-3">
                                            <h5 class="cart-title">#item.str_name#</h5>
                                            <div class="cart-container d-flex flex-column">
                                                <div class="quantity-controls">
                                                    <button class="decrement" onclick="changeQuantity(-1, #item.product_id#, event)">-</button>
                                                    <span id="quantity-#item.product_id#" class="quantity">#item.quantity#</span>
                                                    <button class="increment" onclick="changeQuantity(1, #item.product_id#, event)">+</button>
                                                    <a href=""onclick="deleteCartItem(#item.product_id#)" class="text-danger mt-2">DELETE</a>
                                                </div>
                                                <div class="price mt-auto">
                                                    <span aria-hidden="true">
                                                        <span class="a-price-symbol">&##8377;</span>
                                                        <span class="a-price-whole" id="price_#item.product_id#" data-unit-price="#item.price_at_time_of_addition/item.quantity#">#item.price_at_time_of_addition#</span>
                                                    </span>
                                                </div>
                                                <div>
                                                    <h5class="cart-title">color:
                                                    <span style="display:inline-block; width:20px; height:20px; background-color:#item.selected_color#; border:1px solid ##000;"></span>
                                                    </h5>
                                                    <h5 class="cart-title">size:#item.selected_size#</h5>
                                                    <h5 class="cart-title">material:#item.selected_materials#</h5>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                </div>  
                            </div>
                        </cfloop>
                </div>
                <div class="col-md-4"> 
                        <div class="checkout-box">
                            <h3>Checkout</h3>
                            <div class="pricedetails">
                            <!-- Total Price -->
                            <div class="col-12">
                                <h4>Total: ₹<span id="totalPrice"></span></h4>
                            </div>
                            <!-- Discount Section -->
                            <div class="col-12 mt-3">
                                <h5>Discount: ₹<span id="discount"></span></h5>
                            </div>
                            <!-- Subtotal Section -->
                            <div class="col-12 mt-3">
                                <h5>Subtotal: ₹<span id="subtotal"></span></h5>
                            </div>
                            <!-- Tax Section -->
                            <div class="col-12 mt-3">
                                <h5>Tax (5%): ₹<span id="tax"></span></h5>
                            </div>
                            <!-- Final Total -->
                            <div class="col-12 mt-3">
                                <h4>Final Total: ₹<span id="finalTotal"></span></h4>
                            </div>
                        </div>
                        <!-- Proceed to Buy Button -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <button class="btn btn-primary w-100" type="submit" onclick="getTotalPrice() " >Proceed to Buy</button>
                            </div>
                        </div>
                    </div>
                <cfelse>
                    <div class="text-danger">cart empty</div>
                </cfif>
            </div>
        </div>
    </div>
</cfoutput>


<cfinclude  template="../../layouts/footer.cfm">
</body>
</html>


