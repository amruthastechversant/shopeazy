    
    <cfinclude  template="fullProductsAction.cfm">
    <!DOCTYPE html> 
    <html lang="en">
        <cfinclude  template="#application.appBasePath#layouts/admin/head.cfm">
        <body>
             <div class="dashboard-container">
                <cfinclude  template="#application.appBasePath#layouts/admin/sidebar.cfm">
                <div class="main-content">
      <!-- Header -->
                    <cfinclude template="#application.appBasePath#layouts/admin/header.cfm">
                    <div id="errorMessage"></div>
                    <cfoutput>
                    <button onclick ="window.location.href='#application.appBasePath#admin/products/addProducts.cfm'" class="btn btn-info ms-3 mb-3">ADD PRODUCT</a></button>
                    <form class="d-flex justify-content-between align-items-center" action="#application.appBasePath#admin/products/fullProducts.cfm" method="POST">
                        <input type="search" class="form-control  mr-sm-2 ms-3" placeholder="Search" aria-label="Search" id="keyword" name="keyword" >
                        <button type="submit"><i class="fas fa-search my-2 ms-3"></i> </button>
                    </form>
                    </cfoutput>
                    
                    <table class="w-100 table table-bordered table sm tbl-responsive" align="center">
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
                            <td class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="status_#variables.qryAllProducts.int_product_id#" <cfif variables.qryAllProducts.status EQ "active">checked </cfif> onclick="changestatus(#variables.qryAllProducts.int_product_id#);">
                         <label class="form-check-label" for="status_#variables.qryAllProducts.int_product_id#"></label>
                            </td>
                            <td>
                                <a href="addProducts.cfm?id=#int_product_id#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                            </td>
                            </tr>
                </cfoutput>
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
        </cfoutput>
        </body>
    </html>