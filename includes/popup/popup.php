<?php
$x=$_GET['codigo'];

switch ($_GET['page']){
    
    case "Terminos":
        include ("Terminos.php");
    break;
    case "Ver_valija":
        include ("Pop_Valija.php");
    break;
    case "Edit_valija":
        include ("Pop_edit_Valija.php");
    break;
    case "VerCliente":
        include ("Pop_verCliente.php");
    break;
    case "VerNotificacion":
        include ("notificaciones.php");
    break;
    case "VerArchivos":
        include ("index22.php");
    break;
    case "renovar":
        include ("renovar.php");
        break;
    case "Gastos":
        include ("gastos.php");
        break;
    case "VerSolicitudEgreso":
        include ("solicitudEgreso.php");
         break;
     case "cotizacion":
        include ("Cotizacion.php");
          break;
     case "archivos":
        include ("archivos.php");
          break;
     case "facturas":
        include ("facturas.php");
          break;
    
    
}


?>