<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="detailAction.cfm">
<cfinclude  template="../layouts/header.cfm">
<body>
<cfinclude  template="../layouts/navbar.cfm">

    <div class="product-detail">
        <div class="product-image">
            <img src="#application.appBasePath##variables.result.image_path#" class="img-size"alt="Product Image">
        </div>
        <div class="product-info">
            <h1 class="product-name">#variables.result.str_name#</h1>
            <p class="product-price">#variables.result.int_price#</p>
            <p class="detail-item-head">Description :</p>
            <p class="product-description text-dark">
              # variables.result.str_description#
<!---             <p class="detail-item-head">Specifications :
                <ul>
                    <li class="product-description text-dark">128 GB ROM</li>
                    <li class="product-description text-dark">15.49 cm (6.1 inch) Super Retina XDR Display</li>
                    <li class="product-description text-dark">48MP + 12MP | 12MP Front Camera</li>
                    <li class="product-description text-dark">A16 Bionic Chip, 6 Core Processor Processor</li>
                    
                </ul>
            </p> --->
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
<!---             <p class= "detail-item-head">SIZE: 
            <div class="available-colors">
                <div class="color-swatches">
                    <div>
                        <cfloop query = "variables.variants">
                            <cfif str_properties EQ "size" >
                                #str_properties_value#" title="#str_display_name#"></div>
                            </cfif>
                        </cfloop>
                    </div>
                </div>
            </div>
            </p>--->

            <p class="detail-item-head">SOLD BY :
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