<cfinclude  template="userProfileAction.cfm">
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="#application.appBasePath#layouts/header.cfm">
<body>
    <cfinclude  template="#application.appBasePath#layouts/navbar.cfm">
    <cfif structKeyExists(session, "email")>
    <div class="card-container">
        <div class="card">
            <h1>##</h1>
        </div>
    </div>
    </cfif>
  <cfinclude  template="#application.appBasePath#layouts/footer.cfm">  
</body>
</html>
</cfoutput>

