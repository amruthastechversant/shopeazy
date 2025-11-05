
<cfif NOT structKeyExists(session, "isLoggedIn") OR session.isLoggedIn NEQ true>
    <cflocation  url="#application.appBasePath#index.cfm">
</cfif>
<cfinclude  template="addProductsAction.cfm">
<cfinclude  template="#application.appBasePath#indexAction.cfm">
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="#application.appBasePath#layouts/admin/head.cfm">
<body>
  <div class="dashboard-container">
    <!-- Left Sidebar -->
    <cfinclude  template="#application.appBasePath#layouts/admin/sidebar.cfm">
    <!-- Main Content -->
    <div class="main-content">
      <!-- Header -->
      <cfinclude template="#application.appBasePath#layouts/admin/header.cfm">

        <div class="p-5">
            <div class="container">
                <h2 class="text-center">
                    <cfif structKeyExists(url,"id")>EDIT<cfelse>ADD</cfif> PRODUCT FORM
                </h2>
                <form  action="" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.int_product_id: '')#"/>
                    <input type="hidden" name="int_product_status" value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.int_product_status: '')#"/>
                    <cfif structKeyExists(url,"updated") && url.updated ==true>
                        <div class="alert alert-success success-alert">
                            Updated !!
                        </div>
                    </cfif>
                    <table>
                    <tr>
                        <td><label for="productName" class="form-label">Product Name</label></td>
                        <td>
                            <input type="text" name="productName" 
                            value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.str_name : '')#" />
                        </td>
                    </tr>
                    <tr>
                        <td><label for="productImage" class="form-label">Product Image</label></td>
                        <td>
                            <input type="file" class="form-control" id="productImage" name="productImage">
                            <cfif structKeyExists(variables, "editImage") and len(trim(variables.editImage.image_path))>
                                <img src="#application.appBasePath##variables.editImage.image_path#" alt="productImage" class="imageSize" >
                            </cfif>
                        </td> 
                    </tr>
                    <tr>
                        <td><label for="productPrice" class="form-label">Price ($)</label></td>
                        <td>
                            <input type="number" step="0.01" class="form-control" id="productPrice" name="productPrice"
                            value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.int_price: '')#"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="productDescription" class="form-label">Description</label></td>
                        <td>
                            <textarea class="form-control" id="productDescription" name="productDescription" cols="2" rows="2"> 
                            #(structKeyExists(variables, 'editProduct') ? variables.editProduct.str_description : '')#
                            </textarea> 
                        </td>
                    </tr>
                    <tr>
                        <td><label for="productStock" class="form-label">Stock Quantity</label></td>
                        <td>
                            <input type="number" class="form-control" id="productStock" name="productStock"
                            value="#(structKeyExists(variables, 'editProduct') ? variables.editProduct.int_stock_quantity: '')#"/>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="category" class="form-label">Category</label> </td>
                        <td>
                        <select name="category_id" id="category">
                            <option value="" <cfif Not structKeyExists(variables, "editProduct") OR not len(variables.editProduct.int_category_id)>selected</cfif>>Select Category</option>
                            
                            <cfloop query="variables.getParentCategories">
                                <option value="#variables.getParentCategories.int_category_id#" disabled>
                                    #variables.getParentCategories.str_category_name#
                                </option>
                                <cfloop query="variables.getSubCategories">
                                    <cfif variables.getSubCategories.int_parent_category_id EQ variables.getParentCategories.int_category_id>
                                        <option value="#variables.getSubCategories.int_category_id#"
                                            <cfif structKeyExists(variables, "editProduct") AND variables.editProduct.int_category_id EQ int_category_id>
                                                selected="selected"
                                            </cfif>
                                        >
                                            &nbsp;&nbsp;&nbsp;#variables.getSubCategories.str_category_name#
                                        </option>
                                    </cfif>
                                </cfloop>
                            </cfloop>
                        </select>
                        </td>
                    </tr>
</cfoutput>
                    <tr><td><h5>Properties</h5></td></tr>
                <cfif structKeyExists(url, "id")>
                        <cfset previousPropertyName="">
                    <cfoutput query="variables.editVarient" group="str_properties">
                        <cfset propertyName=variables.editVarient.str_properties>
                        <cfset propertyId =variables.editVarient.property_id>
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
                                            <button type="button" class="btn btn-info ms-2" onclick="toggleOptions(this, '#propertyName#', true)">+</button>
                                        </div>
                                        
                                    </cfif>
                                    </cfoutput>
                                    </div>
                                
                                </td>
                            </tr>
                            <cfset previousPropertyName=propertyName>
                        </cfif>
                    </cfoutput>
                        <cfoutput>
                            <script>
                                var productProperties = #serializeJSON(getProductProperties())#;
                            </script>
                        </cfoutput>
                <cfelse>
                    <cfoutput query="variables.qryGetProductProperties">
                    <tr>
                        <td><label for="#variables.qryGetProductProperties.str_properties#"class="form-label">#variables.qryGetProductProperties.str_properties#</td></label>
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
                                <button type="submit" class="btn btn-primary ms-auto" name="addProduct"><cfif structKeyExists(url,"id")>SAVE<cfelse>SAVE</cfif> PRODUCT</button>
                            </div>
                        </form>
                    </div>
                    <script src="#application.appBasePath#assets/js/addProduct.js"></script>
                </div>
            </div>
        </div>
    </body>
</html>
</cfoutput>

