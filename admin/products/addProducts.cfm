
<cfinclude  template="addProductsAction.cfm">
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="#application.appBasePath#assets/css/products.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body class="p-5">
    <div class="container">
        <h2 class="text-center">Add New Product</h2>
        <form  action="addProductsAction.cfm" method="POST" enctype="multipart/form-data">

            <input type="hidden" name="id" value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.int_product_id: '')#"/>
<!---             <div class="text-success">#msg#</div> --->
            <table>
            <tr>
               <td><label for="productName" class="form-label">Product Name</label></td>
                <td><input type="text" name="productName" 
                 value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.str_name : '')#" />
                </td>
            </tr>
            <tr>
                <td><label for="productImage" class="form-label">Product Image</label></td>
                <td><input type="file" class="form-control" id="productImage" name="productImage" 
               ></td>
            </tr>
            <tr>
                <td><label for="productPrice" class="form-label">Price ($)</label></td>
                <td><input type="number" step="0.01" class="form-control" id="productPrice" name="productPrice"
                  value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.int_price: '')#"/></td>
            </tr>
            <tr>
                <td><label for="productDescription" class="form-label">Description</label></td>
                <td><textarea class="form-control" id="productDescription" name="productDescription" cols="2" rows="2">
               #(structKeyExists(variables, 'editProduct') ? variables.editProduct.str_description : '')#</textarea></td>
            </tr>
            <tr>
                <td><label for="productStock" class="form-label">Stock Quantity</label></td>
                <td><input type="number" class="form-control" id="productStock" name="productStock"
                value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.int_stock_quantity: '')#"/></td>
            </tr>
            <tr>
                <td><label for="category" class="form-label">Category</label> </td>
                <td>
                <select name ="category_id"   id="category">
                    <option value="" <cfif Not structKeyExists(variables, "editProduct") OR not len(variables.editProduct.int_category_id)>selected</cfif>select Category</option>
                    <cfloop query="variables.categoryqryResult">
<!---                         <option value="#variables.categoryqryResult.int_category_id#">#variables.categoryqryResult.str_category_name#</option> --->
                    <option value="#int_category_id#"
                    <cfif structKeyExists(variables, "editProduct") AND variables.editProduct.int_category_id EQ int_category_id>
                    selected="selected"
                    </cfif>>
                    #str_category_name#
                    </cfloop>
                </select>
                </td>
            </tr>
</cfoutput>
            
           <cfif structKeyExists(url, "id")>
                <cfset previousPropertyName="">
                <cfoutput query="variables.editVarient" group="str_properties">
                    <cfset propertyName=variables.editVarient.str_properties>
                    <cfset propertyId =variables.editVarient.int_properties_id>
                    <cfset propertyValue=variables.editVarient.str_properties_value>
                <cfif propertyName NEQ previousPropertyName>
                    <tr>
                        <td><label for="#propertyName#"class="form-label"></label>#propertyName#</td>
                        <td>
                            <div id="#propertyName#Container">
                            <cfoutput>
                            <cfif variables.editVarient.str_properties EQ propertyName >
                                <div class="input-wrapper mb-2 d-flex align-items-center">
                                    <input type="text" name="#propertyName#_#propertyId#" id="#propertyName#" value="#variables.editVarient.str_properties_value#" class="form-control">
                                    <button type="button" class="btn btn-info ms-2" onclick="toggleOptions(this, '#propertyName#')">+</button>
                                </div>
                            </cfif>
                            </cfoutput>
                            </div>
                        
                        </td>
                    </tr>
                    <cfset previousPropertyName=propertyName>
                <cfelse>
                    <tr>
                        <td></td>
                        <td>
                            <div id="#propertyName#Container">
                        <cfif variables.editVarient.str_properties EQ propertyName>
                            <div class="input-wrapper mb-2 d-flex align-items-center">
                                <input type="text" name="#propertyName#_#propertyId#" id="#propertyName#" value="#variables.editVarient.str_properties_value#" class="form-control">
                                <button type="button" class="btn btn-info ms-2" onclick="toggleOptions(this, '#propertyName#')">+</button>
                            </div>
                        </div>
                        </cfif>
                        </td>
                    </tr>
                </cfif>
                </cfoutput>

            <cfelse>

            <cfoutput query="variables.qryGetProductProperties">
            <tr>
                <td><label for="#variables.qryGetProductProperties.str_properties#"class="form-label"></label>#variables.qryGetProductProperties.str_properties#</td>
                <td>
                    <div id="#variables.qryGetProductProperties.str_properties#Container">
                        <div class="input-wrapper mb-2 d-flex align-items-center">
                            <input type="text" name="#variables.qryGetProductProperties.str_properties#_#variables.qryGetProductProperties.id#" id="#variables.qryGetProductProperties.str_properties#"  class="form-control">
                            <button type="button" class="btn btn-info ms-2" onclick="toggleOptions(this, '#variables.qryGetProductProperties.str_properties#')">+</button>
                        </div>
                    </div>
                </td>
            </tr>
            </cfoutput>
            </cfif>
<cfoutput>
            </table>
               <div class="d-flex mt-3">
                    <button type="submit" class="btn btn-primary ms-auto" name="addProduct">Add Product</button>
                </div>
        </form>
    </div>
    <script src="../../assets/js/productColor.js"></script>
</body>
</html>
</cfoutput>
