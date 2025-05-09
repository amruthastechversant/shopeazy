<cfscript>
 if (structKeyExists(session, "adminid") and len(session.adminid) > 0) {
        variables.adminid = session.adminid;
    }
variables.categoryqryResult=getCategoryqry();

variables.qryGetProductProperties= getProductProperties();

if(structKeyExists(url, "id")){
    productId=url.id;
  
    qryGetProduct=queryExecute(
        "select * from tbl_products where int_product_id=?",
        [{value=productId,cfsqltype="cf_sql_integer"}],
        {datasource=application.datasource}
    )
    qryGetVariants = queryExecute(
        "select pv.int_product_id,pv.int_properties_id,pv.str_properties_value,p.id,p.str_properties from tbl_product_variants as pv join tbl_product_properties as p
         on pv.int_properties_id = p.id where int_product_id=?",
        [{value=productId,cfsqltype="cf_sql_integer"}],
        {datasource=application.datasource}
    ) 
    if(qryGetProduct.recordCount){
        variables.editProduct=qryGetProduct;
    }
    if(qryGetVariants.recordCount){
        variables.editVarient=qryGetVariants;
    }
    // writeDump( variables.editVarient);abort;


}
if(structKeyExists(form,"addProduct")){
    uploadedFilePath="";

    if(isDefined("form.productImage") && len(form.productImage)){
    uploadDir=expandPath("../../assets/uploads/products/");
     cffile(action = "upload", fileField = "productImage", destination = uploadDir, accept = "image/*", nameConflict = "MakeUnique", result="uploadResult");
    uploadedFilePath = 'assets/uploads/products/' &uploadResult.serverFile 
    }
    variables.product={
        productName=form.productName,
        uploadedFilePath = uploadedFilePath,
        productPrice = form.productPrice,
        productDescription = form.productDescription,
        productStock = form.productStock,
        category_id = form.category_id,
        properties=[]
       }; 
        for(i=1;i<=variables.qryGetProductProperties.recordCount;i++){
        propertyName=variables.qryGetProductProperties["str_properties"][i];//size,color,materials
        propertyId=variables.qryGetProductProperties["id"][i];//1,2,3
        fieldName=propertyName & "_" & propertyId//size_1
        if (structKeyExists(form,"fieldName" )){
            arrayAppend(variables.product.properties,{
                Name=propertyName,
                Id=propertyId,
                value=form[fieldName]
            });
        }
       }
         if (structKeyExists(form, "id")) {
            productId=form.id;
            updateProductData(productId,variables.product );
        }
         else {
            addProduct(variables.product);
        }
    
}

function getCategoryqry(){
   var  categoryqryResult= queryExecute(
        "select int_category_id,str_category_name from tbl_categories",
        [],
        {datasource=application.datasource}
    );
    return categoryqryResult;
}

function addProduct(productData){
        addProductqry=queryExecute(
            "insert into tbl_products(str_name,str_description,int_price,int_stock_quantity,int_category_id,created_at,updated_at,int_product_status)values(?,?,?,?,?,?,?,?)",
            [
                {value=productData.productName,cfsqltype="cf_sql_varchar"},
                {value=productData.productDescription,cfsqltype="cf_sql_varchar"},
                {value=productData.productPrice,cfsqltype="cf_sql_integer"},
                {value=productData.productStock,cfsqltype="cf_sql_integer"},
                {value=productData.category_id,cfsqltype="cf_sql_integer"},
                {value=now(),cfsqltype="cf_sql_timestamp"},
                {value=now(),cfsqltype="cf_sql_timestamp"},
                {value=1,cfsqltype="cf_sql_integer"}
                
            ],
            {datasource=application.datasource}
            );

        qryGetProductId= queryExecute(
            "select LAST_INSERT_ID() as productId ",
            {},
            {datasource=application.datasource}
        );
        if(qryGetProductId.productId) {
            qryAddImage= queryExecute(
                "insert into tbl_product_image(int_product_id,image_path) values(?,?)",
                 [
                    {value=qryGetProductId.productId,cfsqltype="cf_sql_integer"},
                    {value=uploadedFilePath,cfsqltype="cf_sql_varchar"}
                 ],
                 {datasource=application.datasource}
                );
        }
addProductVarients(qryGetProductId.productId);
}

function updateProductData(productId,productData ){
    qryUpdateData=queryExecute(
        "update tbl_products set str_name = ?,str_description = ?,int_price = ?,int_stock_quantity=?,int_category_id = ?,created_at = ?,updated_at = ?,int_product_status =?
           where int_product_id=?",
            [
                {value=productData.productName,cf_sql_type="cf_sql_varchar"},
                {value=productData.productDescription,cf_sql_type="cf_sql_varchar"},
                {value=productData.productPrice,cfsqltype="cf_sql_integer"},
                {value=productData.productStock,cfsqltype="cf_sql_integer"},
                {value=productData.category_id,cfsqltype="cf_sql_integer"},
                {value=now(),cfsqltype="cf_sql_timestamp"},
                {value=now(),cfsqltype="cf_sql_timestamp"},
                {value=1,cfsqltype="cf_sql_integer"},
                {value=productId}
            ],
            {datasource=application.datasource}
                );

        if(len(productData.uploadedFilePath)){
            qrypreviousImage=queryExecute(
                "update tbl_product_image set image_path=? where int_product_id=?",
                [
                    {value=productData.uploadedFilePath},
                    {value=productId,cfsqltype="cf_sql_integer"}
                    
                ],
                {datasource=application.datasource}
            );
        }
    addProductVarients(productId);

}

 function addProductVarients(productId){

        variables.params = [];
        variables.valueclauses=[];

        for(i=1;i<=variables.qryGetProductProperties.recordCount;i++){
            variables.propId     =variables.qryGetProductProperties["id"][i];
            variables.propName   = variables.qryGetProductProperties["str_properties"][i];

            fieldName  = propName & "_" & propId;


             if (structKeyExists(form, fieldName)) {

            valuesArray = listToArray(trim(form[fieldName]), ",");

           for (j = 1; j <= arrayLen(valuesArray); j++) {
                thisValue = trim(valuesArray[j]);

                if (len(thisValue)) { 
                    arrayAppend(variables.valueclauses, "(?,?,?)");
                    arrayAppend(variables.params, {value = productId, cfsqltype = "cf_sql_integer"});
                    arrayAppend(variables.params, {value = variables.propId, cfsqltype = "cf_sql_integer"});
                    arrayAppend(variables.params, {value = thisValue, cfsqltype = "cf_sql_varchar"});
                }
            }
        }
    }
      writeDump('INSERT INTO tbl_product_variants (int_product_id, int_properties_id, str_properties_value)
         VALUES ' & arrayToList(variables.valueClauses, ", "));abort;
    if (arrayLen(variables.valueClauses)) {
        if(structKeyExists(form, "id")){
            productId=form.id;
            qryUpdateVariants = queryExecute(
                "update tbl_product_variants set str_properties_value = ? where int_properties_id=?",
                [
                    {value=thisValue},
                    {value=productId}
                ],
                {datasource = application.datasource}
            );
        }
         qryAddProductVarients = queryExecute(
            "INSERT INTO tbl_product_variants (int_product_id, int_properties_id, str_properties_value)
         VALUES " & arrayToList(variables.valueClauses, ", "),
            variables.params,
             {datasource = application.datasource}
         );
    }
}
 

function getProductProperties(){
    qryGetProductProperties=queryExecute(
        "select id,str_properties from tbl_product_properties",
        [],
         {datasource=application.datasource}
        )
    return qryGetProductProperties;
}



</cfscript>
