<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Scan Locations</title>
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
<h3><a href="ScanLocations.cfm">Scan Locations</a></h3>
<p style="font-size:16px;">
<cfoutput>
	<b>This runs in your Application.cfc</b> <br>
	#htmlEditFormat('<cfset application.wirebox = createObject("component", "wirebox.system.ioc.Injector").init(binder="config.wirebox") />')# <br>
	<b>This runs in the calling page, handler or controller</b><br>
	#htmlEditFormat('<cfset path = application.wirebox.getInstance("pathService")>')#
</cfoutput>
</p>
<hr>
<div style="margin:1em auto; width:800px;">
<h3>Scan Locations</h3>
<cfset path = application.wirebox.getInstance("pathService")>

<cfdump var="#path#">
<h2><a href="index.cfm">Return</a></h2></div>
	<!-- end #mainContent --></div>
<!-- end #container --></div>
</body>
</html>