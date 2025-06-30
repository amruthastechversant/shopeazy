<cfscript>
   if(structKeyExists(url, "orderID") && len(url.orderID) > 0){
     orderID=url.orderID;
     orderItems = queryExecute(
          "select p.str_name,i.int_price,i.int_quantity,i.int_product_id,i.product_color,i.product_size,i.product_material,pi.image_path from tbl_products as p Join tbl_order_items as i
          on p.int_product_id=i.int_product_id 
          join tbl_product_image as pi 
          on i.int_product_id = pi.int_product_id 
          where i.int_order_id = ?",
     [
        { value = url.orderID, cfsqltype = "cf_sql_integer" }
    ],
     {datasource=application.datasource}
     );

    for(row in orderItems){
        productId=orderItems.int_product_id;
        quantityOrdered=orderItems.int_quantity;

        queryExecute(
          "update tbl_products set int_stock_quantity=int_stock_quantity-?
          where int_product_id=? ",
          [
          {value=quantityOrdered,cfsqltype="cf_sql_integer"},
          {value=productId,cfsqltype="cf_sql_integer"}
          ],
          {datasource=application.datasource}
        );
    }
    }
   
</cfscript>