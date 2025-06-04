
<cfscript>
variables.qrygetUsers=getUsers();
    function getUsers(){
        qrygetUsers = queryExecute(
            "select * from tbl_users where int_role_id = 3",
            [],
            {datasource=application.datasource}
        )
        return qrygetUsers;
    }
</cfscript>