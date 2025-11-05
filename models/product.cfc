component displayname="ProductComponent"{

    public any function getProductDetails(id){
        qryGetProduct = queryExecute(
            "SELECT p.int_product_id, p.str_name, p.str_description, p.int_price,p.int_stock_quantity,p.rating, i.image_path
            FROM tbl_products AS p
            JOIN tbl_product_image AS i ON p.int_product_id = i.int_product_id
            WHERE p.int_product_status = 1 AND p.int_product_id = ?",
            [{value=id, cfsqltype="cf_sql_integer"}],
            {datasource=application.datasource}
        );
        return qryGetProduct;
    } 

    public any function getProductVariants(id){
        var qryGetVariants = queryExecute(
            "select pv.id,pv.int_product_id,pv.int_properties_id,pv.str_properties_value,pv.str_display_name,p.int_product_id,pr.id,pr.str_properties
            from tbl_product_variants as pv 
            join tbl_products as p on pv.int_product_id = p.int_product_id 
            join tbl_product_properties as pr on pv.int_properties_id  = pr.id
            where 
            p.int_product_id = ?",
             [{value=id, cfsqltype="cf_sql_integer"}],
             {datasource=application.datasource}
        );
        return qryGetVariants;
    }
}
