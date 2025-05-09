<cfscript>
variables.qryAllProducts=getAllProducts();
function getAllProducts(){
    var products = QueryNew('');
    products=queryExecute(
        "select int_product_id,str_name,str_description,int_price from tbl_products" ,
        [],
        {datasource=application.datasource}
    )
    return products;
}
</cfscript>
