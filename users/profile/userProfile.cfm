<cfinclude  template="userProfileAction.cfm">
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="#application.appBasePath#layouts/header.cfm">
<body>
    <cfinclude  template="#application.appBasePath#layouts/navbar.cfm">
    <cfif structKeyExists(session, "email")>
    <div class="card-container">
        <div class="card d-flex align-items-center profilecard">
            <img src="#application.appBasePath#assets/img/address-logo.png" alt="Address Logo" style="width: 80px; height: auto; margin-right: 20px;">
            <div>
                <h5>EDIT ADDRESS</h5>
            </div>
        </div>
    </div>
    </cfif>
  <cfinclude  template="#application.appBasePath#layouts/footer.cfm">  
</body>
</html>
</cfoutput>

