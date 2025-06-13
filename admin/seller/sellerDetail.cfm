<cfinclude template="sellerDetailAction.cfm">
<cfoutput>
<!DOCTYPE html> 
<html lang="en">
    <cfinclude template="#application.appBasePath#layouts/admin/head.cfm">
    <body>
        <div class="dashboard-container">
            <cfinclude template="#application.appBasePath#layouts/admin/sidebar.cfm">
            <div class="main-content">
                <!-- Header -->
                <cfinclude template="#application.appBasePath#layouts/admin/header.cfm">

                <div id="successMessage" class="text-success text-center"></div>
                <table class="w-100 table table-bordered table sm tbl-responsive" align="center">
                    <thead>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Gst No</th>
                        <th>Lisence No</th>
                        <th>Product Category</th>
                        <th>Permissions</th>
                        <th>Seller Status</th>
                    </thead>
                    <tbody>
                    </cfoutput>
                        <cfoutput query="variables.sellerDetails">
                            <tr>
                                <td>#variables.sellerDetails.int_seller_id#</td>
                                <td>#variables.sellerDetails.str_first_name#</td>
                                <td>#variables.sellerDetails.str_email#</td>
                                <td>#variables.sellerDetails.str_address#</td>
                                <td>#variables.sellerDetails.int_gst_no#</td>
                                <td>#variables.sellerDetails.int_lisence_no#</td>
                                <td>#variables.sellerDetails.str_category_name#</td>
                                <td>
                                <cfset variables.Permissions=variables.sellerPermission.getselectedPermissions(variables.sellerDetails.int_seller_id)>
                                <cfset variables.int_seller_permission_list=valueList(variables.Permissions.selectedPermissions.int_permission_id) >
                                    <div class="dropdown">
                                        <button class="btn btn-success dropdown-toggle"
                                            type="button" 
                                            id="multiSelectDropdown"
                                            data-bs-toggle="dropdown" 
                                            aria-expanded="false">
                                        Select
                                        </button>   
                                        <ul class="dropdown-menu" aria-labelledby="multiSelectDropdown">
                                            <form action="saveSellerPermission.cfm" method="POST">
                                                <cfloop query="variables.sellerPermissions"> 
                                                        <li>
                                                            <input type="checkbox" name="int_permission_id_list"  class="form-check-input"
                                                                value="#variables.sellerPermissions.int_permission_id#"
                                                                id="int_permission_id_list_#variables.sellerDetails.int_seller_id#"
                                                                <cfif ListContains(variables.int_seller_permission_list, variables.sellerPermissions.int_permission_id)> checked</cfif>>
                                                            <label for="int_permission_id_list_#variables.sellerDetails.int_seller_id#" class="form-check-label">
                                                                #variables.sellerPermissions.str_permission_name#
                                                            </label>
                                                        </li>
                                                </cfloop>
                                                <div class="d-inline-block">
                                                    <input type="hidden" name="id" value="#variables.sellerDetails.int_seller_id#">
                                                    <button type="submit" class="btn btn-primary btn-sm px-2 py-1">Save</button>
                                                </div>
                                            </form> 
                                        </ul>
                                    </div>
                                </td>
                                <td>
                                    <input type="hidden" name="id" value="#int_user_id#" id="seller_#int_seller_id#">
                                    <cfif str_seller_status EQ 'pending'>
                                        <button type="button" class="btn btn-sm btn-success" id="approve_#int_seller_id#" onclick="approveStatus(#int_seller_id#)">Approve</button>
                                    <cfelse>
                                        <button type="submit" class="btn btn-sm btn-danger">Deactivate</button>
                                    </cfif>
                                </td>
                            </tr>
                        </cfoutput>
                        <cfoutput>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="m-5">
            <nav aria-label="page-navigation">
                <ul class="pagination justify-content-end">
                    <cfif url.page GT 1>
                        <li class="page-item">
                            <a class="page-link" href="sellerDetail.cfm?page=#url.page - 1#" aria-label="previous">Previous</a>
                        </li>
                    </cfif>

                    <cfloop index="i" from="1" to="#variables.totalPages#">
                        <li class="page-item <cfif i EQ url.page>active</cfif>">
                            <a class="page-link" href="sellerDetail.cfm?page=#i#">#i#</a>
                        </li>
                    </cfloop>

                    <cfif url.page LT variables.totalPages>
                        <li class="page-item">
                            <a class="page-link" href="sellerDetail.cfm?page=#url.page + 1#" aria-label="Next">Next</a>
                        </li>
                    </cfif>
                </ul>
            </nav>
        </div>
    <script src="#application.appBasePath#assets/js/sellerDetail.js"></script>
    </body>
</html>
</cfoutput>
