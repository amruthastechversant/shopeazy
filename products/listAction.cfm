<cfscript>
    if (structKeyExists(session, "userId") and len(session.userId) > 0) {
        variables.userId = session.userId;
    }
    variables.qryProducts=getAllProducts();
    session.itemAdded = false;
    // writeDump(getProductId());abort;
    if (structKeyExists(form, "addToCart_DB")){
        userId=session.userId;
        cartId=0;
        variables.qryGetCartDetails = getCartDetails();
       
        if(val(variables.qryGetCartDetails) EQ 0){
            cartId = addProductToCart();
        } else {
            cartId=variables.qryGetCartDetails.int_cart_id;
        }  

        addProductItemsToCart();  

        location(url="#application.appBasePath#users/cart/cartPage.cfm?status=added", addtoken=false);
    }
    // structDelete(session, "cart");
    // using session
    if (!structKeyExists(session, "cart")) {
        session.cart = [];
    }
    if(structKeyExists(form, "addToCart")){ 
        newProduct=true;
       for(i=1;i<=arrayLen(session.cart);i++){
            variables.cartItem=session.cart[i];
        if(variables.cartItem.product_id==form.product_id){
            variables.cartItem.quantity=variables.cartItem.quantity + 1;
            variables.cartItem.price_at_time_of_addition=variables.cartItem.price_at_time_of_addition + form.product_price;
            newProduct=false;
        }
       }
       if(newProduct){
        variables.product={
            product_id=form.product_id,
            str_name=form.product_name,
            price_at_time_of_addition=form.product_price,
            quantity=1
        };
        arrayAppend(session.cart,variables.product);
       }
        session.itemAdded = true;
     location(url="#application.appBasePath#users/cart/cartPage.cfm?status=added", addtoken=false);
       
    
    }
   function getProductId(){
    var productId=queryNew('');
    productId=queryExecute(
        "select int_product_id from tbl_products where int_product_status =1",
        [],
        {datasource=application.datasource})
    return productId;
   }
function getAllProducts(){
    var products = QueryNew('');
    products=queryExecute(
        "select int_product_id,str_name,int_price from tbl_products where int_product_status=1",
        [],
        {datasource=application.datasource}
    )
    return products;
}
function getCartDetails(){
    var qryCheckcart = QueryNew('');
    qryCheckcart=queryExecute(
        "select int_cart_id from tbl_cart where int_user_id=?",
        [{value=userId,cfsqltype="cf_sql_integer"}],
        {datasource=application.datasource}
    );
    if(qryCheckcart.recordCount NEQ 0){
        return qryCheckcart.int_cart_id;
    }else{
        return 0;
    }
    
}

function addProductToCart(){
    queryExecute(
        "insert into tbl_cart(int_user_id,created_at,updated_at)values(?,?,?)",
        [
            {value=userId,cfsqltype="cf_sql_integer"},
            {value=now(),cfsqltype="cf_sql_timestamp"},
            {value=now(),cfsqltype="cf_sql_timestamp"}
        ],
        {datasource=application.datasource}
    );
    getcartId=queryExecute(
        "select max(int_cart_id) as int_cart_id from tbl_cart where int_user_id=?",
        [{value=userId,cfsqltype="cf_sql_integer"}],
        {datasource=application.datasource}
    );
    return getcartId.int_cart_id;
}
function addProductItemsToCart(){
     queryExecute(
            "insert into tbl_cart_items(int_cart_id,int_product_id,int_quantity,price_at_time_of_addition,created_at,updated_at)values(?,?,?,?,?,?)",
            [
                {value=cartId,cfsqltype="cf_sql_integer"},
                {value=form.product_id,cfsqltype="cf_sql_integer"},
                {value=1,cfsqltype="cf_sql_integer"},
                {value=form.product_price,cfsqltype="cf_sql_decimal"},
                {value=now(),cfsqltype="cf_sql_timestamp"},
                {value=now(),cfsqltype="cf_sql_timestamp"}
            ],
             {datasource=application.datasource}
        )
}
</cfscript>

<!--- <cfif session.itemAdded> 
    <script type="text/javascript">
        alert("Item added successfully!");
    </script>
    <cfset session.itemAdded = false>
</cfif>--->