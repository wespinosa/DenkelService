<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>DENKEL S.A. :: Sistema de Tramites</title>
            <script type="text/javascript" src="js/jquery.js"></script>
            <script type="text/javascript" src="js/jquery-1.5.1.min.js"> </script>
            <script type="text/javascript" src="js/jquery-ui-1.8.11.custom.min.js"> </script>
<style>
    table { 
      background-color: white; 
      width: 100%; 
    }
    tr:nth-child(even){
    background: #FFFFFF;
    }
    tr:nth-child(odd){
        background: #FC44;
    }
    tbody tr { 
        background-color: #FA3; 
      } 
    tbody tr.impar { 
      background-color: #FC3; 
      color: white; 
    }
    tbody tr:hover { 
    background-color: lightblue; 
    color: #666666; 
  }
  .texto-gris{
    color: #881;
}
</style>
            
            
            
</head>

    <body>
        <label for="buscador">Buscar:</label> <input type="text" class="texto-gris" id="buscador" value="Agrega la palabra que deseas buscar"/>
        
        <table id="tablaLaWebera"> 
            <thead> 
              <tr> 
                <th>País</th> 
                <th>Capital</th> 
                <th>Moneda</th>
              </tr> 
            </thead> 
            <tbody> 
              <tr> 
                <td>México</td> 
                <td>Ciudad de México</td> 
                <td>Peso</td>
              </tr> 
              <tr> 
                <td>España</td> 
                <td>Madrid</td> 
                <td>Euro</td>
              </tr> 
              <tr> 
                <td>Venezuela</td> 
                <td>Caracas</td> 
                <td>Bolívar</td>
              </tr> 
              ... 
            </tbody> 
          </table>
    </body>
    <script>
                jQuery(document).ready(function(){
                    filas_cebra('tbody tr:odd', 'impar'); 
                  }); 
                  //función para aplicar la clase
                  function filas_cebra(selector, clase){ 
                    jQuery(selector).removeClass(clase).addClass(clase); 
                  }
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
                jQuery("#buscador").keyup(function(){
                    if( jQuery(this).val() != ""){
                        jQuery("#tablaLaWebera tbody>tr").hide();
                        jQuery("#tablaLaWebera td:contiene-palabra('" + jQuery(this).val() + "')").parent("tr").show();
                    }
                    else{
                        jQuery("#tablaLaWebera tbody>tr").show();
                    }
                });
                jQuery.extend(jQuery.expr[":"],
                {
                    "contiene-palabra": function(elem, i, match, array) {
                        return (elem.textContent || elem.innerText || jQuery(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                    }
                });
            </script>
</html>
