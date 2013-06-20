<cfcomponent hint="I am a new Model Object" output="false" singleton="true">
  
<!------------------------------------------- CONSTRUCTOR ------------------------------------------->
  
    <cffunction name="init" access="public" returntype="pathService" output="false" hint="constructor">
        <cfscript>
            return this;
        </cfscript>
    </cffunction>
  
<!------------------------------------------- PUBLIC ------------------------------------------->
  
    <cffunction name="getPath" access="public" hint="I find the Path" output="false">
    <cfargument name="addfolders" type="string" required="false" default="reports\chartImages" />
	<cfargument name="removeFolders" type="string" required="false" default="model\"> 
        <cfset var rootDir = "" />
        <cfset rootDir = getDirectoryFromPath(getCurrentTemplatePath())>
        <cfset rootDir = replaceNOCase(rootDir,arguments.removeFolders, arguments.addfolders) />
         
        <cfreturn rootDir />
    </cffunction>
  
</cfcomponent>    