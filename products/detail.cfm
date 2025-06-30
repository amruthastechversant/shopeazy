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
            <cfset rating = variables.result.rating>
            <cfset maxRating = 5>
            <p class="detail-item-head">Rating:
                <div class="product-rating">
                    <cfloop from="1" to="#maxRating#" index="i">
                        <cfif i LTE rating>
                            <span class="star rated">★</span>
                        <cfelse>
                            <span class="star">★</span>
                        </cfif>
                    </cfloop>
                    <span class="rating-text">(#rating#/#maxRating#)</span>
                </div>
            </p>

        </cfoutput>
        <form action="listAction.cfm" method="POST">
            <cfoutput query = "variables.variants" group="str_properties">
                <p class="detail-item-head">#str_properties# :
                    <div class="available-colors">
                        <div class="color-swatches">
                            <div class="color-container d-flex flex-wrap gap-2">
                            <cfoutput>
                               <cfif str_properties EQ "color">
                                <label class="color-option" style="cursor:pointer;">
                                    <input type="radio" name="selected_color" id="#variables.variants.id#" value="#str_properties_value#">
                                    <div class="displaycolorcode"  style="background-color:#str_properties_value#" title="#str_properties_value#"></div>
                                </label>
                                <cfelseif str_properties EQ "size">
                                    <label class="size-option me-2">
                                        <input type="radio" name="selected_size" value="#str_properties_value#"> #str_properties_value#
                                    </label>

                                <cfelseif str_properties EQ "materials">
                                    <label class="materials-option me-2">
                                        <input type="radio" name="selected_materials" value="#str_properties_value#">#str_properties_value#
                                    </label>
                                <cfelseif str_properties EQ "brand">
                                    <div class="brand">#str_properties_value#</div>
                                </cfif>
                            </cfoutput>
                            </div>
                        </div>
                    </div>
                </p>
            </cfoutput>
            <cfoutput>
            <input type="hidden" name="product_id" value="#variables.result.int_product_id#">
            <button class="add-to-cart"  type="submit" name="addToCart" >Add to Cart</button>
            </form>
<!---             <button class="btn  btn-info">In stock</button> --->
             <button class="btn btn-primary w-100" type="submit" onclick="getTotalPrice()">Buy Now</button>
        </div>
    </div>
 <cfinclude  template="#application.appBasePath#layouts/footer.cfm">  
</body>
</html>
</cfoutput>