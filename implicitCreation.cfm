<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Implicit Creation</title>
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
    <h1>Implicit Creation</h1>
<p style="font-size:16px;">
<cfoutput>
	<b>This runs in your Application.cfc</b><br>
	#htmlEditFormat('application.wirebox = createObject("component", "wirebox.system.ioc.Injector").init(binder="config.wirebox")')# <br>
	</p>
<p>	<b>This runs in the calling page, handler or controller. This creates the art bean</b><br>
	#htmlEditFormat('art = application.wirebox.getInstance("model.art").init()')#</p>

<p>	<b>Several ways to get back constants</b><br>
	#htmlEditFormat('<cfset myDSN = application.wirebox.getInstance("myDSN") />')#<br>
	#htmlEditFormat('<cfproperty name="dsn" inject="ID:myDSN" scope="instance">')#</p>
<p><b>This creates the art service object</b><br>
#htmlEditFormat('<cfset artService = application.wirebox.getInstance("model.artService").init() />')#
</p>
</cfoutput>
<hr>
<h2>Run Code</h2>
<div style="margin:1em auto; width:800px;" id="ic">
<h3>Implicit Mappings</h3>
<cfset art = application.wirebox.getInstance("model.art").init()>
<cfset myDSN = application.wirebox.getInstance('myDSN') />
<cfset artService = application.wirebox.getInstance("model.artService").init() />
<p><b>This this the art bean</b>
<cfdump var="#art#" label="Art Service Bean" top="1">
</p>
<p><b>This is the datasource name</b><br>
<cfdump var="#myDSN#" label="Datasource" top="1">
</p>
<p><b>This is the artService</b><br>
<cfdump var="#artService#" label="Art Service Model" top="1">
</p>
<h2><a href="index.cfm">Return</a></h2>
</div>
	<!-- end #mainContent --></div>
<!-- end #container --></div>
</body>
</html>