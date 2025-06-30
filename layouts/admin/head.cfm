<cfoutput>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <cfif structKeyExists(session, "role") AND session.role EQ "seller">
    <title>Seller Dashboard</title>
    <cfelse>
        <title>Admin Dashboard</title>
    </cfif>
    <link rel="stylesheet" href="#application.appBasePath#assets/css/style.css">
<!---     <link rel="stylesheet" href="#application.appBasePath#assets/css/sellerPage.css">  --->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="#application.appBasePath#assets/js/addProduct.js"></script>
    
</head>
</cfoutput>
