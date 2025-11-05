 <cfsetting showDebugOutput="false">

<cfscript>
 if (structKeyExists(session, "id") and len(session.id) > 0){
   finalorders = queryExecute(
    "SELECT i.int_order_id, i.int_product_id, i.int_price, i.int_quantity,
            p.str_name, pi.image_path
     FROM tbl_order_items AS i
     JOIN tbl_products AS p ON i.int_product_id = p.int_product_id
     JOIN tbl_product_image AS pi ON pi.int_product_id = p.int_product_id
     JOIN tbl_orders AS o ON o.int_order_id = i.int_order_id
     WHERE o.int_user_id = ?
     ORDER BY i.int_order_id",
    [session.id],
    {datasource = application.datasource}
);
 }
 if(structKeyExists(form, "saveReview")){
      productReviewqry=queryExecute(
        "insert into tbl_product_reviews(int_user_id,int_product_id,int_rating,str_review_text,review_date)values(?,?,?,?,?)",
        [
          {value=session.id,cfsqltype="cf_sql_integer"},
          {value=form.int_product_id,cfsqltype="cf_sql_integer"},
          {value=form.rating,cfsqltype="cf_sql_integer"},
          {value=form.str_review_text,cfsqltype="cf_sql_varchar"},
          {value=now(),cfsqltype="cf_sql_timestamp"}
        ],
         {datasource=application.datasource}
      );
     response ={"STATUS" ="success"}; 
    cfcontent(type="application/json");
    writeOutput(serializeJSON(response));

    addProductRatingqry = queryExecute(
      "update tbl_products set rating=?
      where int_product_id= ?",
      [
        {value=form.rating,cfsqltype="cf_sql_integer"},
        {value=form.int_product_id,cfsqltype="cf_sql_integer"}
      ],
       {datasource=application.datasource}
    )
    return ;

 }

</cfscript>