<cfscript>
variables.categories=getCategoryqry();
    if(structKeyExists(url, "id")){
        seller_id=session.id;

        qryGetSellerDetails=queryExecute(
            "select s.int_gst_no,s.int_lisence_no,s.int_product_category,u.str_first_name,u.str_email,u.str_address,u.str_phone_number,u.str_password,c.str_category_name from tbl_seller_info as s join tbl_users as u 
            on s.int_user_id = u.int_user_id join tbl_categories as c on s.int_product_category = c.int_category_id where
            s.int_seller_id=?",
            [
                {value=seller_id,cfsqltype="cf_sql_integer"}
            ],
            {datasource=application.datasource}
        )

        if(qryGetSellerDetails.recordCount){
            variables.editSellerProfile = qryGetSellerDetails;
        }
    }
    function getCategoryqry(){
    var  categoryqryResult= queryExecute(
            "select int_category_id,str_category_name from tbl_categories",
            [],
            {datasource=application.datasource}
        );
        return categoryqryResult;
}

</cfscript>