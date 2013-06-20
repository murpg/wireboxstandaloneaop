/**
* @hint 
**/
component implements="wirebox.system.aop.MethodInterceptor" accessors="true" {

		/**
	* Constructor
	*/
	property name="log" inject="logbox:logger:model.logMe";
	
	function init(){
		return this;		
	}
	
	/**
	* The AOP method invocation
	*/
	any function invokeMethod(required invocation) output=false{
		
		log.INFO(message="ID Passed In:  #invocation.getArgs().propname#",extrainfo='Top of the method', severity='INFO');
		
		// proceed invocation
		local.results =  arguments.invocation.proceed();
		
		//writeDump(invocation.getArgs());abort;
		
		if(StructKeyExists(local, "results")) {
		log.INFO(message="ID Passed In:  #local.results.toString()#",extrainfo='Bottom of the method', severity='INFO');
			return local.results;
		}
		
	}
    	
}