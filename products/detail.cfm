<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="../layouts/header.cfm">
<body>
<cfinclude  template="../layouts/navbar.cfm">

    <div class="product-detail">
        <div class="product-image">
            <img src="../productImages/Apple iPhone 15.jpg" alt="Product Image">
        </div>
        <div class="product-info">
            <h1 class="product-name">Apple iPhone 15 (128 GB) - Black</h1>
            <p class="product-price">$49.99</p>
            <p class="detail-item-head">Description :</p>
            <p class="product-description text-dark">
                Experience the iPhone 15 – your dynamic companion. Dynamic Island ensures you stay connected, bubbling up alerts seamlessly while you're busy. Its durable design features infused glass and aerospace-grade aluminum, making it dependable and resistant to water and dust. Capture life with precision using the 48 MP Main Camera, perfect for any shot. Powered by the A16 Bionic Processor, it excels in computational photography and more, all while conserving battery life. Plus, it's USB-C compatible, simplifying your charging needs. Elevate your tech game with the iPhone 15 – innovation at your fingertips. Goodbye cable clutter, hello convenience.
            </p>
            <p class="detail-item-head">Specifications :
                <ul>
                    <li class="product-description text-dark">128 GB ROM</li>
                    <li class="product-description text-dark">15.49 cm (6.1 inch) Super Retina XDR Display</li>
                    <li class="product-description text-dark">48MP + 12MP | 12MP Front Camera</li>
                    <li class="product-description text-dark">A16 Bionic Chip, 6 Core Processor Processor</li>
                    
                </ul>
            </p>
            <p class="detail-item-head">Rating :
                <div class="product-rating">
                <span class="star rated">★</span>
                <span class="star rated">★</span>
                <span class="star rated">★</span>
                <span class="star rated">★</span>
                <span class="star">☆</span>
                <span class="rating-text">(4/5)</span>
            </div>
            </p>
            <p class="detail-item-head">Brand :</p>
            <p>Iphone</p>

             <p class="detail-item-head">Available colors :
            </p>
             <div class="available-colors">
                <div class="color-swatches">
                    <div class="color-circle" style="background-color: black;" title="Black"></div>
                    <div class="color-circle" style="background-color: white;" title="White"></div>
                    <div class="color-circle" style="background-color: blue;" title="Blue"></div>
                    <div class="color-circle" style="background-color: red;" title="Red"></div>
                </div>
            </div>

            <p class="detail-item-head">sold by :
            </p>
            <p>SuperComNet</p>
            <button class="add-to-cart">Add to Cart</button>
            <button class="btn  btn-info">In stock</button>
            <button class="btn btn-dark">Buy Now</button>
        </div>
    </div>
 <cfinclude  template="../layouts/footer.cfm">  
</body>
</html>
</cfoutput>