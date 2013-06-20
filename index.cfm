<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wirebox Standalone Demo</title>
<link href="p7pmm/p7PMMh07.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="p7pmm/p7PMMscripts.js"></script>
<link href="oneColLiqCtr.css" rel="stylesheet" type="text/css" />
</head>
<body class="oneColLiqCtr">
<div id="container">
<div id="p7PMM_1" class="p7PMMh07">
  <ul class="p7PMM">
    <li><a href="index.cfm">Home</a>
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
    <h1> Wirebox AOP Demo: How to use outside of ColdBox</h1>
    <p>The purpose of the this demo is to show other developers how to setup and use Wirebox outside of ColdBox. The ColdBox platform has many tools that can be used without a full install of the Coldbox framework. What is Wirebox? Wirebox is an enterprise level framework to bring dependency injection and AOP (Aspect Oriented Programming) to ColdFusion applications</p>
    <h2>Advantages to using an IOC (Inversion of Control)  framework</h2>
    <p>Wirebox will allow developers to regain control of their ColdFusion projects.As developers we are constantly challenged with those dreaded words: &quot;We are going to need to make some changes.&quot; Well Wirebox will enable you our software to be  more sustainable and maintainable.</p>
    <p>How you say? Wirebox taps into metadata annotations to make your object assembling, storage and creation easy.You will leverage the power of event driven object listeners so you can extend not only WireBox but the way objects are analyzed, created and wired.</p>
    <h2>How to get started</h2>
    <ol>
      <li>Create a mapping to Wirebox in your Application.cfc<br />
//Create your mappings<br />
this.mappings = {};<br />
this.rootpath = getDirectoryFromPath(getCurrentTemplatePath());<br />
this.mappings[&quot;/wirebox&quot;] = this.rootpath &amp; 'wirebox';<br />
<br />
      </li>
      <li>Setup Wirebox to get loaded onApplicationStart in your Application.cfc<br />
        <br />
public boolean function onApplicationStart()<br />
output=&quot;false&quot;<br />
{<br />
if( !structKeyExists(application,'wirebox') ) {<br />
application.wirebox = createObject(&quot;component&quot;, &quot;wirebox.system.ioc.Injector&quot;).init(binder=&quot;config.wirebox&quot;);<br />
}<br />
return true;<br />
}<br />
<br />
      </li>
      <li>Create a Wirebox binder. If you have ColdBox Platform Utilities you can use it to create your Binder. If you happen to create the binder using ColdBox Platform Utilities, you will need to make it extend from wirebox.system.ioc.config.Binder (extends=&quot;wirebox.system.ioc.config.Binder&quot;).<br />
        <br />
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
      }<br />
      <br />
      </li>
      <li>Dump application.wirebox. If you get no errors you have installed wirebox correctly.<br />
        writeDump(application.wirebox)
        <br />
        <br />
      </li>
    </ol>
	<!-- end #mainContent --></div>
<!-- end #container --></div>
</body>
</html>