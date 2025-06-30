<cfsetting showdebugoutput="false">
<cfscript>
if (structKeyExists(url, "approve") && url.approve == "true"){
    response=structNew();
    int_user_id=val(form.id);
    variables.result = sellerPermission(int_user_id, "Approved");
    response.status=true;
    response.message="Seller has been approved successfully";
    writeOutput(serializeJSON(response));
}

if(structKeyExists(url, "deactivate")&& url.deactivate == "true"){
    response=structNew();
    variables.result=  sellerPermission(val(form.id), "Deactivate");
    response.status=true;
    response.message="Deactivated";
    writeOutput(serializeJSON(response));
}

if(structKeyExists(url, "reject")&& url.reject == "true"){
    response = structNew();
    variables.result=sellerPermission(val(form.id), "Rejected");
    response.status=true;
    response.message="rejected";
    writeOutput(serializeJSON(response));
}
function sellerPermission(int_seller_id, seller_status) {
    qrySellerPermission = queryExecute(
        "update tbl_seller_info set str_seller_status = ?
        where int_seller_id = ?",
        [
        {value=seller_status, cfsqltype = "cf_sql_varchar"},
        {value=int_seller_id, cfsqltype = "cf_sql_integer"}
        ],
        {datasource=application.datasource}
    )

     status = "success";
     return status;
    
}

</cfscript>