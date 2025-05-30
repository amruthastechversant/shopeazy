component{
    this.name = 'shopeazy';
    this.sessionManagement = true;// Enables session management
    // this.ormEnabled = true;  

    // this.ormSettings = {
    //     dbCreate = "update", // "none" | "create" | "update" | "dropcreate"
    //     autoManageSession = true, // Auto session management
    //     flushAtRequestEnd = true, // Flush ORM changes at the end of the request
    //     logSQL = true, // Log SQL generated by ORM (useful for debugging)
    //     cflocation ="models"
    // };
    // Optionally, set the session timeout (in minutes)
    this.sessionTimeout = createTimeSpan(0, 0, 30, 0); // Session expires after 30 minutes of inactivity
    
    function onApplicationStart(){
        application.appBasePath = "/myprojects/shopeazy/";
        application.clientManagement = "false";
        application.datasource="dsn_shopeazy";
        
    }
    function onRequestStart(targetPage) {
        return true;
    }
}
