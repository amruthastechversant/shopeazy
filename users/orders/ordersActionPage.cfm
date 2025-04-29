<cfscript>
 if (structKeyExists(session, "userid") and len(session.userid) > 0){
    finalorders=queryExecute(
    "select i.int_order_id,i.int_product_id,i.int_price,i.int_quantity ,p.str_name from tbl_order_items as i join tbl_products as p on i.int_product_id = p.int_product_id   
     JOIN tbl_orders as o  ON o.int_order_id  = i.int_order_id  where o.int_user_id=? ORDER BY i.int_order_id",
    [session.userid],
    {datasource=application.datasource}
    );
 
   
 }
</cfscript>