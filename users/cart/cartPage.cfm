<cfoutput>
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="../../layouts/header.cfm">
<link rel="stylesheet" href="../../assets/css/cartPage.css">
<script src="../../assets/js/cart.js"></script>
<body>
   <cfinclude  template="../../layouts/navbar.cfm">
     <div class="container mt-5 mb-5">
    <div class="row">
        <!-- Product List Section -->
        <div class="col-md-8">
            <!-- Product 1 -->
            <div class="col-12 mb-4" style="width: 18rem;">
                <div class="mx-auto">
                    <input type="checkbox" name="" value="">
                    <div class="d-flex ">
                        <img src="../../productImages/Apple iPhone 15.jpg" class="card-img-top" alt="...">
                        <div class="card-body d-flex flex-column justify-content-between ml-3">
                            <h5 class="cart-title">Apple iPhone 15 (128 GB) - Black</h5>
                            <div class="cart-container">
                                <div class="quantity-controls">
                                   <button class="decrement" onclick="changeQuantity(-1, 61900, event)">-</button>
                                        <span id="quantity-1" class="quantity">1</span>
                                    <button class="increment" onclick="changeQuantity(1, 61900, event)">+</button>

                                </div>
                            </div>
                            <div class="price">
                                <span aria-hidden="true">
                                    <span class="a-price-symbol">&##8377;</span>
                                    <span class="a-price-whole" id="price1">61,900</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>

            <!-- Product 2 -->
            <div class="col-12 mb-4" style="width: 18rem;">
                <div class="mx-auto">
                    <input type="checkbox" name="" value="">
                    <div class="d-flex ">
                        <img src="../../productImages/iphone16_.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">iPhone 16 256 GB: 5G Black</h5>
                            <div class="cart-container">
                                <div class="quantity-controls">
                                    <button class="decrement" onclick="changeQuantity(-1,83900,event)">-</button>
                                    <span id="quantity" class="quantity">1</span>
                                    <button class="increment" onclick="changeQuantity(1,83900,event)">+</button>
                                </div>
                            </div>
                            <div class="price">
                                <span aria-hidden="true">
                                    <span class="a-price-symbol">&##8377;</span>
                                    <span class="a-price-whole" id="price2">83,900</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 3 -->
            <div class="col-12 mb-4" style="width: 18rem;">
                <div class="mx-auto">
                    <input type="checkbox" name="" value="">
                    <div class="d-flex ">
                        <img src="../../productImages/iphone165G_.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">iPhone 16 128 GB: 5G Black</h5>
                            <div class="cart-container">
                                <div class="quantity-controls">
                                    <button class="decrement" onclick="changeQuantity(-1,72900,event)">-</button>
                                    <span id="quantity" class="quantity">1</span>
                                    <button class="increment" onclick="changeQuantity(1,72900,event)">+</button>
                                </div>
                            </div>
                            <div class="price">
                                <span aria-hidden="true">
                                    <span class="a-price-symbol">&##8377;</span>
                                    <span class="a-price-whole" id="price3">72,900</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Checkout Section -->
        <div class="col-md-4">
          <div class="checkout-box">
              <h3>Checkout</h3>
              <div class="pricedetails">
                  <!-- Total Price -->
                  <div class="col-12">
                      <h4>Total: ₹<span id="totalPrice">218,710</span></h4>
                  </div>
                  <!-- Discount Section -->
                  <div class="col-12 mt-3">
                      <h5>Discount: ₹<span id="discount">10</span></h5>
                  </div>
                  <!-- Subtotal Section -->
                  <div class="col-12 mt-3">
                      <h5>Subtotal: ₹<span id="subtotal">218700</span></h5>
                  </div>
                  <!-- Tax Section -->
                  <div class="col-12 mt-3">
                      <h5>Tax (5%): ₹<span id="tax">10935</span></h5>
                  </div>
                  <!-- Final Total -->
                  <div class="col-12 mt-3">
                      <h4>Final Total: ₹<span id="finalTotal">229635</span></h4>
                  </div>
              </div>

              <!-- Proceed to Buy Button -->
              <div class="row mt-4">
                  <div class="col-12">
                      <button class="btn btn-primary w-100" onclick="window.location.href='#application.appBasePath#users/orders/checkout.cfm'">Proceed to Buy</button>
                  </div>
              </div>
          </div>
      </div>

    </div>
</div>

<cfinclude  template="../../layouts/footer.cfm">
</body>
</html>
</cfoutput>