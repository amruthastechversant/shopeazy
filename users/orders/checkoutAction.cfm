<cfscript>
     if (structKeyExists(session, "userid") and len(session.userid) > 0) {
        variables.userId = session.userid;
    }
    totalAmount=url.finalTotal;
    if(structKeyExists(form, "confirmOrder")){
        userId=session.userid;
        // create order id for existing cartitems
        orderId=insertOrderquery(userId,totalAmount,form.payment_option,form.address);
        orderDate=now();
        orderStatus=1;//pendimg
        paymentStatus=1;
        if(arrayLen(session.cart)){
            for(Item in session.cart){
                addOrderItems(orderID,Item);
            }
          structDelete(session, "cart");
            location(url="#application.appBasePath#users/orders/orderConfirmationPage.cfm?status=orders&orderId=#orderID#")

        }

    }
    function getOrderDetails(){
        qrycheckorder=queryExecute(
            "select int_order_id from tbl_orders where int_user_id=?",
            [
                {value=userId,cfsqltype="cf_sql_integer"}
            ],
            {datasource=application.datasource}
            )
        if(qrycheckorder.recordCount NEQ 0){
            return qrycheckorder.int_order_id;
        }
        else{
            return 0;
        }
    }
    function insertOrderquery(){
        queryExecute(
            "insert into tbl_orders(int_user_id,int_total_amount,int_payment_method,int_order_status,int_payment_status,address,created_at,updated_at)values(?,?,?,?,?,?,?,?)",
            [
                {value=session.userId,cfsqltype="cf_sql_integer"},
                {value=totalAmount,cfsqltype="cf_sql_decimal"},
                {value=form.payment_option,cfsqltype="cf_sql_varchar"},
                {value=1,cfsqltype="cf_sql_integer"},
                {value=1,cfsqltype="cf_sql_integer"},
                {value=form.address,cfsqltype="cf_sql_varchar"},
                {value=now(),cfsqltype="cf_sql_timestamp"},
                {value=now(),cfsqltype="cf_sql_timestamp"}
            ],
            {datasource=application.datasource}
        );

    
       getorderIdquery= queryExecute(
        "select LAST_INSERT_ID() as orderID ",
        {},
        {datasource=application.datasource}
       );
       return getorderIdquery.orderID;
    }

    function addOrderItems(orderID,Item){
       addOrderItemsqry= queryExecute(
            "insert into tbl_order_items(int_order_id,int_product_id,int_price,int_quantity) values(?,?,?,?)",
            [
                {value=orderID,cfsqltype="cf_sql_integer"},
                {value=Item.product_id,cfsqltype="cf_sql_integer"},
                {value=Item.price_at_time_of_addition,cfsqltype="cf_sql_decimal"},
                {value=Item.quantity,cfsqltype="cf_sql_integer"}
            
            ],
            {datasource=application.datasource}
            
        );

    }
    


</cfscript>