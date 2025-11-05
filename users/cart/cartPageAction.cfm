<cfscript>
    if(structKeyExists(session, "id") and session.id GT 0){
        userId=session.id
    }
  

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