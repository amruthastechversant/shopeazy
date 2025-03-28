<cfscript>
    function setDefaultValues()  access="public" returntype="any"{
        variables.str_first_name="";
        variables.str_last_name="";
        variables.str_email="";
        variables.str_address="";
        variables.str_phone_number="";
        variables.str_password="";
        variables.Confirm_Password="";
        variables.error_msg="";
        variables.success_msg="";

    }

    function getFormValues() access="public" returntype="any"{
        if (structKeyExists(form, "useregistration")){
            variables.str_first_name=form.firstname;
            variables.str_last_name=form.lastname;
            variables.str_email=form.email;
            variables.str_address=form.address;
            variables.str_phone_number=form.phonenumber;
            variables.str_password=form.newPassword;
            variables.Confirm_Password=form.confirmpassword;
        }
    }

    function validateFormValues(string firstname,string lastname,string email,string address,string phonenumber,string newPassword,string confirmpassword) access="public" returnType="string"{
        if (len(firstname) EQ 0){
            variables.error_msg &="Enter firstname";
        }

        if (len(lastname)EQ 0){
            variables.error_msg &=' Enter lastname';
        }
        if (len(email) EQ 0){
            variables.error_msg &=" Enter email";
        }
        if (len(address) EQ 0){
            variables.error_msg &=" Enter address";
        }
        if (len(phonenumber) EQ 0){
            variables.error_msg &=" Enter phonenumber";
        }
        if (len(newPassword) EQ 0){
            variables.error_msg &=" Enter password";
        }
        if (len(confirmpassword) EQ 0){
            variables.error_msg &=" Enter Confirm Password";
        }
            if(newPassword !==confirmpassword){
                variables.error_msg &="password mistaches";
            }
         return variables.error_msg;
    }


   
 
function register(firstname, lastname, email, address, phonenumber, newPassword, confirmpassword) access="public" returnType="any" {
                 
    checkUserSql = "SELECT COUNT(int_user_id) AS userCount 
                    FROM tbl_users 
                    WHERE str_email = :email OR str_phone_number = :phonenumber";

    checkParams = {
        email = email,
        phonenumber = phonenumber
    };

    checkResult = queryExecute(checkUserSql, checkParams, {datasource= application.datasource});
    // writeDump(checkResult.userCount);abort;

    if (checkResult.userCount > 0) {
        variables.error_msg = "A user with this email or phone number already exists.";
        return variables.error_msg;
    }
    // Proceed with the insertion if no duplicates found
    sql = "INSERT INTO tbl_users(str_first_name, str_last_name, str_email, str_address, str_phone_number, str_password, int_role_id)
           VALUES (:value1, :value2, :value3, :value4, :value5, :value6, :value7)";

    // Define the parameters for the insert query
    params = {
        value1 = firstname,
        value2 = lastname,
        value3 = email,
        value4 = address,
        value5 = phonenumber,
        value6 = newPassword,
        value7 = 3
    };

   
    // Execute the query to insert the new user
    queryExecute(sql, params, {datasource= application.datasource});
     variables.success_msg =  "User registered successfully!";
    return variables.success_msg;

}
     
    setDefaultValues();
    /* On form submit*/
    if(structKeyExists(form, "useregistration")){
        getFormValues();
        variables.error_msg = validateFormValues(
            firstname=variables.str_first_name,
            lastname=variables.str_last_name,
            email= variables.str_email,
            address=  variables.str_address,
            phonenumber= variables.str_phone_number,
            newPassword=variables.str_password,
            confirmpassword= variables.Confirm_Password
            
        );
        if( len(variables.error_msg EQ 0)){
            register(
            firstname=variables.str_first_name,
            lastname=variables.str_last_name,
            email= variables.str_email,
            address=  variables.str_address,
            phonenumber= variables.str_phone_number,
            newPassword=variables.str_password,
            confirmpassword= variables.Confirm_Password
            
            )
        }
    }
</cfscript>