<cfoutput>
<div class="header">
    <cfif structKeyExists(session, "role") and session.role EQ "seller">
        <h5>Seller Dashboard</h5>
    <cfelse>
    <h1>Admin Dashboard</h1>
    </cfif>
    <div class="header-menu">
        <span><a href="#application.appBasePath#admin/userOrders/userOrders.cfm">Orders</a></span>
        <span><a href="">Most Sold</a></span>
        <span><a href="">Payments</a></span>
        <span><a href="#application.appBasePath#logout.cfm" onclick="return(confirm('are you sure want to logout'))">LogOut</a></span>

    </div>
</div>
</cfoutput>