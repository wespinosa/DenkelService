
<?php

        include_once("../database.inc.php");
	$dbmysql = new database();
       


?>
<style type="text/css">

input:not([type=checkbox]), textarea {
	/*width: 250px;*/
	padding: 5px;
	border: 1px solid #ccc;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
}


form fieldset {
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
}

form ol {
	list-style: none;
	margin-bottom: 20px;
	border: 1px solid #b4b4b4;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	padding: 10px;
}

form ol, form legend, form fieldset {
	background-image: -moz-linear-gradient(top, #f7f7f7, #e5e5e5); /* FF3.6 */
	background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #e5e5e5),color-stop(1, #f7f7f7)); /* Saf4+, Chrome */
}

form ol.buttons {
	overflow: auto;
}

form ol li label {
	float: left;
	width: 160px;
	font-weight: bold;
	
}

.settings {
	width: 500px;
	list-style: none;
	position: relative;
}

.settings p {
	display: block;
	margin-bottom: 20px;
/*	background: -moz-linear-gradient(50% 50% 180deg,#C91A1A, #DB2E2E, #0C990C 0%); 
	background: -webkit-gradient(linear, 50% 50%, 0% 50%, from(#C90202), to(#009C05), color-stop(0,#00AB00));*/
	border-radius: 8px;
	-moz-border-radius: 6px;
/*	border: 1px solid #555555;*/
	width: 36px;
	position: relative;
	height: 15px;
}

label.info {
	position: absolute;
	color: #000;
	top:0px;
	left: 50px;
	line-height: 15px;
	width: 200px;
}

label.info2 {
	position: absolute;
	color: #34000;
	top:0px;
	left: 190px;
	line-height: 15px;
	width: 200px;
}
form ol.buttons li {
	float: left;
	width: 150px;
}

input[type=submit] {
	width: 80px;
	color: #f3f3f3;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	background-image: -moz-linear-gradient(top, #0cb114, #07580b); /* FF3.6 */
	background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #07580b),color-stop(1, #0cb114)); /* Saf4+, Chrome */
	-webkit-box-shadow: #4b4b4b 0px 2px 5px;
	-moz-box-shadow: #4e4e4e 0px 2px 5px;
	box-shadow: #e3e3e3 0px 2px 5px;
	border: none;
}
input[type=reset] {
	width: 80px;
	color: #f3f3f3;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	background-image: -moz-linear-gradient(top, #d01111, #7e0c0c); /* FF3.6 */
	background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #7e0c0c),color-stop(1, #d01111)); /* Saf4+, Chrome */
	-webkit-box-shadow: #4b4b4b 0px 2px 5px;
	-moz-box-shadow: #4e4e4e 0px 2px 5px;
	box-shadow: #e3e3e3 0px 2px 5px;
	border: none;

}

input[type=file] {
	width: 80px;
}

#css_codigo{
    color: #C90202;
    padding: 5px;
    margin: 5px;
    text-transform: uppercase;
    font-size: 25px;
}

#cerrar_ventana {
	text-align: right;
        margin-top: -52px;
        margin-right: -35px;
}
</style>

<?php
    
echo formulario_gasto();

function ingresar_gasto(){
    $retval='<ol>
                    <div>
                        <label class="rotulo"><strong> Ingresar Nuevo Gasto</label>
                    </div>    
                    </ol>

                    <div class="settings">
                    <table width="100%" border="0">
                        <tr>
                          <td style="border-right-style: dotted;border-right-width: 1px;"><div>
                            <p style="border:0;margin:0;padding:0;font-size:9px;width: 150px;"><strong>Descripción del Gasto</strong></p>
                            <input name="descripcion" id="descripcion" type="text" size="35" /></div></td></td>
                          <td style="border-right-style: dotted;border-right-width: 1px;"><div style="width:80px;">
                            <p style="border:0;margin:0;padding:0;font-size:9px;width: 100px;"><strong>Valor del Gasto<input name="valor" id="valor" type="text" value="0.00" size="8"  style="left:0;"/></strong></p></div></td>
                          <td><a href="#" onclick="xajax_xaumentarubro(\''.$codigo_doc.'\',document.getElementById(\'descripcion\').value,document.getElementById(\'valor\').value);return false;"><img src="images/mas.png" width="24" height="24" /></a></td>
                        </tr>
                      </table>
                    </div>  ';
    
    
    return $retval;
}
function formulario_gasto(){
    
    global $dbmysql;
     $codigo_doc=$_GET['codigo'];
     $tipo_doc=$_GET['tipo'];
     $var=$_GET['variable'];
     $subtotal=0;
     $total=0;
     $iva=0;
     $retval='<form id="form-1" action="?modulo=notificaciones&op=insertnotifi" method="post">
                <fieldset>
                    <legend>Gastos Generados del Tramite</legend>
                    <div id="cerrar_ventana"><a href="javascript:void(0);" title="Cerrar" onclick="popupCssHide();"><img src="images/001_05.gif"></a></div>';
            $retval .='<div id="css_codigo" align="center">
                        <li><a><input type="hidden" id="codigo"  name="codigo" value="'.$codigo_doc.'"/>'.$codigo_doc.'</a></li>
                    </div>
                    
                    <ol>
                    <div>
                        <label class="rotulo"><strong>Gastos Generados</strong></label>
                    </div>    
                    </ol>
                    ';
            
                $sql="SELECT *FROM `dnk_documento_gasto` WHERE DNK_DOCUMENTO_codigo='$codigo_doc'";
                $rows1 = $dbmysql->query($sql);
        $retval .='<div class="settings">
                        <table width="100%" border="1" style="border:dotted;border-color:#999; border-width:0.5px" align="center">
                            <tr align="center" >
                              <td style="border-bottom-style:dotted;border-bottom-width:0.5px; border-bottom-color:#999"><strong>Detalle</strong></td>
                              <td style="border-bottom-style:dotted;border-bottom-width:0.5px; border-bottom-color:#999"><strong>Fecha</strong></td>
                              <td style="border-bottom-style:dotted;border-bottom-width:0.5px; border-bottom-color:#999"><strong>Valor</strong></td>
                            </tr>
                            <tr style="font-size:12px;vertical-align: inherit;">
                                    <td colspan="3"><div id="mostrargastosgenerados">';

                    while ( $row1=$rows1->fetch_object() ){
                      $retval .='<table width="100%"  style="margin:0;padding:0;border-bottom-style:dotted;border-bottom-width:1px; border-bottom-color:#999">
                                    <tr>
                                      <td width="180">'.$row1->descripcion.'</td>
                                      <td width="113"><div align="center">'.$row1->fecha.'</div></td>
                                      <td width="80" align="center">$ '.$row1->valor.'</td>
                                    </tr>
                                  </table>
                                  ';
                      $subtotal=$subtotal+$row1->valor;
                    }
          $retval .='</div><div id="mostrargastos"></div>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td align="right">Sub-Total:</td>
                                    <td align="center" colspan="2">$ '.$subtotal.'</td>
                                 </tr>
                                </table></div> 
            </fieldset>

            </form>';
            
       return $retval;
     }
?>
