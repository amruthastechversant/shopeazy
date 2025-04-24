<cfscript>
 if (structKeyExists(session, "userid") and len(session.userid) > 0){
    finalorders=queryExecute(
    "select o.int_order_id,o.int_user_id,o.int_total_amount,o.int_payment_method,o.int_order_status,o.int_payment_status,o.address,i.int_product_id,i.int_price,i.int_quantity from tbl_orders as o join tbl_order_items as i on i.int_order_id=o.int_order_id where o.int_user_id=?",
    [value=session.userid],
    {datasource=application.datasource}
    );
 
 }
</cfscript>