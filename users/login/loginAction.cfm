<cfoutput>

<cfif structKeyExists(form, "login")>
    <cfset getadminFormValue(email=form.adminEmail,password=form.adminPassword)>
</cfif>

<cfif structKeyExists(form, "userlogin")>
    <cfset getuserFormValue(email=form.userEmail,password=form.userPassword)>
</cfif>
<cffunction  name="getadminFormValue" access="public" returnType="void">
    <cfset session.error_msg="">
    <cfargument  name="email" type="string" required="true">
    <cfargument  name="password" type="string" required="true">

<!---     <cfset hashedPassword = hash(form.adminPassword, 'SHA-256')> --->
    <cfif structKeyExists(form, "login")>
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

        <cfset session.adminid = qryUser.int_user_id>
        <cfset session.role = qryUser.str_user_role>
        <cfset session.email = qryUser.str_email>
        <cflocation  url="#application.appBasePath#admin/adminDashboard.cfm">
    <cfelse>
        <cfset session.error_msg="invalid credentials">
    </cfif>
    </cfif>
</cffunction>

<cffunction  name="getuserFormValue" access="public" returnType="void">
    <cfset session.error_msg="">
    <cfargument  name="email" type="string" required="true">
    <cfargument  name="password" type="string" required="true">
<!---     <cfset hashedPassword = hash(form.adminPassword, 'SHA-256')> --->
    <cfif structKeyExists(form, "userlogin")>
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

            <cfset session.userid = qryUser.int_user_id>
            <cfset session.role = qryUser.str_user_role>
            <cfset session.email = qryUser.str_email>
            <cflocation  url="#application.appBasePath#index.cfm">
        <cfelse>
            <cfset session.error_msg="invalid credentials">
        </cfif>
    </cfif>
</cffunction>
</cfoutput>