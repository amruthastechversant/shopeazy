<cfscript>
variables.product = createObject("component", application.appBasePath & "models.product");
variables.result = variables.product.getProductDetails(url.id);
variables.result.rating
variables.variants = variables.product.getProductVariants(url.id);
   
</cfscript>