<cfscript>
variables.seller= createObject("component", application.appBasePath & "models.productList");
variables.sellerPermission= createObject("component", application.appBasePath & "models.permission");
variables.qrysellerDetails=variables.seller.getSellerDetails();
variables.totalPages=variables.qrysellerDetails.totalPages;
variables.sellerDetails = variables.qrysellerDetails.qryGetSellerDetails;
variables.qrysellerPermission = variables.sellerPermission.getSellerPermission();
variables.sellerPermissions = variables.qrysellerPermission.permissions;
variables.qryselectedPermissions = variables.sellerPermission.getselectedPermissions(variables.sellerDetails.int_seller_id);
variables.selectedPermissions = variables.qryselectedPermissions.selectedPermissions;
</cfscript>