<cfoutput>
    <!--- On login submit  --->
    <cfif structKeyExists(url, "login") AND url.login EQ "true">
        <cfsetting enablecfoutputonly="true" />
        <cfsetting showDebugOutput="false">
        <cfset email = form.email>
        <cfset password = form.password>

        <cfset result = adminLogin(email, password)>
        <cfoutput>#result#</cfoutput>
    </cfif>

    <cfif structKeyExists(url, "userlogin") AND url.userlogin EQ "true">
        <cfsetting enablecfoutputonly="true" />
        <cfsetting showDebugOutput="false">
        <cfset email = form.email>
        <cfset password = form.password>

        <cfset result = userLogin(email, password)>
        <cfoutput>#result#</cfoutput>
        
    </cfif>

    <cfif structKeyExists(url, "sellerlogin") AND url.sellerlogin EQ "true">
        <cfsetting enablecfoutputonly="true" />
        <cfsetting showDebugOutput="false">
        <cfset email = form.email>
        <cfset password = form.password>
        <cfset result = sellerLogin(email, password)>
        <cfoutput>#result#</cfoutput>
        
    </cfif>

    <cffunction  name="adminLogin" access="public" returnType="any">
        <cfargument  name="email" type="string" required="true">
        <cfargument  name="password" type="string" required="true">
    <!---     <cfset hashedPassword = hash(form.adminPassword, 'SHA-256')> --->
            <cfquery name="qryUser" datasource="#application.datasource#">
                SELECT u.int_user_id,u.str_email, r.str_user_role
                FROM tbl_users AS u
                INNER JOIN tbl_user_roles AS r
                ON u.int_role_id = r.id
                WHERE u.str_email = <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
                AND u.str_password = <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">
                AND r.str_user_role='admin'
            </cfquery>
        
        <cfif qryUser.recordCount>
            <cfset session.id = qryUser.int_user_id>
            <cfset session.isLoggedIn = true>
            <cfset session.role = qryUser.str_user_role>
            <cfset session.email = qryUser.str_email>
            <cfset var response = {
                    "status" = "success",
                    "redirect_url" = "#application.appBasePath#admin/adminDashboard.cfm"
                }>
            <cfelse>
                <cfset var response = {
                    "status" = "error",
                    "message" = "Invalid credentials"
                }>
            </cfif>
        <cfreturn serializeJson(response)>
    </cffunction>



    <cffunction  name="userLogin" access="public" returnType="any">
        <cfargument  name="email" type="string" required="true">
        <cfargument  name="password" type="string" required="true">
    <!---     <cfset hashedPassword = hash(form.adminPassword, 'SHA-256')> --->
            <cfquery name="qryUser" datasource="#application.datasource#">
                SELECT u.int_user_id,u.str_email, r.str_user_role
                FROM tbl_users AS u
                INNER JOIN tbl_user_roles AS r
                ON u.int_role_id = r.id
                WHERE u.str_email = <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
                AND u.str_password = <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">
                AND r.str_user_role='user'
            </cfquery>
        
        <cfif qryUser.recordCount>
            <cfset session.id = qryUser.int_user_id>
            <cfset session.isLoggedIn=true>
            <cfset session.role = qryUser.str_user_role>
            <cfset session.email = qryUser.str_email>
            <cfset var response = {
                    "status" = "success",
                    "redirect_url" = "#application.appBasePath#index.cfm"
                }>
            <cfelse>
                <cfset var response = {
                    "status" = "error",
                    "message" = "Invalid credentials"
                }>
         </cfif>
        <cfreturn serializeJson(response)>

    </cffunction>
    

    <cffunction  name="sellerLogin" access="public" returnType="any">
        <cfargument  name="email" type="string" required="true">
        <cfargument  name="password" type="string" required="true">
    <!---     <cfset hashedPassword = hash(form.adminPassword, 'SHA-256')> --->
            <cfquery name="qryUser" datasource="#application.datasource#">
                SELECT 
                    u.int_user_id,
                    u.str_email,
                    u.str_first_name,
                    r.str_user_role,
                    s.int_seller_id
                    FROM 
                        tbl_users AS u
                    LEFT JOIN 
                        tbl_user_roles AS r ON u.int_role_id = r.id
                    LEFT JOIN 
                        tbl_seller_info AS s ON u.int_user_id = s.int_user_id
                WHERE u.str_email = <cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">
                AND u.str_password = <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">
                AND r.str_user_role='seller'
            </cfquery>
        
        <cfif qryUser.recordCount>
            <cfset session.id = qryUser.int_seller_id>
            <cfset session.isLoggedIn=true>
            <cfset session.role = qryUser.str_user_role>
            <cfset session.email = qryUser.str_email>
            <cfset session.name = qryUser.str_first_name>
            <cfset var response = {
                    "status" = "success",
                    "redirect_url" = "#application.appBasePath#users/login/seller/sellerHomePage.cfm"
                }>
            <cfelse>
                <cfset var response = {
                    "status" = "error",
                    "message" = "Invalid credentials"
                }>
         </cfif>
        <cfreturn serializeJson(response)>

    </cffunction>

</cfoutput>