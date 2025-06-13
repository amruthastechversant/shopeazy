<cfoutput>
<div class="sidebar">
    <div class="sidebar-header">
        <a href="#application.appBasePath#index.cfm">
        <img src="#application.appBasePath#assets/img/logo.png" class="logo" alt="Your Logo">
        </a>
    </div>
    <ul class="sidebar-nav">
        <cfif structKeyExists(session, "role") and session.role EQ "seller">
            <li><a href="#application.appBasePath#users/login/seller/sellerHomePage.cfm">Dashboard</a></li>
        <cfelse>
        <li><a href="#application.appBasePath#admin/adminDashboard.cfm">Dashboard</a></li>
        </cfif>
        <li><a href="">Customers</a></li>
        <li><a href="#application.appBasePath#admin/seller/sellerDetail.cfm">Sellers</a></li>
        <li><a href="#application.appBasePath#admin/products/fullProducts.cfm">Products</a></li>
    </ul>
</div>

</cfoutput>