
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
        <h2>Add New Product</h2>
        <form method="POST" action="add_product.cfm">
            <table>
            <tr>
               <td><label for="productName" class="form-label">Product Name</label></td>
                <td><input type="text" class="form-control" id="productName" name="productName" required></td>
            </tr>
            <tr>
                <td><label for="productImage" class="form-label">Product Image</label></td>
                <td><input type="file" class="form-control" id="productImage" name="productImage" required></td>
            </tr>
            <tr>
                <td><label for="productPrice" class="form-label">Price ($)</label></td>
                <td><input type="number" step="0.01" class="form-control" id="productPrice" name="productPrice" required></td>
            </tr>
            <tr>
                <td><label for="productDescription" class="form-label">Description</label></td>
                <td><textarea class="form-control" id="productDescription" name="productDescription" cols="2" rows="2"></textarea></td>
            </tr>
            <tr>
                <td><label for="productStock" class="form-label">Stock Quantity</label></td>
                <td><input type="number" class="form-control" id="productStock" name="productStock" required></td>
            </tr>
            <tr>
                <td><label for="category" class="form-label">Category</label> </td>
                <td>
                <select name ="category_id"   id="category">
                    <option value="" selected>select Category</option>
                    <cfloop query="variables.categoryqryResult">
                        <option value="#variables.categoryqryResult.int_category_id#">#variables.categoryqryResult.str_category_name#</option>
                    </cfloop>
                </select>
                </td>
            </tr>
            <tr>
    <td><label class="form-label">Product Color</label></td>
    <td>
        <div id="colorContainer">
            <div class="input-wrapper mb-2 d-flex align-items-center">
                <input type="text" name="productColor" class="form-control">
                <button type="button" class="btn btn-info ms-2" onclick="toggleOptions(this, 'color')">+</button>
            </div>
        </div>
    </td>
</tr>

<tr>
    <td><label class="form-label">Product Size</label></td>
    <td>
        <div id="sizeContainer">
            <div class="input-wrapper mb-2 d-flex align-items-center">
                <input type="text" name="productSize" class="form-control">
                <button type="button" class="btn btn-info ms-2" onclick="toggleOptions(this, 'size')">+</button>
            </div>
        </div>
    </td>
</tr>

<tr>
    <td><label class="form-label">Product Material</label></td>
    <td>
        <div id="MaterialContainer">
            <div class="input-wrapper mb-2 d-flex align-items-center">
                <input type="text" name="productMaterial" class="form-control">
                <button type="button" class="btn btn-info ms-2" onclick="toggleOptions(this, 'Material')">+</button>
            </div>
        </div>
    </td>
</tr>


            </table>
               <div class="d-flex mt-3">
                    <button type="submit" class="btn btn-primary ms-auto">Add Product</button>
                </div>
        </form>
    </div>
    <script src="../../assets/js/productColor.js"></script>

</body>
</html>
</cfoutput>
