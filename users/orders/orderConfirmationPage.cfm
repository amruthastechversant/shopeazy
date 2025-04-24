<cfinclude  template="orderConfirmationAction.cfm">
<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="../../layouts/header.cfm">
<body>
<!--- header div--->
    <cfinclude  template="../../layouts/navbar.cfm">
    <div class="row pt-5 pb-5">
       
        <div class="col-2"></div>
<!---             <cfdump  var="#orderItems#"> --->
            <div class="col-md-4">
                <h3>Order Details</h3>
                <p><strong>Order ID:#orderID#</p>
                <div class="order-details">
                    <cfloop query="#orderItems#" >
                        <div class="order-item">
                            <div class="">
                                <img src="../../productImages/iphone16_.jpg" class="card-img-top" alt="...">
                                    <div class="">
                                        <h5 class="">#orderItems.str_name#</h5>
                                        <span aria-hidden="true">
                                            <span class="a-price-symbol">&##8377</span>
                                            <span class="a-price-whole">#orderItems.int_price#</span>
                                        </span>
                                    </div>
                            </div>
                            <p><strong>Estimated Delivery Date:</strong> March 30, 2025</p>
                            <button class="track-button" onclick="alert('Tracking your order!')">Track Order</button>
                        </div>
                    </cfloop>
                </div>
            </div>
        </div>
       
    </div>


    <cfinclude  template="../../layouts/footer.cfm">  
</body>
</html>
</cfoutput>
