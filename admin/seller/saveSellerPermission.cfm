<cfscript>
param name="form.id" default=1;
param name="form.int_permission_id_list";
variables.int_seller_id=form.id;
variables.permissionList=form.int_permission_id_list;
variables.deletePermission=deletePermissions();
// variables.insertPermission = insertPermissions(int_seller_id=int_seller_id);
function deletePermissions(){
var deletePermissions = queryNew('');
var deletePermissions = queryExecute(
     "delete from tbl_role_permission where 
     int_seller_id=?",
     [
        {value:variables.int_seller_id,cfsqltype="cf_sql_integer"}
    ],
     {datasource=application.datasource}
     );
    return deletePermissions;      
}
if (len(variables.permissionList)) {
    permissionsArray = listToArray(variables.permissionList);
    for (permissionId in permissionsArray) {
        insertPermissions(permissionId);
    }
}

    function insertPermissions(permissionId){
        var insertPermissions = queryNew('');
        var insertPermissions = queryExecute(
            "insert into tbl_role_permission(int_permission_id,int_seller_id)values(?,?)",
            [
                {value:permissionId,cfsqltype="cf_sql_integer"},
                {value:variables.int_seller_id,cfsqltype="cf_sql_integer"}
            ],
            {datasource=application.datasource}
        );
        return insertPermissions;
    }
    location(url="sellerDetail.cfm?id=#variables.int_seller_id#&msg=permissionSaved");

// writeDump(form.int_permission_id_list);abort;
</cfscript>