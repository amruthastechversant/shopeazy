component{
    this.name = 'shopeazy';

    function onApplicationStart(){
        application.appBasePath = "/myprojects/shopeazy/";
        application.clientManagement = "false";
        application.datasource="dsn_shopeazy";
    }
    function onRequestStart(targetPage) {
        return true;
    }
}
