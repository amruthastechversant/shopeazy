<cfoutput>
<div class="header">
    <h1>Admin Dashboard</h1>
    <div class="header-menu">
        <span><a href="#application.appBasePath#admin/userOrders/userOrders.cfm">Orders</a></span>
        <span><a href="">Most Sold</a></span>
        <span><a href="">Payments</a></span>
        <span><a href="#application.appBasePath#logout.cfm" onclick="return(confirm('are you sure want to logout'))">LogOut</a></span>

    </div>
</div>
</cfoutput>