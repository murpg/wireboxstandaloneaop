<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Logbox</title>
<link href="p7pmm/p7PMMh07.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="p7pmm/p7PMMscripts.js"></script>
<link href="oneColLiqCtr.css" rel="stylesheet" type="text/css" />
</head>
<body class="oneColLiqCtr">
<div id="container">
<div id="p7PMM_1" class="p7PMMh07">
  <ul class="p7PMM">
    <li><a href="#">Home</a>
      <div>
        <ul>
          <li><a href="implicitCreation.cfm">Implicit Creation</a></li>
          <li><a href="ExplicitCreation.cfm">Explicit Binder Creation</a></li>
          <li><a href="ScanLocations.cfm">Scan Locations</a></li>
        </ul>
      </div>
    </li>
    <li><a href="logbox.cfm">Wirebox &amp; LogBox</a></li>
    <li><a href="aop.cfm">AOP</a></li>
	<li><a href="reset.cfm">Reset</a></li>
  </ul>
  <div class="p7pmmclearfloat">&nbsp;</div>
  <!--[if lte IE 6]>
<style>.p7PMMh07 .current_mark {font-weight: normal; text-transform: uppercase;} .p7PMMh07 ul ul .current_mark {font-weight: bold;} .p7PMMh07 li {filter: alpha(opacity=80);} .p7PMMh07 ul ul li {float:left; clear: both; width: 100%;}.p7PMMh07 {text-align: left;}.p7PMMh07 ul ul a {height: 1%;}</style>
<![endif]-->
  <!--[if IE 5.500]>
<style>.p7PMMh07 {position: relative; z-index: 9999999;}</style>
<![endif]-->
  <!--[if IE 7]>
<style>.p7PMMh07, .p7PMMh07 a{zoom:1;}.p7PMMh07 ul ul li{float:left;clear:both;width:100%;}</style>
<![endif]-->
  <script type="text/javascript">
<!--
P7_PMMop('p7PMM_1',1,2,-5,-5,0,1,0,1,0,3,1,1,0);
//-->
  </script>
</div>
  <div id="mainContent">
    <h1> Steps to use Logbox with Wirebox</h1>
 <ol>
 <li>Create a mapping to the logbox binder inside wirebox. This needs to be at the bottom of the wirebox property struct inside the configure method<br><br>
 component  extends=&quot;wirebox.system.ioc.config.Binder&quot; output=&quot;false&quot;<br />
        {<br />
        <br />
        /**<br />
        * Configure WireBox, that's it!<br />
        */<br />
        <br />
        function configure(){<br />
  <br />
        // The WireBox configuration structure DSL<br />
        <br />
        wireBox = {<br />
        // Scope registration, automatically register a wirebox injector instance on any CF scope<br />
        // By default it registeres itself on application scope<br />
        scopeRegistration = {<br />
        enabled = true,<br />
        scope   = &quot;application&quot;, // server, cluster, session, application<br />
        key		= &quot;wireBox&quot;<br />
      },<br />
      <br />
// DSL Namespace registrations<br />
        customDSL = {<br />
        // namespace = &quot;mapping name&quot;<br />
        },<br />
  <br />
        // Custom Storage Scopes<br />
        customScopes = {<br />
        // annotationName = &quot;mapping name&quot;<br />
        },<br />
  <br />
        // Package scan locations<br />
        scanLocations = ['model'],<br />
  <br />
        // Stop Recursions<br />
        stopRecursions = [],<br />
  <br />
        // Parent Injector to assign to the configured injector, this must be an object reference<br />
        parentInjector = &quot;&quot;,<br />
  <br />
        // Register all event listeners here, they are created in the specified order<br />
        listeners = [<br />
        // { class=&quot;&quot;, name=&quot;&quot;, properties={} }<br />
        ],<br />
  <br />
        logBoxConfig = 'config.lbConfig' <br />
        };<br />
  <br />
        // Map Bindings below<br />
      map(&quot;myDSN&quot;).toValue(&quot;cfartgallery&quot;);<br />
}<br />
<br />
 </li>
 <li>inject logbox into the CFC where you would like to do logging.<br><br>
 <cfoutput>
 	 #htmlEditFormat('<cfproperty name="log" inject="logbox:logger:model.artService" />')#<br><br>
 	 Another option is to call it this way<br>
	  #htmlEditFormat(' log = application.wirebox.getLogBox();')#'
 </cfoutput>
 <br><br>
<cfscript>
	 writelog = application.wirebox.getLogBox();
	 log =  writelog.getLogger("model.artService");
	 log.INFO(message='Hi this is working', extraInfo='Put your special message here', severity='INFO');
	 writeDump(application.wirebox.getInstance('artService').getArt(10));
</cfscript>

 </li>
 
 </ol> 
	<!-- end #mainContent --></div>
<!-- end #container --></div>
</body>
</html>