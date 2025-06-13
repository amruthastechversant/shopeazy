<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="detailAction.cfm">
<cfinclude  template="#application.appBasePath#layouts/header.cfm">
<body>
<cfinclude  template="#application.appBasePath#layouts/navbar.cfm">
    <div class="product-detail">
        <div class="product-image">
            <img src="#application.appBasePath##variables.result.image_path#" class="img-size"alt="Product Image">
        </div>
        <div class="product-info">
            <h1 class="product-name">#variables.result.str_name#</h1>
            <p class="product-price">#variables.result.int_price#</p>
            <p class="detail-item-head">Description :</p>
            <p class="product-description text-dark">
              # variables.result.str_description#</p>
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
            <p class="detail-item-head">BRAND:</p>
            <p>Iphone</p>
        </cfoutput>
            <cfoutput query = "variables.variants" group="str_properties">
                <p class="detail-item-head">#str_properties# :
                    <div class="available-colors">
                        <div class="color-swatches">
                            <div>
                            <cfoutput>
                                <cfif str_properties EQ "color" >
                                    <div class="displaycolorcode" style="background-color:#str_properties_value#" title="#str_display_name#"></div>
                                <cfelse>
                                    #str_properties_value#
                                </cfif>
                                <br>
                            </cfoutput>
                            </div>
                        </div>
                    </div>
                </p>
            </cfoutput>
            <cfoutput>
            <p class="detail-item-head">SOLD BY :
            </p>
            <p>SuperComNet</p>
            <button class="add-to-cart" name="addToCart">Add to Cart</button>
            <button class="btn  btn-info">In stock</button>
            <button class="btn btn-dark">Buy Now</button>
        </div>
    </div>
 <cfinclude  template="#application.appBasePath#layouts/footer.cfm">  
</body>
</html>
</cfoutput>