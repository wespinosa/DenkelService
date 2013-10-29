<?php session_start();
        include_once("../database.inc.php");
        include_once("../logica.inc.php");
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
    
echo formulario();


function formulario(){
    global $dbmysql;
     $codigo_doc=$_GET['codigo'];
     $codigo_solicitud=$_GET['solicitud'];
     $_SESSION['guardar_solicitud'] = 1;
     if($codigo_solicitud != ''){
         $codigo_solicitud=$_GET['solicitud'];
         $sql_2="SELECT * FROM `dnk_solicitud_egreso` WHERE `id_solicitud`='$codigo_solicitud'";
         $rows = $dbmysql->query($sql_2);
         $row = $rows->fetch_object();
         $url="?modulo=tramites&op=actualizarsolicitud&codigo=$row->id_solicitud&op=";
            $motivo=$row->motivo_solicitud;
            $anticipo=$row->anticipo_solicitud;
            $valortotal=$row->valtotal_solicitud;
            $banco=$row->banco_solicitud;
            $numcuenta=$row->numcuenta_solicitud;
            $beneficiario=$row->beneficiario_solicitud ;
            $cedula=$row->cedula_solicitud;
            $observacion=$row->observacion_solicitud; 
            $viapago=$row->viapago_solicitud;
            $tipocuenta=$row->tipocuenta_solicitud;
            $list_cuenta=array('0'=>'--- ESCOJA ---','A'=>'AHORROS','C'=>'CORRIENTE');
            $list_viapago=array('0'=>'--- ESCOJA ---','T'=>'TRANSFERENCIA','E'=>'EFECTIVO','C'=>'CHEQUE');
            $solo_lectura='readonly="readonly"';
            $desabilitar='disabled="disabled"';
            $noboton='hidden';
     }else{
         $codigo_solicitud=obtener_codigo_solicitud();
         $url="?modulo=tramites&op=insertsolicitud";
         $noboton='submit';
     }
     
     $date=date('Y-m-s');
     $sql_cliente="SELECT c.id as codigo_cliente,c.nombre,d.* FROM `dnk_documento` d, dnk_cliente c WHERE d.`DNK_CLIENTE_id`=c.id AND d.codigo='$codigo_doc'";
     $rows = $dbmysql->query($sql_cliente);
     $row = $rows->fetch_object();
     $retval='<form id="form-1" action="'.$url.'" method="post">
                <fieldset>
                    <legend>Gastos Generados del Tramite</legend>
                    <div id="cerrar_ventana"><a href="javascript:void(0);" title="Cerrar" onclick="popupCssHide();"><img src="images/001_05.gif"></a></div>';
            $retval .='<div id="css_codigo" align="center">
                        <li><a><input type="hidden" id="codigo_tramite"  name="codigo_tramite" value="'.$codigo_doc.'"/>'.$codigo_doc.'</a></li>
                    </div>
                    <ol>
                    <div>
                        <label class="rotulo"><strong> Solicitud de Egreso</label>
                    </div>    
                    </ol>

                    <div class="settings">
                            <table width="80%" border="0">
                                <tr>
                                  <td width="146"><strong>Solicitud No.:<u></u><u></u></strong></td>
                                  <td width="188"><input type="text" name="codigo_solicitud" id="codigo_solicitud" value="'.$codigo_solicitud.'" readonly="readonly"/></td>
                                  <td width="176"><input type="text" name="fecha_solicitud" id="fecha_solicitud" value="'.$date.'" readonly="readonly"/></td>
                                </tr>
                                <tr>
                                  <td><strong>Motivo:<u></u><u></u></strong></td>
                                  <td colspan="2"><input name="motivo_solicitud" type="text" id="motivo_solicitud" size="60" value="'.$motivo.'" '.$solo_lectura.' required onkeyup="javascript:this.value=this.value.toUpperCase();"/></td>
                                </tr>
                                <tr>
                                  <td><strong>Cliente:<u></u><u></u></strong></td>
                                  <td colspan="2"><input type="hidden" name="codigo_cliente" id="codigo_cliente" value="'.$row->codigo_cliente.'"/>'.$row->nombre.'</td>
                                </tr>
                                <tr>
                                  <td><strong>Codigo Tramite:<u></u><u></u></strong></td>
                                  <td>'.$codigo_doc.'</td>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td><strong>Anticipo:</strong></td>
                                  <td>$<input type="text" name="anticipo_solicitud" id="anticipo_solicitud" value="'.$anticipo.'" '.$solo_lectura.' /></td>
                                  <td><u></u><u></u></td>
                                </tr>
                                <tr>
                                  <td><strong>Valor Total:<u></u><u></u></strong></td>
                                  <td>$<input type="text" name="valtotal_solicitud" id="valtotal_solicitud" value="'.$valortotal.'" '.$solo_lectura.'/></td>
                                  <td></td>
                                </tr>
                                <tr>
                                  <td colspan="3"><div style="color:RED;font-size:11px">Favor tomar en cuenta el valor de la retención</div></td>
                                </tr>
                                <tr>
                                  <td colspan="3"><div style="border-color:#0F6; border-style:dotted; border-width:1px;">
                                    <table width="200" border="0">
                                      <tr>
                                        <td><strong>Via Pago:<u></u><u></u></strong></td>
                                        <td><select name="viapago_solicitud" id="viapago_solicitud" '.$desabilitar.' required>';
                                    if($viapago!=''){
                                                foreach ($list_viapago as $key=>$value){
                                                        $selected=($key==$viapago)?' selected="selected"':'';
                                                        $retval .= '<option value="'.$key.'"'.$selected.'>'.$value.'</option>';
                                                }
                                        }else{
                                          $retval .='<option value="0">--- ESCOJA ---</option>
                                                    <option value="T">TRANSFERENCIA</option>
                                                    <option value="E">EFECTIVO</option>
                                                    <option value="C">CHEQUE</option>';
                                        }
                                        $retval .='</select></td>
                                        <td><strong>Tipo Cuenta:<u></u></strong></td>
                                        <td><select name="tipocuenta_solicitud" id="tipocuenta_solicitud" '.$desabilitar.'>';
                                        if($tipocuenta!=''){
                                                foreach ($list_cuenta as $key=>$value){
                                                        $selected=($key==$tipocuenta)?' selected="selected"':'';
                                                        $retval .= '<option value="'.$key.'"'.$selected.'>'.$value.'</option>';
                                                }
                                        }else{
                                             $retval .='<option value="0">--- ESCOJA ---</option>
                                                        <option value="A">AHORROS</option>
                                                        <option value="C">CORRIENTE</option>';
                                        }
                              $retval .=' </select></td>
                                      </tr>
                                      <tr>
                                        <td><strong>Cuenta Nº:</strong></td>
                                        <td><input type="text" name="numerocuenta_solicitud" id="numerocuenta_solicitud" value="'.$numcuenta.'" '.$solo_lectura.'/></td>
                                        <td><strong>Banco</strong></td>
                                        <td><select name="banco_solicitud" id="banco_solicitud" '.$desabilitar.'>
                                        <option value="0">--- ESCOJA ---</option>
                                              '.banco($banco).'
                                        </select></td>
                                      </tr>
                                      <tr>
                                        <td><strong>Beneficiario:<u></u><u></u></strong></td>
                                        <td><input type="text" name="beneficiario_solicitud" id="beneficiario_solicitud" value="'.$beneficiario.'" '.$solo_lectura.'/></td>
                                        <td><strong>Cédula/Ruc:<u></u><u></u></strong></td>
                                        <td><input type="text" name="cedula_solicitud" id="cedula_solicitud" value="'.$cedula.'" '.$solo_lectura.'/></td>
                                      </tr>
                                    </table>
                                  </div></td>
                                </tr>
                                <tr>
                                  <td><strong>OBSERVACIONES:<u></u><u></u></strong></td>
                                  <td colspan="2"><textarea name="observacion_solicitud" id="observacion_solicitud" cols="45" rows="5" required>'.$observacion.'</textarea></td>
                                </tr>
                              </table>
                    </div>  
                    
                    ';
            
               
        $retval .='<ol class="buttons">';
                    //<li><input type="button" class="button" name="anular_solicitud" id="anular_solicitud" value="Anular Solicitud" onclick="javascript:anular_solicitud()" /></li>
       $retval .='<li><input type="'.$noboton.'" class="button" value="Guardar" /></li>
                </ol>
            </fieldset>

            </form>';
            
       return $retval;
     }
function obtener_codigo_solicitud(){
    global $dbmysql;
    $val=0;
    $sql_con="SELECT * FROM `dnk_usuario_solicitud` WHERE usu_codigo={$_SESSION["user_id"]}";
    $rows = $dbmysql->query($sql_con);
    
    if($rows->num_rows>0){
        $row= $rows->fetch_object();
        $val=$row->sol_secuencia+1;
    }else{
        $sql_ins="INSERT INTO `dnk_usuario_solicitud` (
                    `usu_codigo` ,
                    `sol_secuencia`
                    )
                    VALUES (
                    '{$_SESSION["user_id"]}', '1'
                    );";
           $rows = $dbmysql->query($sql_ins);
           $val=1;
    }
    return $val;
}
?>
