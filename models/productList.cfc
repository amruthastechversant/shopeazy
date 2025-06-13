component displayname="productListcomponent"{
    
public any function getAllProducts(){
param name="url.page",default=1;
param name="form.keyword" default="%%"; // Ensure 'url.keyword' exists
perPage=5;
offset=(url.page - 1)*perPage; 

    var products = QueryNew('');
    var qryTotal =  QueryNew('');
    var keyword = "%" & trim(form.keyword) & "%"
    var qryTotal = queryExecute(
        "select count(*) as totalCount from tbl_products
        where str_name LIKE :keyword",
        [
            keyword:{value:keyword,name:keyword,cfsqltype="cf_sql_varchar"}
        ],
        {datasource=application.datasource}
    );

    var totalRecords = qryTotal.totalcount;
    variables.totalPages = ceiling(totalRecords/perPage);
    products=queryExecute(
        "select p.int_product_id,p.str_name,p.str_description,p.int_price,p.int_product_status,s.status from tbl_products as p join tbl_product_status as  s
        on p.int_product_status = s.status 
        where str_name LIKE :keyword order by (s.status = 'inactive') desc  LIMIT :limit OFFSET :offset ",
        [
        KEYWORD:{value:keyword,name:keyword,cfsqltype="cf_sql_varchar"},
        LIMIT:{value:perPage,cfsqltype="cf_sql_integer"},
        OFFSET:{value:offset,cfsqltype="cf_sql_integer"}
        ],
        {datasource=application.datasource}
    )
    return{products=products,totalRecords=totalRecords,totalPages=variables.totalPages};
}

 public any function getSellerDetails(){
param name="url.page",default=1;
param name="form.keyword" default="%%"; // Ensure 'url.keyword' exists
perPage=5;
offset=(url.page - 1)*perPage; 

    var sellers = QueryNew('');
    var qryTotal =  QueryNew('');
    var keyword = "%" & trim(form.keyword) & "%"
    var qryTotal = queryExecute(
        "select count(s.int_seller_id) as totalcount
            from tbl_seller_info as s  
            left join tbl_users as u 
            on s.int_user_id = u.int_user_id 
        where str_first_name LIKE :keyword",
        [
            keyword:{value:keyword,name:keyword,cfsqltype="cf_sql_varchar"}
        ],
        {datasource=application.datasource}
    );

    var totalRecords = qryTotal.totalcount;
    variables.totalPages = ceiling(totalRecords/perPage);
        qryGetSellerDetails  = queryExecute(
            "SELECT  
                s.int_seller_id,
                s.int_user_id,
                s.int_gst_no,
                s.int_lisence_no,
                s.int_product_category,
                s.str_seller_status,
                u.str_first_name,
                u.str_email,
                u.str_address,
                u.int_role_id,
                c.str_category_name,
                c.int_category_id
            FROM tbl_seller_info AS s  
            LEFT JOIN tbl_users AS u 
                ON s.int_user_id = u.int_user_id 
            LEFT JOIN tbl_categories AS c
                ON s.int_product_category = c.int_category_id
            where str_first_name LIKE :keyword order by (s.str_seller_status = 'pending') asc  LIMIT :limit OFFSET :offset ",
            [
            KEYWORD:{value:keyword,name:keyword,cfsqltype="cf_sql_varchar"},
            LIMIT:{value:perPage,cfsqltype="cf_sql_integer"},
            OFFSET:{value:offset,cfsqltype="cf_sql_integer"}
            ],
             {datasource=application.datasource}
        );
        return{qryGetSellerDetails=qryGetSellerDetails,totalRecords=totalRecords,totalPages=variables.totalPages};
    }

    public any function getSellerProducts(){
    param name="url.page",default=1;
    param name="form.keyword" default="%%"; // Ensure 'url.keyword' exists
    perPage=3;
    offset=(url.page - 1)*perPage;  
     if(structKeyExists(session, "id") && (session.id) > 0){
        variables.id=session.id;
     }
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
   
    sellerProducts=queryExecute(
        "select p.int_product_id,p.str_name,p.str_description,p.int_price,i.image_path,p.created_by,s.status from tbl_products  as p join tbl_product_image as i on 
        p.int_product_id=i.int_product_id join tbl_product_status as  s
        on p.int_product_status = s.status where p.created_by=:createdby  and p.str_name LIKE :keyword  LIMIT :limit OFFSET :offset",
        [
            createdby:{value:variables.id,cfsqltype="cf_sql_integer"},
            KEYWORD:{value:keyword,name:keyword,cfsqltype="cf_sql_varchar"},
            LIMIT:{value:perPage,cfsqltype="cf_sql_integer"},
            OFFSET:{value:offset,cfsqltype="cf_sql_integer"}
        ],
        {datasource=application.datasource}
    )
    return{products=sellerProducts, totalRecords=totalRecords,totalPages=variables.totalPages};
}
}