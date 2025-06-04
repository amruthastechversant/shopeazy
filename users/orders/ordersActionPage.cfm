<cfscript>
 if (structKeyExists(session, "userid") and len(session.userid) > 0){
   finalorders = queryExecute(
    "SELECT i.int_order_id, i.int_product_id, i.int_price, i.int_quantity,
            p.str_name, pi.image_path
     FROM tbl_order_items AS i
     JOIN tbl_products AS p ON i.int_product_id = p.int_product_id
     JOIN tbl_product_image AS pi ON pi.int_product_id = p.int_product_id
     JOIN tbl_orders AS o ON o.int_order_id = i.int_order_id
     WHERE o.int_user_id = ?
     ORDER BY i.int_order_id",
    [session.userid],
    {datasource = application.datasource}
);

 
   
 }
</cfscript>