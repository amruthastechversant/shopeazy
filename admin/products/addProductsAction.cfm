<cfscript>
variables.categoryqryResult=getCategoryqry();

function getCategoryqry(){
   var  categoryqryResult= queryExecute(
        "select int_category_id,str_category_name from tbl_categories",
        [],
        {datasource=application.datasource}
    );
    return categoryqryResult;
}

</cfscript>
