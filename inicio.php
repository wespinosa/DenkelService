<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();
date_default_timezone_set('America/Bogota');
if ($_SESSION["autenticado"]!= 'SI'){
		//$menu = menu();
		header("Location:index.php");
		//$content = frmingreso();
	}
	else{
        require_once("includes/logica.common.php");    
        include_once("includes/database.inc.php");
	$dbmysql = new database();
        include_once("includes/clientes.php");
        include_once("includes/ramo.php");
        include_once("includes/aseguradora.php");
        include_once("includes/logica.inc.php");

$modulos = isset($_GET['modulo'])?$_GET['modulo']:'ninguno';
	$content = '';
	$titulo = '';
        $content_derecho='';
//        include_once("includes/logica.inc.php");
	switch ($modulos){

		case 'clientes':
				$option = isset($_GET['op'])?$_GET['op']:0;
                                
				switch ($option){
					case 'crear':
							$titulo = 'Crear un Nuevo Cliente';
                                                        $user = 0;
							$content = frm_cliente($user);
						break;
                                        case 'inscliente':
							$titulo = 'Guardar Datos de Clientes';
                                                        $codigo = isset($_GET['cod'])?$_GET['cod']:0;
							$content = save_cliente($codigo);
                                                        $content .= frm_verclientes();
						break;
                                        case 'buscliente':
							$titulo = 'Buscar Clientes';
							$content = frm_buscliente();
						break;
                                        case 'vercliente':
							$titulo = 'Ver todos los Clientes';
							$content_izquierdo = frm_verclientes();
						break;
                                        case 'editcliente':
							$titulo = 'Ver todos los Clientes';
                                                        $codigo = isset($_GET['codigo'])?$_GET['codigo']:0;
							$content = frm_cliente($codigo);
						break;
                                        case 'eliminacliente':
							$titulo = 'Ver todos los Clientes';
                                                        $codigo = isset($_GET['codigo'])?$_GET['codigo']:0;
                                                        $content = eliminar_clientes($codigo);
							$content .= frm_verclientes();
						break;
                                     
                                    }   
                                break;
                  
                  case 'tramites':
				$option = isset($_GET['op'])?$_GET['op']:0;
                                
				switch ($option){
					
                                        case 'inspoliza':
							$titulo = 'Guardar Datos del Medico';
                                                        $codigo = isset($_GET['cod'])?$_GET['cod']:0;
							$content = grabar_poliza($codigo);
                                                        $content .= frm_verpoliza();
						break;
                                        case 'buspoliza':
							$titulo = 'Buscar Medicos';
							$content = frm_buspoliza();
						break;
                                        case 'vertramite':
							$titulo = 'Ver todos los Medicos';
							$content_izquierdo = verOrdenes();
                                                        $content_derecho=configuracion();
						break;
                                        case 'editpoliza':
							$titulo = 'Ver todos los Medicos';
                                                        $codigo = isset($_GET['codigo'])?$_GET['codigo']:0;
							$content = frm_poliza($codigo);
						break;
                                        case 'eliminapoliza':
							$titulo = 'Ver todos los Medicos';
                                                        $codigo = isset($_GET['codigo'])?$_GET['codigo']:0;
                                                        $content = eliminar_poliza($codigo);
							$content .= frm_verpoliza();
						break;
                                        case 'enviapoliza':
							$titulo = 'Ver todos los Medicos';
                                                        $codigo = isset($_GET['codigo'])?$_GET['codigo']:0;
							$content = mailnotificacion($codigo);
						break;
                                        case 'insertsolicitud':
							$titulo = 'Ver todos los Medicos';
//                                                        echo $_SESSION['guardar']; exit;
                                                        if($_SESSION['guardar'] == 1 ){
                                                        insertar_Solicitud();
                                                        }
                                                        $content_izquierdo .= verOrdenes();
                                                        $content_derecho=configuracion();
						break;
                                        case 'actualizasolicitud':
							$titulo = 'Ver todos los Medicos';
                                                        $codigo = isset($_GET['codigo'])?$_GET['codigo']:0;
                                                        $op = isset($_GET['op'])?$_GET['op']:0;
							actualiza_Solicitud($codigo,$op);
						break;
                                        case 'insertfactura':
							$titulo = 'Ver todos los Medicos';
                                                        if($_SESSION['guardar'] == 1 ){
                                                            insertar_factura();
                                                        }
                                                        $content_izquierdo .= verOrdenes();
                                                        $content_derecho=configuracion();
						break;
                                    }   
                                break;
                          case 'notificaciones':
				$option = isset($_GET['op'])?$_GET['op']:0;
                                
				switch ($option){
					case 'insertnotifi':  
                                                        $titulo = 'Ver todos los Medicos';
							insertar_notificacion();
                                                        $content_izquierdo = verOrdenes();
                                                        $content_derecho=configuracion();
						break;
                                     
                                    }   
                         default:	
                                $titulo = 'Listado de documentos';
                                $user = $_SESSION["id"];
				$content_izquierdo = menu_principal();
                        break;
        
}
    $fecha_actual= date('Y-m-d');
    $fecha_cinco=date('Y-m-d', strtotime('1 month'));
?>

<!DOCTYPE html>
<html lang="es">
    <head>
            <meta charset="UTF-8" />
            <title>DENKEL S.A. :: Sistema de Tramites</title>
            <link type="text/css" href="css/menu.css" rel="stylesheet" />
            <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.11.custom.css"/>
            <link rel="stylesheet" type="text/css" href="css/default.css"/>
            <script type="text/javascript" src="js/jquery.js"></script>
            <script type="text/javascript" src="js/jquery-1.7.2.min.js"> </script>
            <script type="text/javascript" src="js/jquery-ui-1.8.11.custom.min.js"> </script>
           <script language="javascript" type="text/javascript" src="js/jquery.csspopup.js"></script>
           <script type="text/javascript" src="../swfupload/swfupload.js"></script>
           <script type="text/javascript" src="js/plupload.full.min.js"></script>
         
           
           
	<script>

		/*
			TOOLTIP
		*/

		$( document ).ready( function()
		{
			var targets = $( '[rel~=tooltip]' ),
				target	= false,
				tooltip = false,
				title	= false;

			targets.bind( 'mouseenter', function()
			{
				target	= $( this );
				tip		= target.attr( 'title' );
				tooltip	= $( '<div id="tooltip"></div>' );

				if( !tip || tip == '' )
					return false;

				target.removeAttr( 'title' );
				tooltip.css( 'opacity', 0 )
					   .html( tip )
					   .appendTo( 'body' );

				var init_tooltip = function()
				{
					if( $( window ).width() < tooltip.outerWidth() * 1.5 )
						tooltip.css( 'max-width', $( window ).width() / 2 );
					else
						tooltip.css( 'max-width', 340 );

					var pos_left = target.offset().left + ( target.outerWidth() / 2 ) - ( tooltip.outerWidth() / 2 ),
						pos_top	 = target.offset().top - tooltip.outerHeight() - 20;

					if( pos_left < 0 )
					{
						pos_left = target.offset().left + target.outerWidth() / 2 - 20;
						tooltip.addClass( 'left' );
					}
					else
						tooltip.removeClass( 'left' );

					if( pos_left + tooltip.outerWidth() > $( window ).width() )
					{
						pos_left = target.offset().left - tooltip.outerWidth() + target.outerWidth() / 2 + 20;
						tooltip.addClass( 'right' );
					}
					else
						tooltip.removeClass( 'right' );

					if( pos_top < 0 )
					{
						var pos_top	 = target.offset().top + target.outerHeight();
						tooltip.addClass( 'top' );
					}
					else
						tooltip.removeClass( 'top' );

					tooltip.css( { left: pos_left, top: pos_top } )
						   .animate( { top: '+=10', opacity: 1 }, 50 );
				};

				init_tooltip();
				$( window ).resize( init_tooltip );

				var remove_tooltip = function()
				{
					tooltip.animate( { top: '-=10', opacity: 0 }, 50, function()
					{
						$( this ).remove();
					});

					target.attr( 'title', tip );
				};

				target.bind( 'mouseleave', remove_tooltip );
				tooltip.bind( 'click', remove_tooltip );
			});
		});

		/*
			---
		*/

	</script>

	<script>

		/*
			VIEWPORT BUG FIX
			iOS viewport scaling bug fix, by @mathias, @cheeaun and @jdalton
		*/
		
		( function( doc )
		{
			var addEvent = 'addEventListener',
			    type	 = 'gesturestart',
			    qsa		 = 'querySelectorAll',
			    scales	 = [ 1, 1 ],
			    meta	 = qsa in doc ? doc[ qsa ]( 'meta[name=viewport]' ) : [];
		
			function fix()
			{
				meta.content = 'width=device-width,minimum-scale=' + scales[ 0 ] + ',maximum-scale=' + scales[ 1 ];
				doc.removeEventListener( type, fix, true );
			}
		
			if( ( meta = meta[ meta.length - 1 ] ) && addEvent in doc )
			{
				fix();
				scales = [ .25, 1.6 ];
				doc[ addEvent ]( type, fix, true );
			}
		
		}( document ) );

	</script>

           
           
            <script>
                
                jQuery('.texto-gris').each(function() {           
                    var valorActual = jQuery(this).val();
                    jQuery(this).focus(function(){               
                        if( jQuery(this).val() == valorActual ) {
                            jQuery(this).val('');
                            jQuery(this).removeClass('texto-gris');
                        };
                    });
                    jQuery(this).blur(function(){
                        if( jQuery(this).val() == '' ) {
                            jQuery(this).val(valorActual);
                            jQuery(this).addClass('texto-gris');
                        };
                    });
                });
                jQuery("#buscar_tramite").keyup(function(){
                    if( jQuery(this).val() != ""){
                        jQuery("#report tbody>tr").hide();
                        jQuery("#report td:contiene-palabra('" + jQuery(this).val() + "')").parent("tr").show();
                    }
                    else{
                        jQuery("#report tbody>tr").show();
                    }
                });
                jQuery.extend(jQuery.expr[":"],
                {
                    "contiene-palabra": function(elem, i, match, array) {
                        return (elem.textContent || elem.innerText || jQuery(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                    }
                });
            </script>
           
           
            <script type="text/javascript">  
                    $(document).ready(function(){
//                        $("#report tr:odd").addClass("odd");
                        $("#report tbody tr:not(.odd)").hide();
                        $("#report tbody tr:first-child").show();
                       

                        $("#report tbody tr.odd").click(function(){
                            $(this).next("tbody tr").toggle();
                            $(this).find(".arrow").toggleClass("up");
                        });
//                        $("#report").jExpand();
                    });
                </script> 
           <script>
            $(function() {
              $( "#dialog" ).dialog({
                autoOpen: false,
                show: {
                  effect: "blind",
                  duration: 1000
                },
                hide: {
                  effect: "explode",
                  duration: 1000
                }
              });

              $( "#opener" ).click(function() {
                $( "#dialog" ).dialog( "open" );
              });
            });
            </script>
          
           <script>
                var searchOnTable = function() {
                var table = $('#report');
                var value = this.value;
                table.find('tr').each(function(index, row) {
                    var allCells = $(row).find('td');
                    if(allCells.length > 0) {
                        var found = false;
                        allCells.each(function(index, td) {
                            var regExp = new RegExp(value, 'i');
                            if(regExp.test($(td).text())) {
                                found = true;
                                return false;
                            }
                        });
                        if (found == true) $(row).show();
                        else $(row).hide();
                    }
                });
            };

            $(function(){
                $('#buscar_tramite').keyup(searchOnTable);
            });
          </script>  
           
           <!-- SCRIPT PARA CREAR TRAMITES -->
           <script>
          $(function() {
            var cliente = $( "#codigo_cliente" ),
                proveedor = $( "#codigo_proveedor" ),
                codigo = $( "#codigo" ),
                referencia = $( "#num_ref_cliente" ),
                via = $( "#via" ),
                servicio = $( "#servicio" ),
                tipocarga = $( "#tpcarga" ),
                distrito = $( "#distrito" ),
                responsable = $( "#responsable" ),
                
                allFields = $( [] ).add( cliente ).add( proveedor ).add( codigo ).add( referencia ).add( via ).add( servicio ).add( tipocarga ).add( distrito ).add( responsable ),
                tips = $( ".validateTips" );

              function updateTips( t ) {
                tips
                  .text( t )
                  .addClass( "ui-state-highlight" );
                setTimeout(function() {
                  tips.removeClass( "ui-state-highlight", 1500 );
                }, 500 );
              }

              function checkLength( o, n, min, max ) {
                if ( o.val().length > max || o.val().length < min ) {
                  o.addClass( "ui-state-error" );
                  updateTips( "El Tamaño de " + n + " debe estar entre " +
                    min + " y " + max + " Caracteres." );
                  return false;
                } else {
                  return true;
                }
              }
              function checkVacioCombo( o, n ) {
                if ( o.val()=='0') {
                  o.addClass( "ui-state-error" );
                  updateTips( "Debe Seleecionar un " + n );
                  return false;
                } else {
                  return true;
                }
              }
              function checkRegexp( o, regexp, n ) {
                if ( !( regexp.test( o.val() ) ) ) {
                  o.addClass( "ui-state-error" );
                  updateTips( n );
                  return false;
                } else {
                  return true;
                }
              }

              $( "#dialog-form" ).dialog({
                autoOpen: false,
                show: {
                  effect: "blind",
                  duration: 1000
                },
                hide: {
                  effect: "explode",
                  duration: 1000
                },
                autoOpen: false,
                height: 550,
                width: 600,
                modal: true,
                
                buttons: {
                  "Crear Tramite": function() {
                    var bValid = true;
                    allFields.removeClass( "ui-state-error" );

                    bValid = bValid && checkLength( cliente, "Cliente", 1, 5 );
                    bValid = bValid && checkLength( proveedor, "Proveedor", 1, 5);
                    bValid = bValid && checkLength( referencia, "Numero de Referencia", 3, 20 );
                    bValid = bValid && checkVacioCombo( via, "Via de transporte" );
                    bValid = bValid && checkVacioCombo( servicio, "Servicio" );
                    bValid = bValid && checkVacioCombo( tipocarga, "Tipo de Carga" );
                    bValid = bValid && checkVacioCombo( distrito, "Distrito");
                    bValid = bValid && checkVacioCombo( responsable, "Responsable");
                    

                    bValid = bValid && checkRegexp( cliente, /^([0-9])+$/i, "El Codigo del Cliente debe ser Numerico." );
                    bValid = bValid && checkRegexp( proveedor, /^([0-9])+$/i, "El Codigo del Proveedor debe ser Numerico." );

                    if ( bValid ) {
                      $( "#users tbody" ).append( "<tr>" +
                        "<td>" + cliente.val() + "</td>" +
                        "<td>" + proveedor.val() + "</td>" +
                        "<td>" + codigo.val() + "</td>" +
                        "<td>" + referencia.val() + "</td>" +
                        "<td>" + via.val() + "</td>" +
                        "<td>" + servicio.val() + "</td>" +
                        "<td>" + tipocarga.val() + "</td>" +
                        "<td>" + responsable.val() + "</td>" +
                        "<td>" + distrito.val() + "</td>" +
                      "</tr>" );
              $.post("includes/Inserciones/inserta_tramite.php",{
                  cliente:cliente.val(),
                  proveedor:proveedor.val(),
                  codigo:codigo.val(), 
                  referencia:referencia.val(),
                  via:via.val(), 
                  servicio:servicio.val(), 
                  tipocarga:tipocarga.val(),
                  responsable:responsable.val(),
                  distrito:distrito.val()
                      },function(respuesta){
                          if(respuesta!=''){
                            $( "#dialog-form" ).dialog( "close" );
//                    alert(respuesta);
                            popupCssShow('includes/popup/popup.php?page=VerNotificacion&codigo='+codigo.val()+'&tipo=nuevo', 460);
//                    location.reload();
//                    alert(respuesta); //Mostramos un alert del resultado devuelto por el php
//                    location.reload();
                          }else{
                              alert('Existe algun Error... No se realizo la Inserción');
                          }
                    });
                    
                    }
                    
                  },
                  
                  Cancel: function() {
                    $( this ).dialog( "close" );
                  }
                },
                close: function() {
                  allFields.val( "" ).removeClass( "ui-state-error" );
                }
              });

              $( "#create-user" )
                .button()
                .click(function() {
                  $( "#dialog-form" ).dialog( "open" );
                });
            });
       </script>
        <style type="text/css">

            input:not([type=checkbox]), textarea {
                    /*width: 200px;*/
                    padding: 3px;
                    border: 1px solid #ccc;
                    -moz-border-radius: 5px;
                    -webkit-border-radius: 5px;
            }
            
/*            form {
                    width: -100px;
                    margin: 0 auto 0 auto;
            }*/
/*            form fieldset {
                    padding: 26px;
                    border: 1px solid #b4b4b4;
                    -moz-border-radius: 10px;
                    -webkit-border-radius: 10px;
            }

            form legend {
                    padding: 5px 20px 5px 20px;
                    color: #030303;
                    -moz-border-radius: 6px;
                    -webkit-border-radius: 6px;
                    border: 1px solid #b4b4b4;
            }*/

/*            form ol {
                    list-style: none;
                    margin-bottom: 20px;
                    border: 1px solid #b4b4b4;
                    -moz-border-radius: 10px;
                    -webkit-border-radius: 10px;
                    padding: 10px;
            }

            form ol, form legend, form fieldset {
                    background-image: -moz-linear-gradient(top, #f7f7f7, #e5e5e5);  FF3.6 
                    background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #e5e5e5),color-stop(1, #f7f7f7));  Saf4+, Chrome 
            }*/
/*
            form ol.buttons {
                    overflow: auto;
            }*/

/*            form ol li label {
                    float: left;
                    width: 60px;
                    font-weight: bold;

            }*/

/*            .settings {
                     width: 400px; 
                    list-style: none;
                    position: relative;
            }*/

/*            .settings p {
                    display: block;
                    margin-bottom: 20px;
                    background: -moz-linear-gradient(50% 50% 180deg,#C91A1A, #DB2E2E, #0C990C 0%); 
                    background: -webkit-gradient(linear, 50% 50%, 0% 50%, from(#C90202), to(#009C05), color-stop(0,#00AB00));
                    border-radius: 8px;
                    -moz-border-radius: 6px;
                    border: 1px solid #555555;
                    width: 36px;
                    position: relative;
                    height: 15px;
            }*/
/*            .check { 
                    display: block;
                    width: 20px;
                    height: 13px;
                    border-radius: 8px;
                    -moz-border-radius: 6px;
                    background: -moz-linear-gradient(19% 75% 90deg,#FFFFFF, #A1A1A1);
                    background: #fff -webkit-gradient(linear, 0% 0%, 0% 100%, from(#A1A1A1), to(#FFFFFF));
                    border: 1px solid #e5e5e5;
                    position: absolute;
                    top: 0px;
                    left: 0px;
            }*/



/*            input[type=checkbox] {
            	display: none;
            }

            @-webkit-keyframes labelON {
                    0% {
                            top: 0px;
                    left: 0px;
                    }

                    100% { 
                            top: 0px;
                    left: 14px;
                    }
            }*/

/*            input[type=checkbox]:checked + label.check {
                    top: 0px;
                    left: 14px;
                    -webkit-animation-name: labelON; 
                    -webkit-animation-duration: .2s; 
                    -webkit-animation-iteration-count: 1;
                    -webkit-animation-timing-function: ease-in;
                    -webkit-box-shadow: #244766 -1px 0px 3px;
                    -moz-box-shadow: #244766 -1px 0px 3px;
            }*/

/*            @-webkit-keyframes labelOFF {
                    0% {
                            top: 0px;
                    left: 16px;
                    }

                    100% { 
                            top: 0px;
                    left: 0px;
                    }
            }*/

/*            input[type=checkbox] + label.check {
                    top: 0px;
                    left: 0px;
                    -webkit-animation-name: labelOFF; 
                    -webkit-animation-duration: .2s; 
                    -webkit-animation-iteration-count: 1;
                    -webkit-animation-timing-function: ease-in;
                    -webkit-box-shadow: #244766 1px 0px 3px;
                    -moz-box-shadow: #244766 1px 0px 3px;
            }*/

/*            label.info {
                    position: absolute;
                    color: #000;
                    top:0px;
                    left: 50px;
                    line-height: 15px;
                    width: 200px;
            }*/


/*            form ol.buttons li {
                    float: left;
                    width: 100px;
            }*/

            input[type=button] {
                     width: 100px;
                    color: #f3f3f3;
                    -moz-border-radius: 6px;
                    -webkit-border-radius: 6px;
                    background-image: -moz-linear-gradient(top, #d01111, #7e0c0c);
                    background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #7e0c0c),color-stop(1, #d01111)); 
                    -webkit-box-shadow: #4b4b4b 0px 2px 5px;
                    -moz-box-shadow: #4e4e4e 0px 2px 5px;
                    box-shadow: #e3e3e3 0px 2px 5px;
                    /*border: none;*/
                    
            }
            input[type=submit] {
                    width: 100px;
                    color: #f3f3f3;
                    -moz-border-radius: 6px;
                    -webkit-border-radius: 6px;
                    background-image: -moz-linear-gradient(top, #0cb114, #07580b); 
                    background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #07580b),color-stop(1, #0cb114)); 
                    -webkit-box-shadow: #4b4b4b 0px 2px 5px;
                    -moz-box-shadow: #4e4e4e 0px 2px 5px;
                    box-shadow: #e3e3e3 0px 2px 5px;
                    border: none;
            }
            input[type=reset] {
                    width: 100px;
                    color: #f3f3f3;
                    -moz-border-radius: 6px;
                    -webkit-border-radius: 6px;
                    background-image: -moz-linear-gradient(top, #d01111, #7e0c0c); 
                    background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #7e0c0c),color-stop(1, #d01111));
                    -webkit-box-shadow: #4b4b4b 0px 2px 5px;
                    -moz-box-shadow: #4e4e4e 0px 2px 5px;
                    box-shadow: #e3e3e3 0px 2px 5px;
                    border: none;

            }
</style>
            
        <!--FECHA -->
        <script>
            $(function() {
                    $( "#fechanacimiento" ).datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'yy/mm/dd'
                    });
                    $( "#fecha_pago" ).datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'yy/mm/dd'
                    });
                    $( "#renovacion" ).datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'yy/mm/dd'
                    });
                     $( "#vigencia" ).datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'yy/mm/dd'
                    });
            });
	</script>
        <script type="text/javascript">  
                $(document).ready(function(){  
                       setTimeout(function(){ $(".mensajes").fadeOut(800).fadeIn(800).fadeOut(800).fadeIn(500).fadeOut(300);}, 5000);   
                });  
            </script>  
        <script type="text/javascript">
            /*
            * Funcion JavaScript para validar Cedula,Ruc y Pasaporte Ecuatorianos.
            *
            * La funcion devuelve verdadero (true) en caso de exito y falso cuando hay
            * un error en la validacion.
            *
            * Creado por: Carlos Julio Perez Q.
            * cjperez@espol.edu.ec
            * carlosjulioperez@gmail.com
            * 093-208265 
            * Guayaquil-Manta-Ecuador.
            */
   validarDocumento  = function() {          
   
      numero = document.getElementById('cedula').value;
	  /* alert(numero); */

      var suma = 0;      
      var residuo = 0;      
      var pri = false;      
      var pub = false;            
      var nat = false;      
      var numeroProvincias = 22;                  
      var modulo = 11;
                  
      /* Verifico que el campo no contenga letras */                  
      var ok=1;
      for (i=0; i<numero.length && ok==1 ; i++){
         var n = parseInt(numero.charAt(i));
         if (isNaN(n)) ok=0;
      }
      if (ok==0){
         alert("No puede ingresar caracteres en el número");         
         return false;
      }
                  
      if (numero.length < 10 ){              
         alert('El número ingresado no es válido');                  
         return false;
      }
     
      /* Los primeros dos digitos corresponden al codigo de la provincia */
      provincia = numero.substr(0,2);      
      if (provincia < 1 || provincia > numeroProvincias){           
         alert('El código de la provincia (dos primeros dígitos) es inválido');
		 return false;       
      }

      /* Aqui almacenamos los digitos de la cedula en variables. */
      d1  = numero.substr(0,1);         
      d2  = numero.substr(1,1);         
      d3  = numero.substr(2,1);         
      d4  = numero.substr(3,1);         
      d5  = numero.substr(4,1);         
      d6  = numero.substr(5,1);         
      d7  = numero.substr(6,1);         
      d8  = numero.substr(7,1);         
      d9  = numero.substr(8,1);         
      d10 = numero.substr(9,1);                
         
      /* El tercer digito es: */                           
      /* 9 para sociedades privadas y extranjeros   */         
      /* 6 para sociedades publicas */         
      /* menor que 6 (0,1,2,3,4,5) para personas naturales */ 

      if (d3==7 || d3==8){           
         alert('El tercer dígito ingresado es inválido');                     
         return false;
      }         
         
      /* Solo para personas naturales (modulo 10) */         
      if (d3 < 6){           
         nat = true;            
         p1 = d1 * 2;  if (p1 >= 10) p1 -= 9;
         p2 = d2 * 1;  if (p2 >= 10) p2 -= 9;
         p3 = d3 * 2;  if (p3 >= 10) p3 -= 9;
         p4 = d4 * 1;  if (p4 >= 10) p4 -= 9;
         p5 = d5 * 2;  if (p5 >= 10) p5 -= 9;
         p6 = d6 * 1;  if (p6 >= 10) p6 -= 9; 
         p7 = d7 * 2;  if (p7 >= 10) p7 -= 9;
         p8 = d8 * 1;  if (p8 >= 10) p8 -= 9;
         p9 = d9 * 2;  if (p9 >= 10) p9 -= 9;             
         modulo = 10;
      }         

      /* Solo para sociedades publicas (modulo 11) */                  
      /* Aqui el digito verficador esta en la posicion 9, en las otras 2 en la pos. 10 */
      else if(d3 == 6){           
         pub = true;             
         p1 = d1 * 3;
         p2 = d2 * 2;
         p3 = d3 * 7;
         p4 = d4 * 6;
         p5 = d5 * 5;
         p6 = d6 * 4;
         p7 = d7 * 3;
         p8 = d8 * 2;            
         p9 = 0;            
      }         
         
      /* Solo para entidades privadas (modulo 11) */         
      else if(d3 == 9) {           
         pri = true;                                   
         p1 = d1 * 4;
         p2 = d2 * 3;
         p3 = d3 * 2;
         p4 = d4 * 7;
         p5 = d5 * 6;
         p6 = d6 * 5;
         p7 = d7 * 4;
         p8 = d8 * 3;
         p9 = d9 * 2;            
      }
                
      suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9;                
      residuo = suma % modulo;                                         

      /* Si residuo=0, dig.ver.=0, caso contrario 10 - residuo*/
      digitoVerificador = residuo==0 ? 0: modulo - residuo;                

      /* ahora comparamos el elemento de la posicion 10 con el dig. ver.*/                         
      if (pub==true){           
         if (digitoVerificador != d9){                          
            alert('El ruc de la empresa del sector público es incorrecto.');            
            return false;
         }                  
         /* El ruc de las empresas del sector publico terminan con 0001*/         
         if ( numero.substr(9,4) != '0001' ){                    
            alert('El ruc de la empresa del sector público debe terminar con 0001');
            return false;
         }
      }         
      else if(pri == true){         
         if (digitoVerificador != d10){                          
            alert('El ruc de la empresa del sector privado es incorrecto.');
            return false;
         }         
         if ( numero.substr(10,3) != '001' ){                    
            alert('El ruc de la empresa del sector privado debe terminar con 001');
            return false;
         }
      }      

      else if(nat == true){         
         if (digitoVerificador != d10){                          
            alert('El número de cédula de la persona natural es incorrecto.');
            return false;
         }         
         if (numero.length >10 && numero.substr(10,3) != '001' ){                    
            alert('El ruc de la persona natural debe terminar con 001');
            return false;
         }
      }      
      return true;   
   }            


</script>
        <script type="text/javascript">

/*
* Funcion JavaScript para validar Cedula,Ruc y Pasaporte Ecuatorianos.
*
* La funcion devuelve verdadero (true) en caso de exito y falso cuando hay
* un error en la validacion.
*
* Creado por: Carlos Julio Perez Q.
* cjperez@espol.edu.ec
* carlosjulioperez@gmail.com
* 093-208265 
* Guayaquil-Manta-Ecuador.
*/
   validarRucMedico  = function() {          
   
      numero = document.getElementById('ruc_medico').value;
	  /* alert(numero); */

      var suma = 0;      
      var residuo = 0;      
      var pri = false;      
      var pub = false;            
      var nat = false;      
      var numeroProvincias = 22;                  
      var modulo = 11;
                  
      /* Verifico que el campo no contenga letras */                  
      var ok=1;
      for (i=0; i<numero.length && ok==1 ; i++){
         var n = parseInt(numero.charAt(i));
         if (isNaN(n)) ok=0;
      }
      if (ok==0){
         alert("No puede ingresar caracteres en el número");         
         return false;
      }
                  
      if (numero.length < 13 ){              
         alert('El número de Ruc debe tener 13 Digitos');
         document.getElementById('ruc_medico').focus();
         return false;
      }
     
      /* Los primeros dos digitos corresponden al codigo de la provincia */
      provincia = numero.substr(0,2);      
      if (provincia < 1 || provincia > numeroProvincias){           
         alert('El código de la provincia (dos primeros dígitos) es inválido');
		 return false;       
      }

      /* Aqui almacenamos los digitos de la cedula en variables. */
      d1  = numero.substr(0,1);         
      d2  = numero.substr(1,1);         
      d3  = numero.substr(2,1);         
      d4  = numero.substr(3,1);         
      d5  = numero.substr(4,1);         
      d6  = numero.substr(5,1);         
      d7  = numero.substr(6,1);         
      d8  = numero.substr(7,1);         
      d9  = numero.substr(8,1);         
      d10 = numero.substr(9,1);                
         
      /* El tercer digito es: */                           
      /* 9 para sociedades privadas y extranjeros   */         
      /* 6 para sociedades publicas */         
      /* menor que 6 (0,1,2,3,4,5) para personas naturales */ 

      if (d3==7 || d3==8){           
         alert('El tercer dígito ingresado es inválido');                     
         return false;
      }         
         
      /* Solo para personas naturales (modulo 10) */         
      if (d3 < 6){           
         nat = true;            
         p1 = d1 * 2;  if (p1 >= 10) p1 -= 9;
         p2 = d2 * 1;  if (p2 >= 10) p2 -= 9;
         p3 = d3 * 2;  if (p3 >= 10) p3 -= 9;
         p4 = d4 * 1;  if (p4 >= 10) p4 -= 9;
         p5 = d5 * 2;  if (p5 >= 10) p5 -= 9;
         p6 = d6 * 1;  if (p6 >= 10) p6 -= 9; 
         p7 = d7 * 2;  if (p7 >= 10) p7 -= 9;
         p8 = d8 * 1;  if (p8 >= 10) p8 -= 9;
         p9 = d9 * 2;  if (p9 >= 10) p9 -= 9;             
         modulo = 10;
      }         

      /* Solo para sociedades publicas (modulo 11) */                  
      /* Aqui el digito verficador esta en la posicion 9, en las otras 2 en la pos. 10 */
      else if(d3 == 6){           
         pub = true;             
         p1 = d1 * 3;
         p2 = d2 * 2;
         p3 = d3 * 7;
         p4 = d4 * 6;
         p5 = d5 * 5;
         p6 = d6 * 4;
         p7 = d7 * 3;
         p8 = d8 * 2;            
         p9 = 0;            
      }         
         
      /* Solo para entidades privadas (modulo 11) */         
      else if(d3 == 9) {           
         pri = true;                                   
         p1 = d1 * 4;
         p2 = d2 * 3;
         p3 = d3 * 2;
         p4 = d4 * 7;
         p5 = d5 * 6;
         p6 = d6 * 5;
         p7 = d7 * 4;
         p8 = d8 * 3;
         p9 = d9 * 2;            
      }
                
      suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9;                
      residuo = suma % modulo;                                         

      /* Si residuo=0, dig.ver.=0, caso contrario 10 - residuo*/
      digitoVerificador = residuo==0 ? 0: modulo - residuo;                

      /* ahora comparamos el elemento de la posicion 10 con el dig. ver.*/                         
      if (pub==true){           
         if (digitoVerificador != d9){                          
            alert('El ruc de la empresa del sector público es incorrecto.');            
            return false;
         }                  
         /* El ruc de las empresas del sector publico terminan con 0001*/         
         if ( numero.substr(9,4) != '0001' ){                    
            alert('El ruc de la empresa del sector público debe terminar con 0001');
            return false;
         }
      }         
      else if(pri == true){         
         if (digitoVerificador != d10){                          
            alert('El ruc de la empresa del sector privado es incorrecto.');
            return false;
         }         
         if ( numero.substr(10,3) != '001' ){                    
            alert('El ruc de la empresa del sector privado debe terminar con 001');
            return false;
         }
      }      

      else if(nat == true){         
         if (digitoVerificador != d10){                          
            alert('El número de cédula de la persona natural es incorrecto.');
            return false;
         }         
         if (numero.length >10 && numero.substr(10,3) != '001' ){                    
            alert('El ruc de la persona natural debe terminar con 001');
            return false;
         }
      }      
      return true;   
   }            


</script>
        <?php
		$xajax->printJavascript("xajax"); 
        ?>
   
        <script type="text/javascript" >
                      $(function(){
                           $( "#buscar_cliente_doc" ).autocomplete({
                            source: 'includes/xajax.php?modulo=clientes&tipo=1',
                            select: function (event,ui){
                                document.getElementById("codigo_cliente").value = ui.item.id;
                            }
                            });
                            $( "#buscar_proveedor_doc" ).autocomplete({
                            source: 'includes/xajax.php?modulo=clientes&tipo=1',
                            select: function (event,ui){
                                document.getElementById("codigo_proveedor").value = ui.item.id;
                            }
                            });
                            $( "#buscar_codigo_dk" ).autocomplete({
                            source: 'includes/xajax.php?modulo=codigo'
                            });
                      $("#buscar_cliente_cedula").autocomplete({
                                    source: 'includes/xajax.php?modulo=clientes&tipo=2',
                                    select: function(event,ui){
                                        $('#vercliente').slideUp('slow', function(){
                                                  $('#vercliente').html(
                                                  	 '<table width="315" height="227" border="0" background="images/bot.gif" style="font-size:13px">'+
                                                      '<tr>'+
                                                        '<td height="51" colspan="3"><div align="center" style="color:#902628; font-size:20px"><strong>'+ ui.item.nombre +'</strong></div></td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="23">&nbsp;</td>'+
                                                        '<td><strong>Identificacion:</strong></td>'+
                                                        '<td>'+ui.item.identificacion+'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="23">&nbsp;</td>'+
                                                        '<td><strong>Telefono:</strong></td>'+
                                                        '<td>'+ ui.item.telefono +'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="26">&nbsp;</td>'+
                                                        '<td><strong>Celular:</strong></td>'+
                                                        '<td>'+ui.item.celular+'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="26">&nbsp;</td>'+
                                                        '<td><strong>E-Mail: </strong></td>'+
                                                        '<td>'+ui.item.email+'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="31">&nbsp;</td>'+
                                                        '<td><strong>Dirección:</strong></td>'+
                                                        '<td>'+ui.item.direccion+'</td>'+
                                                      '</tr>'+
                                                      '<tr>'+
                                                        '<td height="31">&nbsp;</td>'+
                                                        '<td>&nbsp;</td>'+
                                                        '<td align="right"><a href="?modulo=clientes&op=editcliente&codigo='+ui.item.identificacion+'" onclick=""><img src="images/add.png" width="32" height="32" /></a><a href="?modulo=clientes&op=editcliente&codigo='+ui.item.identificacion+'" onclick=""><img src="images/edit.png" width="32" height="32" /></a></td>'+
                                                      '</tr>'+
                                                    '</table>'
                                    )
                                    });
                                    $('#vercliente').slideDown('slow');
                                    }
                                });
                           $("#buscar_cliente").autocomplete({
                                    source: 'includes/xajax.php?modulo=clientes',
                                    select: function(event,ui){
                                        $('#vercliente').slideUp('slow', function(){
                                                  $('#vercliente').html(
                                                   '<table width="315" height="182" border="0" background="images/bot.gif" style="font-size:13px">'+
                                                          '<tr>'+
                                                            '<td height="51" colspan="3"><div align="center" style="color:#902628; font-size:20px"><strong>'+ ui.item.nombre +'</strong></div></td>'+
                                                          '</tr>'+
                                                           '<tr style="color:#000000">'+
                                                        '<td height="23">&nbsp;</td>'+
                                                        '<td><strong>Identificacion:</strong></td>'+
                                                        '<td>'+ui.item.identificacion+'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="23">&nbsp;</td>'+
                                                        '<td><strong>Telefono:</strong></td>'+
                                                        '<td>'+ ui.item.telefono +'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="26">&nbsp;</td>'+
                                                        '<td><strong>Celular:</strong></td>'+
                                                        '<td>'+ui.item.celular+'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="26">&nbsp;</td>'+
                                                        '<td><strong>E-Mail: </strong></td>'+
                                                        '<td>'+ui.item.email+'</td>'+
                                                      '</tr>'+
                                                      '<tr style="color:#000000">'+
                                                        '<td height="31">&nbsp;</td>'+
                                                        '<td><strong>Dirección:</strong></td>'+
                                                        '<td>'+ui.item.direccion+'</td>'+
                                                      '</tr>'+
                                                      '<tr>'+
                                                        '<td height="31">&nbsp;</td>'+
                                                        '<td>&nbsp;</td>'+
                                                        '<td align="right"><a href="?modulo=clientes&op=editcliente&codigo='+ui.item.identificacion+'" onclick=""><img src="images/edit.png" width="32" height="32" /></a></td>'+
                                                      '</tr>'+
                                                    '</table>'
                                    )
                                    });
                                    $('#vercliente').slideDown('slow');
                                    }
                                    
                      });
                     });
            </script>
        <style type="text/css">
            #cssBackground      {height:100%; width:100%; background-color:#000; display:none; position:fixed; top:0; left:0; z-index:100; float:left; opacity:0.65;}
            #cssPopup           {margin:0 auto;}
            #cssPopupContainer  {position:absolute; display:none; z-index:101; width:100%;top: 500}
        </style>
<script type="text/javascript">
function mostrar_actividad(codigo_tramite,valor,codigo_proceso) {
    $.post("includes/Inserciones/consulta_procesos.php",{
            valor:valor,
            codigo:codigo_tramite,
            codigo_proceso:codigo_proceso
        },function(respuesta){
                          if(respuesta==''){
                              $('#create_process').attr("disabled", false);
                            if(valor==12) {//Solicitud Egreso 
                                    popupCssShow('includes/popup/popup.php?page=VerSolicitudEgreso&codigo='+codigo_tramite+'&solicitud=', 660);
                            }else if(valor==3){//Cotización
                                    popupCssShow('includes/popup/popup.php?page=cotizacion&codigo='+codigo_tramite+'&solicitud=', 660);
                            }else if(valor==24){//Traslado a Ecuapass
                                    popupCssShow('includes/popup/popup.php?page=archivos&codigo='+codigo_tramite+'&actividad='+valor, 660);
                            }else if(valor==33){//Traslado a Ecuapass
                                    popupCssShow('includes/popup/popup.php?page=archivos&codigo='+codigo_tramite+'&actividad='+valor+'&codigo_proceso='+codigo_proceso, 660);
                            }else if(valor==31){//Registro de Facturas
                                    popupCssShow('includes/popup/popup.php?page=facturas&codigo='+codigo_tramite+'&codigo_proceso=', 700);
                            }
                            
                          }else{
                              alert(respuesta);
                              $('#create_process').attr("disabled", true);
                          }
                    });
    
}
    
</script>
 </head>
    <!--onload="popupCssShow('includes/popup/popup.php?page=renovar',560)"-->
    <body>
    <div id="general">
        <div id="header">
            <div class="logo"></div>
            <div class="header_arriba">
                <div class="logo_login"><img src="images/log.png" width="35px" height="35px"/></div><div id="usuario"><?php echo $_SESSION["usu_real_nombre"];?></div><div id="tp_usuario"><?php echo $_SESSION["rol_usuario"] ?></div>
                <div class="logout">
                    <div align="center"><a href="inicio.php"><img src="images/Home.png"  width="30" height="30" border="0" align="absmiddle" alt="Inicio" title="Inicio" /></a></div>
                </div><div class="iconos_cabecera"></div>
            </div>
            <div class="header_abajo">
                <?php $date=  date('Y-m-d'); $sql_tramites="SELECT * FROM `dnk_documento` where `fecha` = '$date'"; $rows = $dbmysql->query($sql_tramites);?>
                <div id="info_tramites"><marquee behavior="scroll" direction="left" scrollamount="3">Tramites Creados Hoy: 
                        <?php while ( $row=$rows->fetch_object() ){?>
                            <?php echo $row->codigo; ?> |
                        <?php } ?>
                    </marquee></div> 
            </div>
        </div>
        <div id="contenerdor_central">
            <div id="contenerdor_derecho">
            <?php echo $content_derecho; ?>
            </div>
            <div id="contenerdor_izquierdo">
            <?php echo $content_izquierdo; ?>
            </div>
        </div>   
    </div>
















<!--        <table align="center" border="0"  width="60%" >
            <tr>
                <td>
                    <div id="header">
                             <div id="logo" align="center">
                                 <img src="images/banner.png" width="880px" />
                             </div>
                     </div>
                </td>
                <td rowspan="3">
                    
                        <div id="noticias">
                            <div id="banner_noticias">Polizas a Renovar:</div>
                                <marquee height="350px" onmouseover="stop()" onmouseout="start()" scrollamount="2" scrolldelay="100" direction="up">
                                    <?php  while ($row = $val->fetch_object()){ ?>
                                        <table width="100%" border="0" style="font-size:11px;border-bottom-color:#666; border-bottom-style:dotted; border-bottom-width:1px" cellspacing="0px" cellpadding="0px">

                                            <tr>
                                                <td width="50" rowspan="3"><img src="images/date.png" width="100%" /></td>
                                                <td width="52"><strong>Poliza:</strong><div style="color:#F00"><strong><?php echo $row->POL_CODIGO?></strong></div></td>
                                            </tr>
                                             <tr>
                                               <td><strong>Renovación:</strong><div style="color:#00F"><?php echo $row->POL_RENOVACION?></div></td>
                                             </tr>
                                             <tr>
                                              <td><strong>Cliente:</strong><div style="color:#00F"><?php echo $row->cl_nombre.' '.$row->cl_apellido ?></div></td>
                                            </tr>
                                        </table>
                                    <?php } ?>
                                </marquee>
                        </div>
                        <div id="loggin">
                                <?php 
                                   $date=date("d")."/".date("F")."/".date("Y");
                                ?>
                                <table border="0" cellspacing="0px">
                                    <tr bgcolor="#49acc8" style="color:#FFF;">
                                      <td colspan="5" align="center">Usuario:</td>
                                    </tr>
                                    <tr style="border-bottom-color:#666; border-bottom-style:dotted; border-bottom-width:1px;">
                                      <td>&nbsp;</td>
                                      <td colspan="3"><div align="center" style="font-size:10px"><?php echo $_SESSION["nombre"];?></div></td>
                                      <td style="font-size:10px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                      <td colspan="3"><div align="center"><?php echo $date ?></div></td>
                                      <td style="font-size:10px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td width="38">&nbsp;</td>
                                      <td width="101"><div align="center"><a href="inicio.php"><img src="images/Home.png"  width="30" height="30" border="0" align="absmiddle" alt="Inicio" title="Inicio" /></a></div></td>
                                      <td width="89" style="font-size:10px">&nbsp;</td>
                                      <td width="64" style="font-size:10px"><div align="left"><a href="logout.php"><img src="images/logoff.png"  width="30" height="30" border="0"  alt="Salir del Sistema" title="Salir del Sistema" /></a></div></td>
                                      <td width="70" style="font-size:10px">&nbsp;</td>
                                    </tr>
                              </table>
                        </div>
                </td>
            </tr>
        <tr><td>
		 end #header 
                        <div id="menu">
                            <ul class="menu">
                                <li><a href="#" class="parent"><span>Administrar</span></a>
                                    <div><ul>
                                        <li><a href="#" class="parent"><span>Clientes</span></a>
                                            <div><ul>
                                                <li><a href="?modulo=clientes&op=crear"><span>Crear</span></a></li>
                                                <li><a href="?modulo=clientes&op=buscliente"><span>Buscar</span></a></li>
                                                <li><a href="?modulo=clientes&op=vercliente"><span>Ver Todos</span></a></li>
                                            </ul></div>
                                        </li>
                                        <li><a href="#" class="parent"><span>Ramos</span></a>
                                            <div><ul>
                                                <li><a href="?modulo=ramos&op=crear"><span>Crear</span></a></li>
                                                <li><a href="?modulo=ramos&op=verramo"><span>Ver Todos</span></a></li>
                                            </ul></div>
                                        </li>
                                        <li><a href="#" class="parent"><span>Aseguradora</span></a>
                                            <div><ul>
                                                <li><a href="?modulo=aseguradora&op=crear"><span>Crear</span></a></li>
                                                <li><a href="?modulo=aseguradora&op=veraseguradora"><span>Ver Todos</span></a></li>
                                            </ul></div>
                                        </li>
                                        <li><a href="#" class="parent"><span>Usuarios</span></a>
                                            <div><ul>
                                                <li><a href="#"><span>Crear</span></a></li>
                                                <li><a href="#"><span>Buscar</span></a></li>
                                                <li><a href="#"><span>Ver Todos</span></a></li>
                                            </ul></div>
                                        </li>
                                    </ul></div>
                                </li>
                                <li><a href="#" class="parent"><span>Polizas</span></a>
                                    <div>
                                        <ul>
                                            <li><a href="?modulo=polizas&op=crear"><span>Crear Poliza</span></a></li>
                                            <li><a href="#"><span>Consultar Poliza</span></a></li>
                                            <li><a href="?modulo=polizas&op=verpoliza"><span>Ver Todas las Polizas</span></a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="last"><a href="#"><span>Ayuda</span></a></li>
                            </ul>
                        </div>
                    </td>
                 </tr>  
                <tr>
                    <td bgcolor="#E6FCE4">
			<div id="content" align="center">
                           <?php echo $content; ?>
                        </div>
                        <div id="copyright" style="visibility:hidden">Copyright &copy; 2011 <a href="http://apycom.com/">Apycom jQuery Menus</a></div>
                    </td>
                </tr>
        </table>-->
        
        
        <script type="text/javascript">
                // Custom example logic

                var uploader = new plupload.Uploader({
                        runtimes : 'html5,flash,silverlight,html4',
                        browse_button : 'pickfiles', // you can pass in id...
                        container: document.getElementById('container'), // ... or DOM Element itself
                        url : 'upload.php',
                        flash_swf_url : '../js/Moxie.swf',
                        silverlight_xap_url : '../js/Moxie.xap',

                        filters : {
                                max_file_size : '10mb',
                                mime_types: [
                                        {title : "Image files", extensions : "jpg,gif,png"},
                                        {title : "Zip files", extensions : "zip"}
                                ]
                        },

                        init: {
                                PostInit: function() {
                                        document.getElementById('filelist').innerHTML = '';

                                        document.getElementById('uploadfiles').onclick = function() {
                                                uploader.start();
                                                return false;
                                        };
                                },

                                FilesAdded: function(up, files) {
                                        plupload.each(files, function(file) {
                                                document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
                                        });
                                },

                                UploadProgress: function(up, file) {
                                        document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
                                },

                                Error: function(up, err) {
                                        document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
                                }
                        }
                });

                uploader.init();

                </script>
    </body>
    
</html>
<?php 
	}
function polizasxVencer(){
    $fecha_actual= date('Y-m-d');
                    $fecha_cinco=date('Y-m-d', strtotime('1 month'));
                    $sql = "SELECT c.cl_nombre,c.cl_apellido, u.USU_NOMBRE, u.USU_APELLIDO, u.USU_INICIAL, p.*, a.ase_descripcion, pla.pln_descripcion 
                            FROM `gbpoliza` p, `gbclientes` c, `gbaseguradora` a, `gbusuario` u, `gbplanes` pla 
                            WHERE c.cl_identificacion = p.cl_identificacion 
                            AND p.ase_codigo = a.ase_codigo 
                            AND p.pln_codigo = pla.pln_codigo 
                            AND u.USU_CODIGO = p.USU_CODIGO 
                            AND p.pol_renovacion BETWEEN '$fecha_actual'AND '$fecha_cinco'";
//                  echo $sql; exit;
                    $val = $dbmysql->query($sql);
 return $val;
}
?>