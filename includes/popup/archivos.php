<?php session_start();
        include_once("../database.inc.php");
        include_once("../logica.inc.php");
	$dbmysql = new database();
        
        echo formulario();
?>
<style type="text/css">

input:not([type=checkbox]), textarea {
	/*width: 250px;*/
	padding: 5px;
	border: 1px solid #ccc;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
}


div fieldset {
	padding: 26px;
	border: 1px solid #b4b4b4;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
        background: #fff;
}

div legend {
	padding: 5px 20px 5px 20px;
	color: #030303;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border: 1px solid #b4b4b4;
         background: #fff;
}

div ol {
	list-style: none;
	margin-bottom: 20px;
	border: 1px solid #b4b4b4;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	padding: 10px;
}

div ol, form legend, form fieldset {
	background-image: -moz-linear-gradient(top, #f7f7f7, #e5e5e5); /* FF3.6 */
	background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0, #e5e5e5),color-stop(1, #f7f7f7)); /* Saf4+, Chrome */
}

div ol.buttons {
	overflow: auto;
}

div ol li label {
	float: left;
	width: 160px;
	font-weight: bold;
	
}

.settings {
	width: 500px;
	list-style: none;
	position: relative;
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
.fondo_archivos{
    /*background: #ffffff;*/
}
</style>

<?php
function formulario(){
    global $dbmysql;
    $valor_combo=0;
    $desactivar='';
     $codigo_doc=$_GET['codigo'];
     $codigo_actividad=$_GET['actividad'];
     $codigo_proceso=$_GET['codigo_proceso'];
     if($codigo_actividad==33){
         $valor_combo=72;
         $desactivar='disabled="disabled"';
     }
     $date=date('Y-m-s');
     $sql_cliente="SELECT c.ruc,c.nombre,d.`DNK_CLIENTE_id`,d.`codigo` FROM `dnk_documento`d,  `dnk_cliente` c WhERE c.id=d.`DNK_CLIENTE_id` AND `codigo`='$codigo_doc'";
                $rows = $dbmysql->query($sql_cliente);
                $row = $rows->fetch_object();
                $cliente=$row->nombre;
     $retval='<div class="fondo_archivos"><fieldset>
                    <legend>Cargar Archivos de Respaldo</legend>
                    <div id="cerrar_ventana"><a href="javascript:void(0);" title="Cerrar" onclick="popupCssHide();"><img src="images/001_05.gif"></a></div>';
            $retval .='<div id="css_codigo" align="center">
                        <li><a><input type="hidden" id="codigo_tramite"  name="codigo_tramite" value="'.$codigo_doc.'"/>'.$codigo_doc.'</a></li>
                    </div>
                    <ol>
                    <div>
                        <label class="rotulo"><strong> Datos del archivo</label>
                    </div>    
                    </ol>
                    <div class="settings">
                    <form method="post" enctype="multipart/form-data"   action="upload_archivos.php" target="_self">
                         <table width="100%" border="0" style="border-color:#0F0; border-style:dotted; border-width:1px;">
                            <tr>
                              <td>Tipo Archivo:</td>
                              <td><select  name="tipo_archivo" id="tipo_archivo" >
                                <option value="0">--- Seleccione ---</option>
                                '.tpdoc_escaneado($valor_combo).'
                              </select></td>
                            </tr>
                            <tr>
                              <td>Nombre Archivo:</td>
                              <td><input type="text" name="nombre" id="nombre" required/></td>
                            </tr>
                            <tr>
                              <td>Cliente:</td>
                              <td><input type="text" name="cliente" id="cliente" disabled="disabled" value="'.$cliente.'"/></td>
                            </tr>
                          </table>
                                <ol>
                                    <div>
                                        <label class="rotulo"><strong>Selecciona el archivo a Cargar...</label>
                                    </div>    
                                </ol>
                                 <input type="hidden" name="codigo" id="codigo" value="'.$codigo_doc.'"/>
                                 <input type="hidden" name="actividad" id="actividad" value="'.$codigo_actividad.'"/>
                                 <input type="hidden" name="codigo_proceso" id="codigo_proceso" value="'.$codigo_proceso.'"/>
                                 <input type="hidden" name="MAX_FILE_SIZE" value="100000" />
                                 <input type="file" name="archivos[]" id="archivos[]" multiple/>
                                 <input type="submit" name="btn" id="btn" value="Subir Archivo!"/>
                        </form>
                    </div>  
               </fieldset><div>';
            
       return $retval;
     }
     
     
?>
