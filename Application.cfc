component  output="false"
{
	//This app was written by George Murphy with the purpose of showing others the value in Wirebox. It can be used without ColdBox
	
	this.name = "WireBox Standalone Demo AOP 2013";
	this.applicationTimeout = createTimeSpan(0,2,0,0);
	this.clientManagement = false;
	this.clientStorage = "registry";
	this.loginStorage = "session";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,20,0);
	this.setClientCookies = true;
	this.setDomainCookies = false;
	//If you are not protecting your site you may want to turn this on
	this.scriptProtect = "none";
	this.secureJSON = false;
	this.secureJSONPrefix = "";
	
	//Create your mappings
	this.mappings = {};
	this.rootpath = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings["/wirebox"] = this.rootpath & 'wirebox';
	this.customtagpaths = "";
	
	public boolean function onApplicationStart()
	 output="false"
	{
		if( !structKeyExists(application,'wirebox') ) {
			application.wirebox = createObject("component", "wirebox.system.ioc.Injector").init(binder="config.wirebox");
		}
		return true;
	}
	
	public void function onApplicationEnd( ApplicationScope)
	 output="false"
	{
		
	}

	public boolean function onRequestStart(string targetPage)
	 output="false"
	{
		return true;
	}
	
/*	public void function onRequest(string targetPage)
	 output="false"
	{
		include arguments.targetPage;
	}*/
	
	public void function onRequestEnd(string targetPage)
	 output="false"
	{

	}
	
	public void function onSessionStart()
	 output="false"
	{

	}
	
	public void function onSessionEnd( SessionScope, ApplicationScope)
	 output="false"
	{

	}

	public void function onMissingMethod(string method,struct args)
	 output="false"
	{

	}

	public boolean function onMissingTemplate(string targetPage)
	 output="false"
	{
		return true;
	}

/*	public void function onError( Exception, EventName)
	 output="false"
	{
		writeDump(arguments);abort;
	}*/

/*	public void function onCFCRequest(string cfcname,string method,struct args)
	 output="false"
	{

	}*/



}