component displayName="permissionComponent"{
    public any function getSellerPermission(){
        var permissions = queryNew('');
        permissions = queryExecute(
            "select int_permission_id,str_permission_name from tbl_seller_permission",
            [],
            {datasource=application.datasource}
             );
        return{permissions=permissions};
    }

    public any function getselectedPermissions(id){
        var selectedPermissions = queryExecute(
            "select int_permission_id from tbl_role_permission where int_seller_id=?",
            [{value=id,cfsqltype="cf_sql_integer"}],
        {datasource=application.datasource}
             );
        return{selectedPermissions=selectedPermissions};
    }


}

