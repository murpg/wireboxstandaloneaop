component  output="false"
{
	
    function configure()
     output="false"
    {
    	var read = new model.pathService();
    	var path = read.getPath('\logs');
        logBox = {
     
        appenders = {
  
            LogFile = {
                class="wirebox.system.logging.appenders.AsyncRollingFileAppender",
                properties={
                    filePath=path,
                    fileMaxSize="500",
                    autoExpand=false,
                    fileMaxArchives=20
                }
            },
            demoDB = {
                class="wirebox.system.logging.appenders.DBAppender",
                properties={
                     dsn="Renaud2",
                     table="renaudLogs",
                     autocreate=true
                },
                levelMin="FATAL",
                levelMax="INFO"
            }
  
        },
         
        categories={
                "model.artService" = {levelMAX="INFO", appenders="LogFile,demoDB"},
                "model.logMe" = {levelMAX="INFO", appenders="LogFile,demoDB"}
            },
             
        root = {levelMin="FATAL", levelMax="INFO", appenders="*"}
    }; 
}
  
}