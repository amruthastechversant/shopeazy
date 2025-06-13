<cfscript>
    if (structKeyExists(session, "id") and len(session.id) > 0) {
        variables.userId = session.id;
    }

    variables.qryProductsResult=getAllProducts();
    variables.qryProducts=variables.qryProductsResult.products;
    session.itemAdded = false;
    // writeDump(getProductId());abort;
    if (structKeyExists(form, "addToCart_DB")){
        userId=session.id;
        cartId=0;
        variables.qryGetCartDetails = getCartDetails();
    //    writeDump(variables.qryGetCartDetails );abort;
        if(val(variables.qryGetCartDetails) EQ 0){
            cartId = addProductToCart();
        } else {
            cartId=variables.qryGetCartDetails;
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

        qryGetProduct = queryExecute(
            "select p.int_product_id,p.str_name,p.int_price,p.int_stock_quantity,pI.image_path from tbl_products as p join tbl_product_image as pI
            on p.int_product_id = pI.int_product_id where p.int_product_id=?",
            [{value=form.product_id,cfsqltype="cf_sql_integer"}],
            {datasource=application.datasource}
        )

          productIdList = "";
            for (item in session.cart) {
                productIdList &= (len(productIdList) ? "," : "") & item.product_id;
            }
            
            existingProduct=listFind(productIdList, form.product_id);

            if(existingProduct){
                session.cart[existingProduct].quantity+=1;
                session.cart[existingProduct].price_at_time_of_addition+=qryGetProduct.int_price
            }
            else{
            variables.product={
                product_id=qryGetProduct.int_product_id,
                str_name=qryGetProduct.str_name,
                price_at_time_of_addition=qryGetProduct.int_price,
                quantity=1,
                image_path = qryGetProduct.image_path
            };

            arrayAppend(session.cart,variables.product);
            }
            // writeDump(variables.product);abort;
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
    param name="url.page",default=1;
    param name="form.keyword" default="%%"; // Ensure 'url.keyword' exists

    perPage=3;
    offset=(url.page - 1)*perPage;  
     
    // totalRecords=
    var products = QueryNew('');
    var qryTotal=queryNew('');
    var keyword = "%" & trim(form.keyword) & "%";
    var qryTotal = queryExecute(
        "SELECT COUNT(*) as totalcount FROM tbl_products p 
        JOIN tbl_product_image i ON p.int_product_id = i.int_product_id 
        WHERE p.int_product_status = 1
        AND p.str_name LIKE :keyword",
        [
            KEYWORD:{name="keyword", value=keyword, cfsqltype="cf_sql_varchar"}
        ], 
        {datasource=application.datasource}
    );
    var totalRecords = qryTotal.totalcount;
    variables.totalPages = ceiling(totalRecords/perPage);
   
    products=queryExecute(
        "select p.int_product_id,p.str_name,p.int_price,i.image_path from tbl_products  as p join tbl_product_image as i on 
        p.int_product_id=i.int_product_id where p.int_product_status=1 and p.str_name LIKE :keyword  LIMIT :limit OFFSET :offset",
        [
            KEYWORD:{value:keyword,name:keyword,cfsqltype="cf_sql_varchar"},
           LIMIT:{value:perPage,cfsqltype="cf_sql_integer"},
           OFFSET:{value:offset,cfsqltype="cf_sql_integer"}
        ],
        {datasource=application.datasource}
    )
    return {products=products, totalRecords=totalRecords};
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

