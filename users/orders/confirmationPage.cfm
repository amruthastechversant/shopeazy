<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="../../layouts/header.cfm">
<body>
<!--- header div--->
    <cfinclude  template="../../layouts/navbar.cfm">
    <div class="row pt-5 pb-5">
       
        <div class="col-2"></div>
            <div class="col-md-4 checkout-col-12">
                <div class="order-details">
                <h3>Order Details</h3>
                <p><strong>Order ID:</strong> ##12345678</p>
                <p><strong>Estimated Delivery Date:</strong> March 30, 2025</p>
                <button class="track-button" onclick="alert('Tracking your order!')">Track Order</button>
                </div>
            </div>
        </div>
       
    </div>


    <cfinclude  template="../../layouts/footer.cfm">  
</body>
</html>
</cfoutput>
