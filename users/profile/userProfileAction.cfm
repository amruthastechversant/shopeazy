
<cfscript>
variables.qrygetUsers=getUsers();
    function getUsers(){
        qrygetUsers = queryExecute(
            "select int_user_id,str_first_name,str_last_name,str_email,str_password,str_phone_number,str_address, from tbl_users where int_role_id = 3",
            [],
            {datasource=application.datasource}
        )
        return qrygetUsers;
    }
</cfscript>