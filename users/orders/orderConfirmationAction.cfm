<cfscript>
   if(structKeyExists(url, "orderID") && len(url.orderID) > 0){
     orderID=url.orderID;
     orderItems = queryExecute(
          "select p.str_name,i.int_price,i.int_quantity from tbl_products as p Join tbl_order_items as i
          on p.int_product_id=i.int_product_id where i.int_order_id = ?",
     [
        { value = url.orderID, cfsqltype = "cf_sql_integer" }
    ],
     {datasource=application.datasource}
     );
    }
   
</cfscript>