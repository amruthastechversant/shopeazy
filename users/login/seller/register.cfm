
<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="#application.appBasePath#layouts/header.cfm">
<cfinclude  template="registerAction.cfm">
<body>
<!--- header div--->
   <cfinclude  template="#application.appBasePath#/layouts/navbar.cfm">
    <div class="row pt-5 pb-5">
        <div class="col-2"></div>
            <div class="col-8 checkout-col-12">
                <h2> Register As Seller</h2>
               <div class="error-msg text-danger">   
                    #error_msg# 
                </div>
                <div class="error-msg text-success">   
                    #variables.success_msg# 
                </div>
                <form id="sellerRegistrationForm" action="" method="POST" >
                    <div class="form-group">
                        <label for="firstname">Company Name</label>
                        <input type="text" id="companyName" name="companyName" value="#variables.str_company_name#" >
                        <div class="error-msg text-danger" id="companyNameError"></div>
                    </div>
                    <div class="form-group">
                      <label for="productcategory">Product Category</label>
                        <select name="productcategory" id="productcategory" >
                            <option value="" disabled selected>Select a category</option>
                            <cfloop query="#variables.categories#">
                                <option value="#int_category_id#">#str_category_name#</option>
                            </cfloop>
                        </select>
                        <div class="error-msg text-danger" id="productcategoryError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Company Email</label>
                        <input type="text" id="CompanyEmail" name="CompanyEmail" value="#variables.str_company_email#">
                        <div class="error-msg text-danger" id="emailError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Company Address</label>
                        <input type="text" id="CompanyAddress" name="CompanyAddress" value="#variables.str_company_address#">
                        <div class="error-msg text-danger" id="CompanyAddressError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber">Contact Number</label>
                        <input type="tel" id="Contactno" name="Contactno" maxlength="10" value="#variables.str_contact_number#" >
                        <div class="error-msg text-danger"  id="ContactnoError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber">Gst No</label>
                        <input type="number" id="gstNo" name="gstNo" maxlength="10" value="#variables.str_gst_number#" >
                        <div class="error-msg text-danger"  id="gstNoError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber">Lisence No</label>
                        <input type="number" id="lisenceNo" name="lisenceNo" maxlength="10" value="#variables.str_license_number#" >
                        <div class="error-msg text-danger"  id="lisenceNoError"></div>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">Password</label>
                        <input type="password" id="newSellerPassword" name="newSellerPassword" value="#variables.seller_password#" >
                        <div class="error-msg text-danger" id="sellerPasswordError"></div>
                    </div>
                    <div class="form-group">
                        <label for="confirmpassword">Confirm Password</label>
                        <input type="password" id="sellerconfirmpassword" name="sellerconfirmpassword" value="#variables.seller_Confirm_Password#" >
                        <div class="error-msg text-danger" id="sellerconfirmpasswordError"></div>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end ">
                        <button type="submit" value="submit" name="useregistration" class="sellerRegisterbtn">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
   <cfinclude  template="../../../layouts/footer.cfm">
<script src="#application.appBasePath#assets/js/login.js"></script>
</body>
</html>
</cfoutput>