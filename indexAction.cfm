<cfscript>
variables.getParentCategories=getParentCategories();
variables.getSubCategories=getSubCategories();
// writeDump(variables.getParentCategories);abort;
    function getParentCategories(){
        getParentCategoryqry=queryExecute(
            "select int_category_id,str_category_name,int_product_status,str_category_image from tbl_categories where int_parent_category_id is null",
            [],
             {datasource = application.datasource}
        );

        return getParentCategoryqry;
    }

    function getSubCategories(){
        getSubCategoryqry = queryExecute(
            "select int_category_id,str_category_name,int_product_status,int_parent_category_id,str_category_image from tbl_categories where int_parent_category_id is not null",
            [],
             {datasource = application.datasource}

        );
        return getSubCategoryqry;
    }
    
</cfscript>