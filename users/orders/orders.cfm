<cfif NOT structKeyExists(session, "isLoggedIn") OR NOT session.isLoggedIn>
    <cflocation url="#application.appBasePath#index.cfm?showLogin=1" addtoken="no">
</cfif>
<cfinclude  template="#application.appBasePath#users/orders/ordersActionPage.cfm">
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="../../layouts/header.cfm">
<body>
    <cfinclude  template="../../layouts/navbar.cfm">
    <div class="row pt-5 pb-5">
        <div class="col-2"></div>
            <div class="col-md-4">
                <h3>Orders</h3>
                <cfoutput query="finalorders" group="int_order_id">
                    <div class="order-details">
                    <h4><strong>Order ID:</strong>#finalorders.int_order_id#</h4>
                        <cfoutput>
                            <div class="order-item">
                                <div class="">
                                    <img src="#application.appBasePath##finalorders.image_path#" class="card-img-top" alt="...">
                                    <div class="">
                                        <h3 class="">#finalorders.str_name# &times;#finalorders.int_quantity# Nos</h3>
                                        <p><strong>Estimated Delivery Date:</strong> March 30, 2025</p>
                                    </div>
                                </div>
                                <button class="track-button" onclick="alert('Tracking your order!')">Track Order</button>
                                <button class="confirmDelivery" onclick="reviewbtnmodal()">confirm Delivery</button>
                            </div> 
                             <div id="reviewmodal" class="modal">
                                <div class="custom-modal">
                                    <span class="close" id="reviewclosebtn">&times;</span>
                                    <h4 class="text-success">your order is confirmed !!!</h4>
                                    <div class="star-rating" name="output">
                                    <span onclick="rev(1)" class="star">★</span>
                                    <span onclick="rev(2)" class="star">★</span>
                                    <span onclick="rev(3)" class="star">★</span>
                                    <span onclick="rev(4)" class="star">★</span>
                                    <span onclick="rev(5)" class="star">★</span>
                                    <h3 id="output">Rating is: 0/5</h3>
                                    <input type="hidden" name="rating" id="rating" value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.rating: '')#"/>
                                    </div>
                                <div class="form-group mt-3">
                                     <label for="reviewText"><strong>Your Review:</strong></label>
                                    <textarea name="str_review_text" id="reviewText" class="form-control" rows="4" placeholder="Write your review here...">#(structKeyExists(variables, 'editProduct') ? variables.editProduct.str_review_text : '')#</textarea>
                                </div>
                                <input type="hidden" name="userId" id="userId" value="#session.id#">
                                <input type="hidden" name="productId" id="productId" value="#finalorders.int_product_id#">
                                <button type="button" class="btn btn-primary ms-auto" name="saveReview" id="submitReview">SUBMIT</button>
                                </div>
                            </div>
                        </cfoutput>  
                    </div>
                </cfoutput>
            </div>
        </div> 
    </div>
    <cfinclude  template="#application.appBasePath#/layouts/footer.cfm">  
</body>
</html>
