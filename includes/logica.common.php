<?php
	//require_once ("/var/www/html/denkel/xajax/xajax_core/xajax.inc.php");
	include_once ('config.ini.php');
	require_once (PATH_PROD."DenkelService/xajax/xajax_core/xajax.inc.php");
	$xajax = new xajax("includes/logica.server.php");
//clientes	
	$xajax->registerFunction("xplanes");
        $xajax->registerFunction("xdetallesplan");

//////////
        
//Procesos
        $xajax->registerFunction("xagregaproces");
        $xajax->registerFunction("xguardarproces");
        $xajax->registerFunction("xsubirarchivos");
        $xajax->registerFunction("xversubidos");
        $xajax->registerFunction("xconfiguraciones");
        $xajax->registerFunction("xmuestraconfiguracion");
        $xajax->registerFunction("xaumentarubro");
        $xajax->registerFunction("xubicatramite");
        $xajax->registerFunction("xnotificar");
        $xajax->registerFunction("xaprobar");
        $xajax->registerFunction("xrechazar");
        $xajax->registerFunction("xinsertarechazada");
        $xajax->registerFunction("xactualizafactura");
?>