<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="../assets/css/adminPage.css">
</head>
<body>
  <div class="dashboard-container">
    <!-- Left Sidebar -->
    <div class="sidebar">
      <div class="sidebar-header">
        <h2>Admin</h2>
      </div>
      <ul class="sidebar-nav">
        <li><a href="../index.cfm0">Dashboard</a></li>
        <li><a href="">Customers</a></li>
        <li><a href="">Sellers</a></li>
        <li><a href="">Orders</a></li>
        <li><a href="#application.appBasePath#admin/products/addProducts.cfm">Products</a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
      <!-- Header -->
      <div class="header">
          <a href="#application.appBasePath#index.cfm">
            <img src="#application.appBasePath#assets/img/logo.png" class="logo" alt="Your Logo">
          </a>
        <h1>Admin Dashboard</h1>
        <div class="header-menu">
          <span><a href="">Orders</a></span>
          <span><a href="">Most Sold</a></span>
          <span><a href="">Payments</a></span>
        </div>
      </div>

      <!-- Dashboard Content (Example) -->
      <div class="dashboard-cards">
        <div class="card">
          <h3>Total Orders</h3>
          <p>1520</p>
        </div>
        <div class="card">
          <h3>Total Customers</h3>
          <p>120</p>
        </div>
        <div class="card">
          <h3>Total Sellers</h3>
          <p>45</p>
        </div>
        <div class="card">
          <a href="products/fullProducts.cfm">
          <h3>Total Products</h3>
          <p>350</p>
          </a>
        </div>
      </div>

      <!-- Main Statistics -->
      <div class="statistics">
        <div class="stat-box">
          <h3>Orders</h3>
          <p>Details about orders...</p>
        </div>
        <div class="stat-box">
          <h3>Most Sold</h3>
          <p>Details about most sold products...</p>
        </div>
        <div class="stat-box">
          <h3>Payments</h3>
          <p>Payment summary...</p>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
</cfoutput>

