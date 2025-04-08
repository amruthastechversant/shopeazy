component{
    this.name = 'shopeazy';
    this.sessionManagement = true;  // Enables session management

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
