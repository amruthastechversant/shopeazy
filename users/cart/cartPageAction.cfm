<cfscript>
    if(structKeyExists(session, "userID") and session.userId GT 0){
        userId=session.userId
    }
  /*  cartInfo=queryExecute(
        "select int_cart_id,int_user_id from tbl_cart where int_user_id=?",
        [{value=userId ,cfsqltype="cf_sql_integer"}],
        {datasource=application.datasource}
    )
    if(cartInfo.recordCount > 0){
        cartId=cartInfo.int_cart_id
    

    cartItems=queryExecute(
        "select c.int_cart_item_id,c.int_quantity,c.price_at_time_of_addition,p.str_name,p.int_price 
        from tbl_cart_items as c join tbl_products as p 
        on c.int_product_id=p.int_product_id where c.int_cart_id=?",
        [{value=cartId,cfsqltype="cf_sql_integer"}],
        {datasource=application.datasource}
        )
    
    }else{
        cartItems=queryNew("")
    }
    }else{
        cartItems=queryNew("")
    }
    if (structKeyExists(url, "deleteItemId") and isNumeric(url.deleteItemId)){
        deleteItemId=url.deleteItemId

        queryExecute(
            "delete from tbl_cart_items where int_cart_item_id =?",
            [{value=deleteItemId,cfsqltype="cf_sql_integer"}],
            {datasource=application.datasource}
        )

        location(url="#application.appBasePath#users/cart/cartPage.cfm?status=deleted", addtoken=false);
    }
  */

    // Cart using session Start

    // Get Cart Items
    if(structKeyExists(session, "cart") && arrayLen(session.cart) > 0){
        cartItems = session.cart;
    }
   else{
        cartItems=[];
     }
    // Delete Cart Item
     if (structKeyExists(url,"deleteItemId") ){
        deleteItemId=url.deleteItemId;
        deleted=false;
        for (i =1;i<=arrayLen(session.cart);i++) {
            if(session.cart[i].product_id EQ deleteItemId){
                arrayDeleteAt(session.cart, i);
                deleted=true;
            }

        }
     }

    //  Update cart Item
    if(structKeyExists(url, "updateCart") AND url.updateCart eq true){
        productIndex = -1;
        for (i = 1; i <= arrayLen(session.cart); i++) {
        if (session.cart[i].product_id == form.product_id) {
            productIndex = i;
            break;
        }
        }

    if (productIndex != -1) {
    session.cart[productIndex].quantity = form.quantity;
    session.cart[productIndex].price_at_time_of_addition = form.total_price;
    } else {
    writeOutput("Product not found in the cart.");
    }
    }
    
  
    // Cart using session End
    
</cfscript>