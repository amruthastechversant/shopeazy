<cfoutput>
<cfinclude  template="#application.appBasePath#users/login/seller/sellerHomePageAction.cfm">
    <!DOCTYPE html> 
    <html lang="en">
            <cfinclude template="#application.appBasePath#layouts/admin/head.cfm">
        <body>
              <div class="dashboard-container">
                <cfinclude  template="#application.appBasePath#layouts/admin/sidebar.cfm">
                <div class="main-content">
                        <cfinclude template="#application.appBasePath#layouts/admin/header.cfm">
                  <div class="subheader">
                    <div>
                      <cfif structKeyExists(session, "name") and session.name NEQ "">
                      <p>welcome #session.name#</p>
                      </cfif>
                      <p>Store: John's Gadgets</p>
                      <button class="mt-4 w-full bg-gray-200 py-2 rounded" onclick="window.location.href='editProfile.cfm?id=#session.id#'">Edit Profile</button>
                    </div>
                    <cfif session.str_seller_status EQ "Approved">
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
                      <div class="col-span-3 mt-4 flex d-flex justify-content-end"> 
                        <cfif arrayContains(session.permissions, 1)>
                          <a href="#application.appBasePath#admin/products/addProducts.cfm" class="btn btn-primary btn-sm">Add Product</a>
                        </cfif>
                      </div>
                    <cfelseif session.str_seller_status EQ "pending">
                      <div class="alert alert-danger mt-3">
                          your seller Account has not been approved by admin.
                      </div>
                    <cfelse>
                      <div class="alert alert-warning mt-4">
                          Your seller account has been deactivated by the admin. You cannot access dashboard features.
                      </div>
                    </cfif>
                  </div>
                </div>
              </div>
      </body>
    </html>
</cfoutput>
