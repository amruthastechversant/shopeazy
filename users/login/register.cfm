
<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="../../layouts/header.cfm">
<cfinclude  template="registerAction.cfm">
<body>
<!--- header div--->
   <cfinclude  template="../../layouts/navbar.cfm">
    <div class="row pt-5 pb-5">
        <div class="col-2"></div>
            <div class="col-8 checkout-col-12">
                <h2>Register</h2>
                <div class="error-msg text-danger">
                    #error_msg#
                </div>
                <form id="registrationForm" action="" method="POST" >
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" id="firstname" name="firstname" value="#variables.str_first_name#" >
                        <div class="error-msg text-danger" id="firstnameError"></div>
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" id="lastname" name="lastname" value="#variables.str_last_name#">
                         <div class="error-msg text-danger" id="lastnameError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email" value="#variables.str_email#">
                        <div class="error-msg text-danger" id="emailError"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Address</label>
                        <input type="text" id="address" name="address" value="#variables.str_address#">
                        <div class="error-msg text-danger" id="addressError"></div>
                    </div>
                    <div class="form-group">
                        <label for="phonenumber">Phone Number</label>
                        <input type="tel" id="phonenumber" name="phonenumber" maxlength="10" value="#variables.str_phone_number#" >
                        <div class="error-msg text-danger"  id="phonenumberError"></div>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">Password</label>
                        <input type="password" id="newPassword" name="newPassword" value="#variables.str_password#" >
                        <div class="error-msg text-danger" id="newPasswordError"></div>
                    </div>
                    <div class="form-group">
                        <label for="confirmpassword">Confirm Password</label>
                        <input type="password" id="confirmpassword" name="confirmpassword" value="#variables.Confirm_Password#" >
                        <div class="error-msg text-danger" id="confirmpasswordError"></div>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end ">
                        <button type="submit" value="submit" name="useregistration" class="registerbtn">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<cfinclude  template="../../layouts/footer.cfm">
<script src="#application.appBasePath#assets/js/login.js"></script>
</body>
</html>
</cfoutput>
 
