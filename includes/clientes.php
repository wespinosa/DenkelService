<?php

/*
 * CREADO POR: Willian Espinosa
 * FECHA CREACION: 06-05-2013
 * PARA EMPRESA: Glauben Group
 */
            include_once("database.inc.php");
            $dbmysql = new database();
            // FORMULARIO DE CREACION Y EDICION DE CLIENTES ///
            function frm_cliente($user){
		$retval = '';
                 global $dbmysql;
                if($user!=' '){
                     $url='?modulo=clientes&op=inscliente&cod='.$user;
                      $sql = "SELECT * FROM  `dnk_cliente` WHERE id=$user";
                      $val = $dbmysql->query($sql);
                       while ($row = $val->fetch_object()){
                           $codigo=$row->id;
                           $nombre=$row->nombre;
                           $cedula=$row->ruc;
                           $telefono=$row->telefono;
                           $direccion=$row->direccion;
                           $tipo=$row->id_tipo_cliente;
                           
                        
                       }
                }else{
                $url='?modulo=clientes&op=inscliente&cod=""';
                }
		$_SESSION['guardar'] = 1;
                $tipo_cliente= array('1'=>'Estatal','2'=>'Privado');
		$retval .= '
		<form id="frmcliente" name="frmcliente" method="post" action="'.$url.'">
			  <table  width="60%" height="344" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
                            <tr>
			      <td colspan="4" bgcolor="#940007" style="font-size:18px; color:#FFF"><strong>&nbsp;Edición Clientes</strong></td>
                            </tr>
			    <tr>
			      <td width="20%">&nbsp;</td>
			      <td width="38%">&nbsp;</td>
			      
			    </tr>
                            <tr>
			      <td><strong>Tipo de Cliente <a style="color:#F00">*</a>: </strong></td>
			      <td><select name="tipocliente" size="1" id="tipocliente" class="servicio">
                                    <option value="0">-- Seleccione uno --</option>';
               
                    
               
                       $op1 .= '<option value="1" selected="selected">Estatal</option><option value="2">Privado</option>';
                       $op2 .= '<option value="1" >Estatal</option><option value="2" selected="selected">Privado</option>';
                       $select=($tipo==1)?$op1:$op2;
                        $retval .= $select.'</select></td>
			   </tr>
			    <tr>
			      <td><strong>Cedula/Ruc <a style="color:#F00">*</a>:</strong></td>
			      <td>
			        <input name="cedula" type="text" id="cedula" maxlength=13 onblur="validarDocumento()" value="'.$cedula.'"/>      </td>
			
		        </tr>
			    <tr>
			      <td><strong>Nombres <a style="color:#F00">*</a>: </strong></td>
			      <td><input name="nombre" type="text" id="nombre" value="'.$nombre.'"/></td>
		        </tr>
                 <tr>
			      <td><strong>Telefono <a style="color:#F00">*</a>: </strong></td>
			      <td><input name="telefono" type="text" id="telefono" value="'.$telefono.'"/></td>
		        </tr>
			    
			   <tr>
               		<td colspan="2"><div style="border: dotted #00FF00 1px;">
                    <table width="100%" border="0">
                        <tr>
                          <td width="30%" align="center"><div><strong>Contacto</strong></div></td>
                          <td width="26%" align="center"><div><strong>Celular</strong></div></td>
                          <td width="32%" align="center"><div><strong>E-Mail</strong></div></td>
                          <td width="12%" align="center"><div><strong>Op</strong></div></td>
                        </tr>
                        <tr>
                          <td colspan="4"><div id="vercontactos"><table width="100%" >';
            $sql_con = "SELECT * FROM  `dnk_contactos` WHERE DNK_CLIENTE_id=$user";
                      $val_con = $dbmysql->query($sql_con);
                       while ($row_con = $val_con->fetch_object()){            
                            $retval .= '<tr align="center">
                                        <td width="30%"><div style="border-bottom:dotted #666 1px">'.$row_con->contacto.'</div></td>
                                        <td width="30%"><div style="border-bottom:dotted #666 1px">'.$row_con->celular.'</div></td>
                                        <td width="29%"><div style="border-bottom:dotted #666 1px">'.$row_con->email.'</div></td>
                                        <td width="11%"><a><img src="images/menos.png" width="20" height="20" /></a></td>
                                      </tr>';
                       }    
            $retval .= '</table></div></td>
                        </tr>
                      <tr>
                        <td><input type="text" name="nombrec" id="nombrec" /></td>
                        <td><input type="text" name="celularc" id="celularc" /></td>
                        <td><input type="text" name="emailc" id="emailc" /></td>
                        <td><a href="#" onclick="xajax_xagregacontactos(\''.$codigo.'\');return false;"><img src="images/mas.png" width="20" height="20" /></a></td>
                      </tr>
                    </table>

                    
                 </div></td>
               </tr>
			   <tr>
                   <td height="57"><strong>Direccion : </strong></td>
                                  <td><textarea name="direccion" id="direccion" cols="30" rows="3">'.$direccion.'</textarea></td>      
                        </tr>
                        
			    <tr>
			      <td colspan="4" align="center">
			        <input name="Reset" type="reset" id="Reset" value="Borrar" />
			        <input name="Submit" type="submit" onclick="MM_validateForm(\'cedula\',\'\',\'RisNum\',\'nombre\',\'\',\'R\',\'telefono\',\'\',\'R\',\'email\',\'\',\'RisEmail\',\'contacto\',\'\',\'R\',\'direccion\',\'\',\'R\');return document.MM_returnValue" value="Guardar" />
		        </tr>
			  </table>
</form>	
					
		';
		return $retval;
	}
            // FUNCION DE GUARDADO Y ACTUALIZACION DE CLIENTES ///
            function save_cliente($user){
		global $dbmysql;
             
                $msg = '';
                if($user==''){
		$sql = "INSERT INTO `gbclientes` (
                        `CL_IDENTIFICACION` ,
                        `CL_ASEGURADO` ,
                        `CL_TELEFONO` ,
                        `CL_DIRECCION` ,
                        `CL_MAIL` ,
                        `CL_CONTACTO` ,
                        `CL_FECHANACIMIENTO`
                        )
                VALUES (
                '{$_POST['cedula']}', '{$_POST['nombre']}', '{$_POST['telefono']}', '{$_POST['direccion']}', '{$_POST['email']}', '{$_POST['contacto']}', '{$_POST['fechanacimiento']}');";
             }else{
                $sql = "UPDATE `gbclientes` SET 
                        `CL_ASEGURADO` = '{$_POST['nombre']}',
                        `CL_IDENTIFICACION` = '{$_POST['cedula']}',
                        `CL_DIRECCION` = '{$_POST['direccion']}',
                        `CL_TELEFONO` = '{$_POST['telefono']}',
                        `CL_CONTACTO` = '{$_POST['contacto']}',
                        `CL_MAIL` = '{$_POST['email']}',
                        `CL_FECHANACIMIENTO` = '{$_POST['fechanacimiento']}' WHERE `gbclientes`.`CL_IDENTIFICACION` =$user";
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
        		El Cliente {$_POST['nombre']} {$_POST['apellido']} Se Insertado Con Exito!!!</div> ";
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
            function frm_buscliente(){
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
            function frm_verclientes(){
                global $dbmysql;
                 $retval='';
                $sql = "SELECT * FROM  `dnk_cliente` ORDER BY id DESC";
                $val = $dbmysql->query($sql);
                $retval .='<div id="dialog-form" title="Create new user">
                                <p class="validateTips">Todos los campos con * son requeridos</p>
                        <form id="frmcliente" name="frmcliente" method="post" action="'.$url.'">
                                <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="3">
                                <tr>
                                    <td><strong>Tipo Cliente <a style="color:#F00">*</a>:</strong></td>
                                    <td><select name="tipocliente" size="1" id="tipocliente" class="servicio">
                                    <option value="0">-- Seleccione uno --</option>
                                    <option value="1">Estatal</option>
                                    <option value="2">Privado</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td><strong>Cedula/Ruc <a style="color:#F00">*</a>:</strong></td>
                                    <td><input name="cedula" type="text" id="cedula" maxlength=13 onblur="validarDocumento()"/></td>
                                </tr>
                                <tr>
                                    <td><strong>Nombre <a style="color:#F00">*</a>: </strong></td>
                                    <td><input name="nombre" type="text" id="nombre" /></td>
                                </tr>
                                <tr>
                                    <td><strong>Telefono <a style="color:#F00">*</a>: </strong></td>
                                    <td><input name="telefono" type="text" id="telefono"/></td>
                                </tr>
                                
                                <tr>
                                    <td><strong>Contacto: </strong></td>
                                    <td><input name="contacto" type="text" id="contacto"/></td>
                                </tr>
                                <tr>
                                    <td><strong>Telefono: </strong></td>
                                    <td><input name="telefonoc" type="text" id="telefonoc"/></td>
                                </tr>
                                <tr>
                                    <td><strong>E-Mail: </strong></td>
                                    <td><input name="emailc" type="text" id="emailc"/></td>
                                </tr>
                                
                                <tr>
                                    <td><strong>Direccion : </strong></td>
                                    <td><textarea name="direccion" id="direccion" cols="30" rows="3"></textarea></td>      
                                </tr>
                            </table>
                            <p>&nbsp;</p>
                </form></div>';
                $retval1 .='<div id="dialog-form" title="Create new user">
                                <p class="validateTips">All form fields are required.</p>

                                <form>
                                <fieldset>
                                  <label for="name">Name</label>
                                  <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
                                  <label for="name">Name</label>
                                  <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
                                  <label for="email">Email</label>
                                  <input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />
                                  <label for="password">Password</label>
                                  <input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" />
                                </fieldset>
                                </form>
                              </div>';
                
                $retval .='<div id="container_two">
                            <table width="100%" border="0" cellpadding="0" cellspacing="3" style="font-size:11px">
                                <tr>
                                    <th colspan="12" bgcolor="#940007"  height="30" style="font-size:18px; color:#FFF">Clientes Glauben</th>
                                </tr>
                                <tr>
                                    <td>
                                        <div>Busqueda:</div>
                                        <div><input name="buscar_cliente" type="text" /><input name="buscar" type="button" value="Buscar" /></div>
                                        <div><button id="create-user">+ Nuevo</button></div>      
                                    </td>
                                </tr>
                            </table>  
                        <table class="bordered" width="100%" border="0" cellpadding="0" cellspacing="3" style="font-size:11px">
                          <thead>
                           <tr align="center" bgcolor="#000000"  height="10" style="font-size:12px; color:#FFF">
                           <th width="57"><strong>Código</strong></th>
                            <th width="57"><strong>Identificación</strong></th>
                            <th width="60"><strong>Nombre Cliente</strong></th>
                            <th width="57"><strong>Telefono</strong></th>
                            <th width="56"><strong>Tipo Cliente</strong></th>
                            <th><strong>Accion</strong></th>
                          </tr>
                          </thead>';
                         
                while ($row = $val->fetch_object()){
                    $estilo='style="border-right-color:#000; border-right-style:dotted; border-right-width:1px; border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"';
                    $estilo2='style="border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"';
                    $tipocliente=($row->id_tipo_cliente==1)?'Estatal':'Privado';
                       $retval .='<tr>
                                    <td '.$estilo.'>'.$row->id.'</td>
                                    <td '.$estilo.'>'.$row->ruc.'</td>
                                    <td '.$estilo.'>'.$row->nombre.'</td>
                                    <td '.$estilo.'>'.$row->telefono.'</td>
                                    <td '.$estilo.'>'.$tipocliente.'</td>
                                    <td '.$estilo2.' width="40" align="center"><div>
                                        <a href="?modulo=clientes&op=editcliente&codigo='.$row->id.'" onclick=""><img src="images/edit.png"  width="20" height="20" border="0" align="absmiddle" alt="Editar" title="Editar" /></a>
                                        <a href="?modulo=clientes&op=eliminacliente&codigo='.$row->id.'" onclick="javascript: if (confirm(\'Estas Seguro de Eliminar al Cliente??\')){return true;} else {return false;}"><img src="images/del.png"  width="20" height="20" border="0" align="absmiddle" alt="Eliminar" title="Eliminar" /></a></div></td>
                                  </tr>';
               }
                 $retval .='</table></div>';
                
               
                
                return $retval;;
            }
            // ELIMINAR CLIENTES ///
            function eliminar_clientes($codigo){
                global $dbmysql;
                $sql = "DELETE FROM `gbclientes` WHERE `CL_IDENTIFICACION` = '$codigo'";
			$val = $dbmysql->query($sql);
                        //saveauditoria('','',$_SESSION["user_id"],'Guarda Cliente: '.$_POST['nombre']);
               if($val){
                        $_SESSION['guardar'] = 0;
        		$style = 'style="background-color:#0F0;font-size:9px; width:350px"';
        		$img = '<img src="images/Ok.png" border="0" width="30" height="30">';
                        $valor='aprovado';
        		$mensaje = "
        		El Cliente Se Eliminado Con Exito!!!</div> ";
        	}
        	else{
        		$style = 'style="background-color:#FF0F0F;font-size:9px; width:350px"';
        		$img = '<img src="images/advertenvia.png" border="0" width="30" height="30">';
                        $valor='error';
        		$mensaje = '
        		Existe Algun Error... No se Elimino el Cliente..';
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
