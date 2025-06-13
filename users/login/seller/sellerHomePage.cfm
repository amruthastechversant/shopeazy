<cfoutput>
<cfinclude  template="#application.appBasePath#users/login/seller/sellerHomePageAction.cfm">
    <!DOCTYPE html> 
    <html lang="en">
         
            <cfinclude template="#application.appBasePath#layouts/admin/head.cfm">
        <body>
             <div class="dashboard-container">
                <cfinclude  template="#application.appBasePath#layouts/admin/sidebar.cfm">
                <div class="main-content">
      <!-- Header -->
                        <cfinclude template="#application.appBasePath#layouts/admin/header.cfm">
                  <div class="subheader">
                  <div>

                    <cfif structKeyExists(session, "name") and session.name NEQ "">
              <!---       <h2 class="text-xl font-semibold mb-2">Welcome, #session.str_first_name#</h2> --->
                    <p>welcome #session.name#</p>
                    </cfif>
                    <p>Store: John's Gadgets</p>
                    <button class="mt-4 w-full bg-gray-200 py-2 rounded">Edit Profile</button>
                  </div>

    <!-- Stats -->
                  <div class="custom-dashboard-cards ">
                  <a href="#application.appBasePath#admin/products/fullProducts.cfm">
                    <div class="custom-card">
                      <p class="text-sm">Total Products</p>
                      <h3 class="text-2xl font-bold">45</h3>
                    </div>
                  </a>
                    <div class="custom-card">
                      <p class="text-sm">Pending Orders</p>
                      <h3 class="text-2xl font-bold">8</h3>
                    </div>
                    <div class="custom-card">
                      <p class="text-sm">Earnings</p>
                      <h3 class="text-2xl font-bold">$1,450</h3>
                    </div>
                  </div>
    <!-- Action Buttons -->

              <div class="col-span-3 mt-4 flex d-flex justify-content-end"> 
                <cfif arrayContains(session.permissions, 1)>
                  <a href="#application.appBasePath#admin/products/addProducts.cfm" class="btn btn-primary btn-sm">Add Product</a>
                </cfif>
              </div>
              </div>
        </div>
    </div>
        <!--- <p class="text-sm text-gray-500">Upload and manage your store items.</p>
      <a href="/manage-orders" class="bg-white p-6 rounded-xl shadow hover:bg-gray-50 flex flex-col items-center">
         <cfif arrayContains(session.permissions, 5)> 
        Manage Orders
        <p class="text-sm text-gray-500">View and process customer orders.</p>
      </a>
      <a href="/sales-report" class="bg-white p-6 rounded-xl shadow hover:bg-gray-50 flex flex-col items-center">
        <span class="text-2xl font-semibold mb-2">Sales Report</span>
        <p class="text-sm text-gray-500">Analyze sales performance.</p>
      </a>
    </div>--->
</body>
</html>
</cfoutput>
