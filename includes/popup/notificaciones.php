
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
	color: #0cb114;
	top:0px;
	left: 190px;
	line-height: 15px;
	width: 360px;
        font-size: 0.7em;
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
     $valor_rol=array();
     $codigo_doc=$_GET['codigo'];
     $tipo_doc=$_GET['tipo'];
     $var=$_GET['variable'];
     $retval='<form id="form-1" action="?modulo=notificaciones&op=insertnotifi" method="post">
                <fieldset>
                    <legend>Notificaciones via Mail</legend>';
     if($tipo_doc != 'nuevo'){
            $retval .='<div id="cerrar_ventana"><a href="javascript:void(0);" title="Cerrar" onclick="popupCssHide();"><img src="images/001_05.gif"></a></div>';
            $sql="SELECT * FROM `dnk_notificacion_mail` WHERE `DNK_DOCUMENTO_codigo` ='$codigo_doc'";
            $rows = $dbmysql->query($sql);
            while ( $row=$rows->fetch_object() ){ 
                if($row->lugar_contacto=='I'){
                    $valor_rol[]=$row->rol_id;
                }else if($row->estado_contacto=='A'){
                    $valor_rol_c[]=$row->nombre_contacto;
                }
            }
     }
     
//     print_r($valor_rol_c);
        $sql_tramite="SELECT * FROM `dnk_documento` WHERE codigo = '$codigo_doc'";
        $rows_tramite = $dbmysql->query($sql_tramite);
        $row_tramite=$rows_tramite->fetch_object();
            
        $sql_1="SELECT con.*, c.nombre FROM `dnk_contactos` con, dnk_cliente c WHERE con.DNK_CLIENTE_id=c.id AND `DNK_CLIENTE_id` =$row_tramite->DNK_CLIENTE_id";
        $rows_1 = $dbmysql->query($sql_1);
        $row3=$rows_1->fetch_object();
//        echo $sql;
        $x=0;
    
    
            
            $retval .='<div id="css_codigo" align="center">
                        <li><a><input type="hidden" id="codigo"  name="codigo" value="'.$codigo_doc.'"/>'.$codigo_doc.'</a></li>
                    </div>
                    <ol>

                    <div>
                        <label class="rotulo"><strong> E-mails Clientes | <a style="color:red;font-size: 20px; margin-left: 50px;">'.$row3->nombre.'</a> </strong></label>
                    </div>    
                    </ol>

                    <div class="settings">';
                $sql="SELECT con.*, c.nombre FROM `dnk_contactos` con, dnk_cliente c WHERE con.DNK_CLIENTE_id=c.id AND `DNK_CLIENTE_id` =$row_tramite->DNK_CLIENTE_id";
                $rows = $dbmysql->query($sql);
                if($rows->num_rows!=0){
                       while ( $row=$rows->fetch_object() ){ 
                            if (in_array($row->contacto, $valor_rol_c)) {
                               $select='checked="checked"';
                            }else{$select='';}
                            $sql_rev="SELECT * FROM `dnk_notificacion_mail` WHERE `DNK_DOCUMENTO_codigo`='$codigo_doc' AND `nombre_contacto`='$row->contacto'";
                            $rows_rev = $dbmysql->query($sql_rev);
                            $row_rev=$rows_rev->fetch_object();
                            $mail_nuevo=($row_rev->email_contacto!='')?$row_rev->email_contacto:'';
                            $retval .=' <p>
                                            <input type="checkbox" value="1" id="check['.$x.']" name="check['.$x.']" '.$select.'/>
                                            <label class="check" for="'.$x.'"></label>
                                            <label class="info"><input type="hidden" id="nombre[]"  name="nombre[]" value="'.$row->contacto.'"/>'.$row->contacto.'</label>
                                            <label class="info2"><input type="text" id="email[]" name="email[]" value="'.$row->email.'"/>'.$mail_nuevo.'</label>
                                            <label class="info"><input type="hidden" id="tipo[]"  name="tipo[]" value="C"/></label>
                                        </p>';
                         $x++;
                         }
                }else{
                    
                    $sql_rev="SELECT * FROM `dnk_notificacion_mail` WHERE `DNK_DOCUMENTO_codigo`='$codigo_doc' AND `lugar_contacto`='C'";
                            $rows_rev = $dbmysql->query($sql_rev);
                            while ( $row_rev=$rows_rev->fetch_object() ){ 
                            $mail_nuevo=($row_rev->email_contacto!='')?$row_rev->email_contacto:'';
                            $retval .=' <p>
                                            <input type="checkbox" value="1" id="check" name="check" checked="checked"/>
                                            <label class="check" for="'.$x.'"></label>
                                            <label class="info1"><input type="hidden" id="nombre[]"  name="nombre[]" value="'.$row_rev->nombre_contacto.'"/>'.$row_rev->nombre_contacto.'</label>
                                            <label class="info2"><input type="text" id="email[]" name="email[]" value="'.$mail_nuevo.'"/>'.$mail_nuevo.'</label>
                                            <label class="info"><input type="hidden" id="tipo[]"  name="tipo[]" value="C"/></label>
                                        </p>';
                            }
                    $retval .=' <table width="60%" border="0">
                                    <tr>
                                      <td><input type="checkbox" value="1" id="check" name="check" checked="checked"/></td>
                                      <td><div style="font-size:9px;">Nombre del Cliente</div><input type="text" id="nombre[]"  name="nombre[]" value=""/></td>
                                      <td><div style="font-size:9px;">E-Mail del Cliente</div><input type="text" id="email[]" name="email[]" value=""/><input type="hidden" id="tipo[]"  name="tipo[]" value="C"/></td>
                                    </tr>
                                  </table>';
                }
            $retval .='</div>  
                    <ol>
                    <div>
                        <label class="rotulo"><strong> E-mails Internos Denkel</strong></label>
                    </div>    
                    </ol>
                    ';
            
                $sql1="SELECT * FROM `rol` WHERE rol_id > 2";
                $rows1 = $dbmysql->query($sql1);
                $x1=600;
           
        $retval .='<div class="settings">';

                    while ( $row1=$rows1->fetch_object() ){
                       
                            if (in_array($row1->rol_id, $valor_rol)) {
                               $select='checked="checked"';
                            }else{$select='';}
                            
                         
                      $retval .='<p>
                                    <input type="checkbox" value="1" id="mail_inter['.$x1.']" name="mail_inter['.$x1.']" '.$select.'/>
                                    <label class="check" for="'.$x1.'"></label>
                                    <label class="info">'.$row1->rol_desc.'</label>
                            </p>';
                    $x1++;
                    }
          $retval .='</div> 
                <ol class="buttons">
                    <li><input type="reset" class="button" value="Reset" /></li>
                    <li><input type="submit" class="button" value="Guardar" /></li>
                </ol>
            </fieldset>

            </form>';
            
       return $retval;
     }
?>
