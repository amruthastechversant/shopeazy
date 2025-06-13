<cfscript>
variables.id=session.id;
variables.seller= createObject("component", application.appBasePath & "models.productList");
variables.qrysellerDetails=variables.seller.getSellerDetails(id);
variables.sellerDetails = variables.qrysellerDetails.qryGetSellerDetails;
variables.accessPermission=createObject("component",application.appBasePath & "models.permission")
variables.qryaccessSellerPermission=variables.accessPermission.getselectedPermissions(id);
variables.accessSellerPermission = variables.qryaccessSellerPermission.selectedPermissions;
if(not structKeyExists(session, "permissions")){
    session.permissions=[];
}
session.permissions=arrayNew(1);
for(i=1;i<=variables.accessSellerPermission.recordCount;i++){
    arrayAppend(session.permissions,variables.accessSellerPermission.int_permission_id)
}

</cfscript>