<cfif NOT structKeyExists(session, "isLoggedIn") OR NOT session.isLoggedIn>
    <cflocation url="#application.appBasePath#index.cfm?showLogin=1" addtoken="no">
</cfif>
<cfinclude  template="#application.appBasePath#users/orders/ordersActionPage.cfm">
<!--- <cfdump  var="#session.cart#"> --->
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="#application.appBasePath#layouts/admin/head.cfm">
<cfinclude  template="#application.appBasePath#layouts/admin/header.cfm">
<body>
<!--- header div--->
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
                                    <img src="../../productImages/iphone16_.jpg" class="card-img-top" alt="...">
                                    <div class="">
                                        <h3 class="">#finalorders.str_name# &times;#finalorders.int_quantity# Nos</h3>
                                        <p><strong>Estimated Delivery Date:</strong> March 30, 2025</p>
                                    </div>
                                </div>
                                <button class="track-button" onclick="alert('Tracking your order!')">Track Order</button>
                            </div> 
                        </cfoutput>  
                    </div>
                </cfoutput>
            </div>
        </div> 
    </div>
</body>
</html>
