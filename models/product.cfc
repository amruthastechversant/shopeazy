<cfcomponent persistant="true" table="tbl_products" entityname="product">
    <cfproperty  name="int_product_id" fieldtype="id" generator="native">
    <cfproperty  name="str_name" ormtype="string">
    <cfproperty  name="str_description" ormtype="string">
    <cfproperty  name="int_price" ormtype="integer">
    <cfproperty  name="int_stock_quantity" ormtype="integer">
    <cfproperty  name="int_category_id" fieldtype="many-to-one" cfc="category" fkcolumn="int_category_id">
    <cfproperty  name="int_product_status" fieldtype="many-to-one" cfc="productstatus" fkcolumn="id">

</cfcomponent>