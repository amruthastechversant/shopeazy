<cfoutput>
<cfinclude  template="fullProductsAction.cfm">
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
    <link rel="stylesheet" href="#application.appBasePath#assets/css/adminPage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="main-content">
      <!-- Header -->
        <div class="header">
         
            <h1>Admin Dashboard</h1>
            <div class="header-menu">
                <span><a href="">Orders</a></span>
                <span><a href="">Most Sold</a></span>
                <span><a href="">Payments</a></span>
            </div>
        </div>

    <table class="table table-bordered table-sm table-responsive" align="center">
        <thead>
            <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price </th>
            <th>Description</th>
            <th>EDIT</th>
            </tr>
        </thead>
        <tbody>
            <cfloop query="variables.qryAllProducts">
            <tr>
            <td>#int_product_id#</td>
            <td>#str_name#</td>
            <td>#int_price#</td>
            <td>#str_description#</td>
            <td>
                <a href="addProducts.cfm?id=#int_product_id#"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            </td>
            </tr>
            </cfloop>
        </tbody>
    </table>
</div>
</body>
</html>
</cfoutput>
