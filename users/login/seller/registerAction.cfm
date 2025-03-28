<cfscript>

function getProductCategory() {
    var sql = "SELECT int_category_id, str_category_name FROM tbl_categories WHERE int_product_status = 1";
    
    // Execute the query
    var result = queryExecute(sql, [], {datasource: application.datasource});
    variables.categories = result;
}

   

    function setDefaultValues()  access="public" returntype="any"{
        variables.str_company_name="";
        variables.str_company_email="";
        variables.str_company_address="";
        variables.str_contact_number="";
        variables.str_gst_number="";
        variables.str_license_number="";
        variables.seller_password="";
        variables.seller_Confirm_Password="";
        variables.error_msg="";
        variables.success_msg="";
        variables.productcategory= "";
        variables.categories=[];

    }

    function getFormValues() access="public" returntype="any"{
        if (structKeyExists(form, "useregistration")){
            variables.str_company_name=form.companyName;
            variables.str_company_email=form.CompanyEmail;
            variables.str_company_address=form.CompanyAddress;
            variables.str_contact_number=form.Contactno;
            variables.str_gst_number=form.gstNo;
            variables.str_license_number=form.lisenceNo;
            variables.seller_password=form.newSellerPassword;
            variables.seller_Confirm_Password=form.sellerconfirmpassword;
           if( structKeyExists(form, "productcategory") ){
                variables.productcategory = form.productcategory;
            }
        }
    }

    function validateFormValues(string companyName,string CompanyEmail,string CompanyAddress,string gstNo,string newSellerPassword,string sellerconfirmpassword,string productcategory) access="public" returnType="string"{
        if (len(companyName) EQ 0){
            variables.error_msg &="Enter companyName";
        }
          if (len(productcategory) EQ 0){
            variables.error_msg &="Enter product category";
        }
        if (len(CompanyEmail) EQ 0){
            variables.error_msg &=" Enter CompanyEmail";
        }
        if (len(CompanyAddress) EQ 0){
            variables.error_msg &=" Enter CompanyAddress";
        }
        if (len(contactNo) EQ 0){
            variables.error_msg &=" Enter contactNo";
        }
        if (len(gstNo) EQ 0){
            variables.error_msg &=" Enter gstNo";
        }
        if (len(lisenceNo) EQ 0){
            variables.error_msg &=" Enter lisenceNo";
        }
        if (len(newSellerPassword) EQ 0){
            variables.error_msg &=" Enter newSellerPassword";
        }
        if (len(sellerconfirmpassword) EQ 0){
            variables.error_msg &=" Enter Confirm Password";
        }
            if(newSellerPassword !==sellerconfirmpassword){
                variables.error_msg &="password mistaches";
            }
         return variables.error_msg;
    }


   
 
function register(companyName, CompanyEmail, CompanyAddress, Contactno,gstNo,lisenceNo, newSellerPassword, sellerconfirmpassword,productcategory) access="public" returnType="any" {
               
    checkUserSql = "SELECT COUNT(int_user_id) AS userCount 
                    FROM tbl_users 
                    WHERE str_email = :CompanyEmail OR str_phone_number = :Contactno";

    checkParams = {
        CompanyEmail = CompanyEmail,
        Contactno = Contactno
    };

    checkResult = queryExecute(checkUserSql, checkParams, {datasource= application.datasource});
    // writeDump(checkResult.userCount);abort;

    if (checkResult.userCount > 0) {
        variables.error_msg = "A user with this CompanyEmail or phone number already exists.";
        return variables.error_msg;
    }
    // Proceed with the insertion if no duplicates found
    sql = "INSERT INTO tbl_users(str_first_name, str_email,str_address,str_phone_number,str_password, int_role_id)
           VALUES (:value1, :value2, :value3, :value4, :value5, :value6)";

    // Define the parameters for the insert query
    params = {
        value1 = companyName,
        value2 = CompanyEmail,
        value3 = CompanyAddress,
        value4 = Contactno,
        value5 = newSellerPassword,
        value6 = 2
    };

   
    // Execute the query to insert the new user
    queryExecute(sql, params, {datasource= application.datasource});

    // Get the last inserted user_id
    sql = "SELECT LAST_INSERT_ID() AS user_id";
    result = queryExecute(sql, {}, {datasource= application.datasource});

    // Retrieve the user_id
    user_id = result.user_id;
    sql2 = "INSERT INTO tbl_seller_info(int_user_id, int_gst_no,int_lisence_no,int_product_category)
            VALUES (:value1, :value2, :value3, :value4)";

    // Define the parameters for the insert query
    params2 = {
        value1 = user_id,
        value2 = gstNo,
        value3 = lisenceNo,
        value4 = 1
    };

   
    // Execute the query to insert the new user
    queryExecute(sql2, params2, {datasource= application.datasource});


     variables.success_msg =  "User registered successfully!";
    return variables.success_msg;

}
     
    setDefaultValues();
    /* On form submit*/
    if(structKeyExists(form, "useregistration")){
        getFormValues();
        variables.error_msg = validateFormValues(
            companyName=variables.str_company_name,
            CompanyEmail= variables.str_company_email,
            CompanyAddress=  variables.str_company_address,
            Contactno= variables.str_contact_number,
            gstNo= variables.str_gst_number,
            lisenceNo=variables.str_license_number,
            newSellerPassword=variables.seller_password,
            sellerconfirmpassword= variables.seller_Confirm_Password,
            productcategory= variables.productcategory
            
        );
        if( len(variables.error_msg EQ 0)){
            register(
            companyName=variables.str_company_name,
            CompanyEmail= variables.str_company_email,
            CompanyAddress=  variables.str_company_address,
            Contactno= variables.str_contact_number,
            gstNo= variables.str_gst_number,
            lisenceNo=variables.str_license_number,
            newSellerPassword=variables.seller_password,
            sellerconfirmpassword= variables.seller_Confirm_Password,
            productcategory= variables.productcategory
            )
        }
    }

getProductCategory();
</cfscript>