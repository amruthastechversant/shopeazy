<cfinclude  template="#application.appBasePath#users/login/seller/editProfileAction.cfm">
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
                  <cfoutput>
                  <form id="sellerRegistrationForm" action="" method="POST" >
                    <div class="form-group">
                        <label for="firstname">Company Name</label>
                        <input type="text" id="companyName" name="companyName" value="#(structkeyexists(variables,'editSellerProfile')? variables.editSellerProfile.str_first_name:'')#" />
                        <div class="error-msg text-danger" id="companyNameError"></div>
                    </div>
                    <div class="form-group">
                      <label for="productcategory">Product Category</label>
                        <select name="productcategory" id="productcategory" >
                            <option value=""<cfif Not structKeyExists(variables, "editSellerProfile") or not len(variables.editSellerProfile.int_product_category)>selected</cfif>>Select a category</option>
                            <cfloop query="#variables.categories#">
                                <option value="#int_category_id#"
                                <cfif structKeyExists(variables, "editSellerProfile") and (variables.editSellerProfile.int_product_category EQ int_category_id)>selected="selected"</cfif>>#str_category_name#</option>
                            </cfloop>
                        </select>
                        <div class="error-msg text-danger" id="productcategoryError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Company Email</label>
                        <input type="text" id="CompanyEmail" name="CompanyEmail" value="#(structKeyExists(variables, 'editSellerProfile') ? variables.editSellerProfile.str_email : '')#">
                        <div class="error-msg text-danger" id="emailError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Company Address</label>
                        <input type="text" id="CompanyAddress" name="CompanyAddress" value="#(structKeyExists(variables,'editSellerProfile')? variables.editSellerProfile.str_address : '')#">
                        <div class="error-msg text-danger" id="CompanyAddressError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber">Contact Number</label>
                        <input type="tel" id="Contactno" name="Contactno" maxlength="10" value="#(structKeyExists(variables,'editSellerProfile')? variables.editSellerProfile.str_phone_number : '')#" >
                        <div class="error-msg text-danger"  id="ContactnoError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber">Gst No</label>
                        <input type="number" id="gstNo" name="gstNo" maxlength="10" value="#(structKeyExists(variables,'editSellerProfile')? variables.editSellerProfile.int_gst_no : '')#" >
                        <div class="error-msg text-danger"  id="gstNoError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber">Lisence No</label>
                        <input type="number" id="lisenceNo" name="lisenceNo" maxlength="10" value="#(structKeyExists(variables,'editSellerProfile')? variables.editSellerProfile.int_lisence_no : '')#" >
                        <div class="error-msg text-danger"  id="lisenceNoError"></div>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">Password</label>
                        <input type="password" id="newSellerPassword" name="newSellerPassword" value="#(structKeyExists(variables,'editSellerProfile')? variables.editSellerProfile.str_password : '')#" >
                        <div class="error-msg text-danger" id="sellerPasswordError"></div>
                    </div>
                    <div class="form-group">
                        <label for="confirmpassword">Confirm Password</label>
                        <input type="password" id="sellerconfirmpassword" name="sellerconfirmpassword" value="#(structKeyExists(variables,'editSellerProfile')? variables.editSellerProfile.str_password : '')#" >
                        <div class="error-msg text-danger" id="sellerconfirmpasswordError"></div>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end ">
                        <button type="submit" value="submit" name="useregistration" class="sellerRegisterbtn">Register</button>
                    </div>
                </form>
                  </cfoutput>
              </div>
              </div>
      </body>
    </html>
</cfoutput>