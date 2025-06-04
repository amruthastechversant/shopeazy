<cfsetting showdebugoutput="false">
<cfscript>
if (structKeyExists(url, "approve") && url.approve == "true"){
    response=structNew();
    int_user_id=val(form.id);
    variables.result = sellerPermission(int_user_id);
    response.status=true;
    response.message="Seller has been approved successfully";
    writeOutput(serializeJSON(response));
}

function sellerPermission(int_user_id) {
    qrySellerPermission = queryExecute(
        "update tbl_seller_info set str_seller_status ='Approved'
        where int_user_id = ?",
        [
        {value=int_user_id, cfsqltype = "cf_sql_integer"}
        ],
        {datasource=application.datasource}
    )

     status = "success";
     return status;
}
</cfscript>