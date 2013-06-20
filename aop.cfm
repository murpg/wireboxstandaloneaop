<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wirebox AOP Programming</title>
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
    <h1> Wirebox AOP Demo</h1>
    <p><b>Wirebox provides full AOP support for before, after and around advices</b></h2>
    <p>1. You need to activate the services in the Wirebox binder.<br><br>
			listeners = [<br>
				{ class="wirebox.system.aop.Mixer",properties={} }<br>
			]	
	</p>
	<h3>How it works</h3>
	<p>
		<ul style="line-height:40px;">
		<li>Identify the CFC or CFC's that we want to apply AOP to</li>
		<li>What methods will be decorated?</li>
		<li>AOP will decorate these methods for us with the needed aspects</li>
		</ul>
	</p>
	<p>2. Create an aspect. We can do this with ColdBox Platform Utilities</p>
	<p>3. Create a mapping to this aspect in Wirebox</p>
	<p>mapAspect("loggingMethodAspect").to("config.loggingAspects");</p>
	<p>4. Create a binding to the target</p>
	<p>bindAspect(classes=match().regex('model.logMe'),methods=match().methods('methodLogger'),aspects="loggingMethodAspect");</p>
	<cfdump var="#application.wirebox.getInstance('model.logMe').methodLogger(propname="George")#">
	<!-- end #mainContent --></div>
<!-- end #container --></div>
</body>
</html>