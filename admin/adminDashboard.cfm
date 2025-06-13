<cfoutput>
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="#application.appBasePath#layouts/admin/head.cfm">
<body>
  <div class="dashboard-container">
    <!-- Left Sidebar -->
    <cfinclude  template="#application.appBasePath#layouts/admin/sidebar.cfm">
    <!-- Main Content -->
    <div class="main-content">
        <cfinclude  template="#application.appBasePath#layouts/admin/header.cfm">
      <div class="custom-dashboard-cards">
        <div class="custom-card">
          <h3>Total Orders</h3>
          <p>1520</p>
        </div>
        <div class="custom-card">
          <h3>Total Customers</h3>
          <p>120</p>
        </div>
        <div class="custom-card">
          <h3>Total Sellers</h3>
          <p>45</p>
        </div>
        <div class="custom-card">
          <a href="products/fullProducts.cfm">
          <h3>Total Products</h3>
          <p>350</p>
          </a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
</cfoutput>

