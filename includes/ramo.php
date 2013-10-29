<?php

/*
 * CREADO POR: Willian Espinosa
 * FECHA CREACION: 06-05-2013
 * PARA EMPRESA: Glauben Group
 */
            include_once("database.inc.php");
            $dbmysql = new database();
            // FORMULARIO DE CREACION Y EDICION DE CLIENTES ///
            function frm_ramo($user){
		$retval = '';
                 global $dbmysql;
                if($user!=' '){
                     $url='?modulo=ramos&op=insramo&cod='.$user;
                      $sql = "SELECT * FROM  `gbramo` WHERE RMO_INICIAL='$user'";
                      $val = $dbmysql->query($sql);
                       while ($row = $val->fetch_object()){
                           $inicial=$row->RMO_INICIAL;
                           $descripcion=$row->RMO_DESCRIPCION;
                       }
                }else{
                $url='?modulo=ramos&op=insramo&cod=""';
                }
		$_SESSION['guardar'] = 1;
		$retval .= '
		<form id="frmramo" name="frmramo" method="post" action="'.$url.'">
			  <table width="100%" height="344" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
			    <tr>
			      <td colspan="2" bgcolor="#940007" style="font-size:18px; color:#FFF"><strong>&nbsp;&nbsp;Ingreso de Ramos</strong></td>
                            </tr>
                            <tr>
                              <td width="20%">&nbsp;</td>
                              <td width="38%">&nbsp;</td>
                            </tr>
                            <tr>
                              <td><strong>Iniciales <a style="color:#F00">*</a>:</strong></td>
                              <td><input name="inicial" type="text" id="inicial" maxlength=13  value="'.$inicial.'"/>      </td>
                            </tr>
                            <tr>
                              <td><strong>Descripcion <a style="color:#F00">*</a>: </strong></td>
                              <td><input name="descripcion" type="text" id="descripcion" value="'.$descripcion.'"/></td>
                            </tr>
                            <tr>
                            <td colspan="4" align="center">
                              <input name="Reset" type="reset" id="Reset" value="Borrar" />
                              <input name="Submit" type="submit" onclick="MM_validateForm(\'descripcion\',\'\',\'R\',\'inicial\',\'\',\'R\');return document.MM_returnValue" value="Guardar" />
                            </tr>
			  </table>
                </form>';
                
		return $retval;
	}
            // FUNCION DE GUARDADO Y ACTUALIZACION DE CLIENTES ///
            function save_ramo($inicial){
		global $dbmysql;
             
                $msg = '';
                if($user==''){
		$sql = "INSERT INTO `gbramo` (
                        `RMO_INICIAL` ,
                        `RMO_DESCRIPCION`
                        )
                VALUES ('{$_POST['inicial']}', '{$_POST['descripcion']}');";
             }else{
                $sql = "UPDATE `gbramo` SET 
                        `RMO_INICIAL` = '{$_POST['inicial']}',
                        `RMO_DESCRIPCION` = '{$_POST['descripcion']}'
                        WHERE `RMO_INICIAL` = '$inicial'";
            }
                //echo $sql; exit;
		if ( $_SESSION['guardar'] == 1 ){
			$val = $dbmysql->query($sql);
                        //saveauditoria('','',$_SESSION["user_id"],'Guarda Cliente: '.$_POST['nombre']);
                }
		 if($val){
                        $_SESSION['guardar'] = 0;
        		$style = 'style="background-color:#0F0;font-size:9px; width:350px"';
        		$img = '<img src="images/Ok.png" border="0" width="30" height="30">';
                        $valor='aprovado';
        		$mensaje = "
        		El Ramo {$_POST['descripcion']} Se Insertado Con Exito!!!</div> ";
        	}
        	else{
        		$style = 'style="background-color:#FF0F0F;font-size:9px; width:350px"';
        		$img = '<img src="images/advertenvia.png" border="0" width="30" height="30">';
                        $valor='error';
        		$mensaje = '
        		Existe Algun Error... No se Realizo la Insercion..';
        	} 
          $resultado = '<div '.$style.' class="'.$valor.' mensajes" align="center">
                            <table cellpadding="4" cellspacing="0" border="0" style="font-size:16px">
                                <tr >
                                    <td colspan="2" align="center">'.$img.''.$mensaje.'<br /></td>
                                </tr>
                            </table>
			</div><br /><br />';
          
          return  $resultado;
	}
            // FUNCION DE BUSQUEDA DE CLIENTES ///
            function frm_busramo(){
                $retval='';
                $retval='<table width="70%" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
                          <tr>
                            <th colspan="5" bgcolor="#940007"  height="30" style="font-size:18px; color:#FFF">Buscar Clientes</th>
                          </tr>
                          <tr>
                            <td width="149"><img src="images/buscar.png"  width="80" height="80"  align="absmiddle"/></td>
                            <td width="149"><strong>Nombre / Apellido: </strong></td>
                            <td width="311"><input name="buscar_cliente" type="text" id="buscar_cliente" size="40" /></td>
                            <td width="149"><strong>Cedula / Ruc: </strong></td>
                            <td width="311"><input name="buscar_cliente_cedula" type="text" id="buscar_cliente_cedula" size="15" /></td>
                          </tr>
                          <tr>
                            <td colspan="5" align="center"><div id="vercliente"></div></td>
                          </tr>
                        </table>';
                
                return $retval;
            }
            // VER TODOS LOS CLIENTES DE LA BASE DE DATOS ///
            function frm_verramos(){
                global $dbmysql;
                 $retval='';
                $sql = "SELECT * FROM `gbramo`";
                $val = $dbmysql->query($sql);
                $retval='<table width="470" border="0" cellpadding="0" cellspacing="1" style="font-size:11px">
                          <tr>
                            <th colspan="11" bgcolor="#940007"  height="30" style="font-size:18px; color:#FFF">Listado de Ramos</th>
                          </tr>
                          <tr align="center" bgcolor="#000000"  height="10" style="font-size:12px; color:#FFF">
                            <td width="57"><strong>Iniales</strong></td>
                            <td width="600"><strong>Descripcion</strong></td>
                            <td colspan="80"><strong>Accion</strong></td>
                          </tr>';
                while ($row = $val->fetch_object()){
                    $estilo='style="border-right-color:#000; border-right-style:dotted; border-right-width:1px; border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"';
                    $estilo2='style="border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"';
                    
                       $retval .='<tr>
                                    <td '.$estilo.'>'.$row->RMO_INICIAL.'</td>
                                    <td '.$estilo.'>'.$row->RMO_DESCRIPCION.'</td>
                                    <td '.$estilo2.' width="40" align="center"><a href="?modulo=ramos&op=editramo&codigo='.$row->RMO_INICIAL.'" onclick=""><img src="images/edit.png"  width="20" height="20" border="0" align="absmiddle" alt="Editar" title="Editar" /></a></td>
                                    <td '.$estilo.' width="40" align="center"><a href="?modulo=ramos&op=eliminaramo&codigo='.$row->RMO_INICIAL.'" onclick="javascript: if (confirm(\'Estas Seguro de Eliminar el Ramo??\')){return true;} else {return false;}"><img src="images/del.png"  width="20" height="20" border="0" align="absmiddle" alt="Eliminar" title="Eliminar" /></a></td>
                                  </tr>';
               }
                 $retval .='</table>';
                
               
                
                return $retval;;
            }
            // ELIMINAR CLIENTES ///
            function eliminar_ramo($codigo){
                global $dbmysql;
                $sql = "DELETE FROM `gbramo` WHERE `RMO_INICIAL` = '$codigo'";
			$val = $dbmysql->query($sql);
                        //saveauditoria('','',$_SESSION["user_id"],'Guarda Cliente: '.$_POST['nombre']);
               if($val){
                        $_SESSION['guardar'] = 0;
        		$style = 'style="background-color:#0F0;font-size:9px; width:350px"';
        		$img = '<img src="images/Ok.png" border="0" width="30" height="30">';
                        $valor='aprovado';
        		$mensaje = "
        		El Ramo Se Eliminado Con Exito!!!</div> ";
        	}
        	else{
        		$style = 'style="background-color:#FF0F0F;font-size:9px; width:350px"';
        		$img = '<img src="images/advertenvia.png" border="0" width="30" height="30">';
                        $valor='error';
        		$mensaje = '
        		Existe Algun Error... No se Elimino el Ramo..';
        	} 
          $resultado = '<div '.$style.' class="'.$valor.' mensajes" align="center">
                            <table cellpadding="4" cellspacing="0" border="0" style="font-size:16px">
                                <tr >
                                    <td colspan="2" align="center">'.$img.''.$mensaje.'<br /></td>
                                </tr>
                            </table>
			</div><br /><br />';
          
          return  $resultado;
                
            }
            
?>
