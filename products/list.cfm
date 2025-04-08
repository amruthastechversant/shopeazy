<cfoutput>
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="../layouts/header.cfm">
<body>
   <cfinclude  template="../layouts/navbar.cfm">

    <div class="container text-center mt-5 mb-5">
      <div class="row">
        <div class="card mx-2" style="width: 18rem; cursor:pointer;">
          <img src="../productImages/Apple iPhone 15.jpg" class="card-img-top" alt="..." onclick="window.location.href='#application.appBasePath#products/detail.cfm'">
            <div class="card-body">
              <h5 class="card-title">Apple iPhone 15 (128 GB) - Black</h5>
              <span aria-hidden="true">
                <span class="a-price-symbol">&##8377</span>
                <span class="a-price-whole">61,900</span>
              </span>
              <form action="addToCart.cfm" method="POST">
                <input type="hidden" name="product_id" value="1">
                <input type="hidden" name="product_name" value="Apple iPhone 15 (128 GB) - Black">
                <input type="hidden" name="product_price" value="61900">
                <button type="submit" class="btn btn-primary" name="addToCart">Add to cart</button>
              </form>
               <a href="" class="btn btn-primary mt-3">Buy Now</a>

            </div>
        </div>
        <div class="card mx-2" style="width: 18rem;">
          <img src="../productImages/iphone16_.jpg" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">iPhone 16 256 GB: 5G Black</h5>
            <span aria-hidden="true">
                <span class="a-price-symbol">&##8377</span>
                <span class="a-price-whole">83,900</span>
            </span>
             <form action="addToCart.cfm" method="POST">
              <input type="hidden" name="product_id" value="2">
              <input type="hidden" name="product_name" value="iPhone 16 256 GB: 5G Black">
              <input type="hidden" name="product_price" value="83900">
              <button type="submit" class="btn btn-primary" name="addToCart">Add to cart</button>
            </form>
             <a href="" class="btn btn-primary mt-3"> Buy Now</a>

          </div>
        </div>
        <div class="card mx-2" style="width: 18rem;">
          <img src="../productImages/iphone165G_.jpg" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">iPhone 16 128 GB: 5G Black</h5>
           <span aria-hidden="true">
                <span class="a-price-symbol">&##8377</span>
                <span class="a-price-whole">72,900</span>
            </span>
           
                <form action="addToCart.cfm" method="POST">
              <input type="hidden" name="product_id" value="3">
              <input type="hidden" name="product_name" value="iPhone 16 128 GB: 5G Black">
              <input type="hidden" name="product_price" value="72900">
              <button type="submit" class="btn btn-primary" name="addToCart">Add to cart</button>
            </form>
             <a href="" class="btn btn-primary mt-3">Buy Now</a>
          </div>
        </div>
      </div>
    </div>

<cfinclude  template="../layouts/footer.cfm">
</body>
</html>
</cfoutput>