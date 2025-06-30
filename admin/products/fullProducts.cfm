
<cfif NOT structKeyExists(session, "isLoggedIn") OR session.isLoggedIn NEQ true>
    <cflocation  url="#application.appBasePath#index.cfm">
</cfif>
    <cfinclude  template="#application.appBasePath#admin/products/fullProductsAction.cfm">
    <!DOCTYPE html> 
    <html lang="en">
        <cfif structKeyExists(session, "role")&&(session.role) eq "seller">
            <cfinclude template="#application.appBasePath#layouts/seller/head.cfm">
        <cfelse>
            <cfinclude  template="#application.appBasePath#layouts/admin/head.cfm">
        </cfif>
        <body>
            <div class="seller-dashboard-container">
                <cfinclude  template="#application.appBasePath#layouts/admin/sidebar.cfm">
                <div class="main-content">
                        <cfinclude template="#application.appBasePath#layouts/admin/header.cfm">
                    <div id="errorMessage"></div>
                    <cfoutput>
                   <button onclick ="window.location.href='#application.appBasePath#admin/products/addProducts.cfm'" class="btn btn-info ms-3 mb-3">ADD PRODUCT</button>
                    <form class="d-flex justify-content-between align-items-center mb-3" action="#application.appBasePath#admin/products/fullProducts.cfm" method="POST">
                        <input type="search" class="form-control  mr-sm-2 ms-3 me-2" placeholder="Search" aria-label="Search" id="keyword" name="keyword" >
                        <button type="submit"><i class="fas fa-search"></i> </button>
                    </form>
                    </cfoutput>
                    
                    <table class="table table-success table-striped table-responsive" align="center">
                        <thead>
                            <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Price </th>
                            <th>Description</th>
                            <th>Status</th>
                            <th>EDIT</th>
                            </tr>
                        </thead>
                        <tbody>
                    <cfif structKeyExists(session, "role") and session.role EQ "seller">
                        <cfoutput query="variables.qrysellerProducts">
                            <tr>
                            <td>#variables.qrysellerProducts.int_product_id#</td>
                            <td id="name_#variables.qrysellerProducts.int_product_id#">#variables.qrysellerProducts.str_name# 
                            <cfif variables.qrysellerProducts.status EQ "inactive">
                             <span class="badge bg-warning" >#variables.qrysellerProducts.status#</span>
                            </cfif>
                            </td>
                            <td>#variables.qrysellerProducts.int_price#</td>
                            <td>#variables.qrysellerProducts.str_description#</td>
                            <td class="form-check form-switch table-cell" >
                            <input class="form-check-input" type="checkbox" id="status_#variables.qrysellerProducts.int_product_id#" <cfif variables.qrysellerProducts.status EQ "active">checked </cfif> onclick="changestatus(#variables.qrysellerProducts.int_product_id#);">
                            </td>
                            <td>
                                <a href="addProducts.cfm?id=#int_product_id#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                            </td>
                            </tr>
                    </cfoutput>
                     <cfelse> 
                    <cfoutput query="variables.qryAllProducts">
                            <tr>
                            <td>#variables.qryAllProducts.int_product_id#</td>
                            <td id="name_#variables.qryAllProducts.int_product_id#">#variables.qryAllProducts.str_name# 
                            <cfif variables.qryAllProducts.status EQ "inactive">
                             <span class="badge bg-warning" >#variables.qryAllProducts.status#</span>
                            </cfif>
                            </td>
                            <td>#variables.qryAllProducts.int_price#</td>
                            <td>#variables.qryAllProducts.str_description#</td>
                            <td class="form-check form-switch table-cell" >
                            <input class="form-check-input table-input" type="checkbox" id="status_#variables.qryAllProducts.int_product_id#" <cfif variables.qryAllProducts.status EQ "active">checked </cfif> onclick="changestatus(#variables.qryAllProducts.int_product_id#);">
                            </td>
                            <td>
                                <a href="addProducts.cfm?id=#int_product_id#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                            </td>
                            </tr>
                    </cfoutput>
                     </cfif>
                     <tbody>
                    </table>
                </div>
            </div>
        <cfoutput>
            <div class="m-5">
            <nav aria-label="page-navigation">
                <ul class="pagination justify-content-end">
                <cfif url.page GT 1>
                    <li class="page-item">
                    <a class="page-link" href="fullProducts.cfm?#url.page-1#" aria-label="previous">previous</a>
                    </li>
                </cfif>
                <cfloop index="i" from="1" to="#variables.totalPages#">
                    <li class="page-item <cfif i EQ url.page>active</cfif>">
                    <a class="page-link" href="?page=#i#">#i#</a>
                    </li>
                </cfloop>

                <cfif url.page LT variables.totalPages>
                    <li class="page-item">
                    <a class="page-link" href="fullProducts.cfm?#url.page +1#" aria-label="Next">Next</a>
                    </li>
                </cfif>
                </ul>
            </nav>
            </div>
    <script src="#application.appBasePath#assets/js/fullProducts.js"></script>
        </cfoutput>
        </body>
    </html>