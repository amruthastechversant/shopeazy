<cfsetting showdebugoutput="false">
<cfscript>
variables.productList= createObject("component", application.appBasePath & "models.productList");
variables.qryAllProductsResult=variables.productList.getAllProducts();
variables.totalPages=variables.qryAllProductsResult.totalPages
variables.qryAllProducts = variables.qryAllProductsResult.products;

if (structKeyExists(url, "getStatus") && url.getStatus == "true") {
    result = {};
    try {
        productId = trim(form.id);
        newStatus = trim(form.status);

        position = reFindNoCase("_", productId);
        extractedNumber = Mid(productId, position + 1, Len(productId) - position);
        productId=extractedNumber;
        
        if(newStatus == "active")
            newStatus=1;
        else if(newStatus == "inactive")
            newStatus=2;
        
        // Update status in the database
         queryExecute(
            "UPDATE tbl_products
             SET int_product_status = :newStatus
             WHERE int_product_id= :productId",
            {
                newStatus: { value = newStatus, cfsqltype = "cf_sql_integer" },
                productId: { value = productId, cfsqltype = "cf_sql_integer" }
            },
           {datasource=application.datasource}
        );
        result.status = "success";
        result.redirect_url = "/myprojects/shopeazy/admin/products/fullProducts.cfm";
    } catch (any e) {
        result.status = "error";
        result.message = "Database error: " & e.message;
    }
    WriteOutput("||" & serializeJSON(result) & "||");
    return ;
}

</cfscript>
