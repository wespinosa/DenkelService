<?php

/*
 * CREADO POR: Willian Espinosa
 * FECHA CREACION: 06-05-2013
 * PARA EMPRESA: Glauben Group
 */
            include_once("database.inc.php");
            $dbmysql = new database();
            // FORMULARIO DE CREACION Y EDICION DE CLIENTES ///
            function frm_aseguradora($user){
		$retval = '';
                 global $dbmysql;
                if($user!=' '){
                     $url='?modulo=aseguradora&op=insaseguradora&cod='.$user;
                      $sql = "SELECT * FROM  `gbaseguradora` WHERE ASE_CODIGO='$user'";
                      $val = $dbmysql->query($sql);
                       while ($row = $val->fetch_object()){
                           $codigo=$row->ASE_CODIGO;
                           $nombre=$row->ASE_DESCRIPCION;
                       }
                       $desactiva='disabled="disabled';
                }else{
                $url='?modulo=aseguradora&op=insaseguradora&cod=""';
                $codigo=MaxCodigoAseg();
                }
		$_SESSION['guardar'] = 1;
		$retval .= '
		<form id="frmaseguradora" name="frmaseguradora" method="post" action="'.$url.'">
                    <table width="40%" height="193" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
			    <tr>
			      <td  colspan="2" bgcolor="#940007" style="font-size:18px; color:#FFF"><strong>&nbsp;&nbsp;Ingreso de Aseguradoras</strong></td>
			      <td width="9%" align="center" bgcolor="#940007" style="font-size:18px; color:#FFF"><a href="javascript:void(0);" onclick="popupCssShow(\'includes/popup/popup.php?page=Terminos&codigo='.$_POST['codigo'].'\', 460);return false"><img src="images/Table.png" width="27" height="26" alt="Planes" title="Planes"/></a></td>
                            </tr>
                            <tr>
                              <td width="34%">&nbsp;</td>
                              <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                              <td height="32"><strong>Codigo <a style="color:#F00">*</a>:</strong></td>
                              <td colspan="2"><input name="codigo" type="text" id="codigo" maxlength=13  value="'.$codigo.'" disabled="disabled"/>      </td>
                            </tr>
                            <tr>
                              <td height="31"><strong>Nombre <a style="color:#F00">*</a>: </strong></td>
                              <td colspan="2"><input name="nombre" type="text" id="nombre" value="'.$nombre.'"/></td>
                            </tr>
                            <tr>
                            <td colspan="5" align="center">
                              <input name="Reset" type="reset" id="Reset" value="Borrar" />
                              <input name="Submit" type="submit" onclick="MM_validateForm(\'codigo\',\'\',\'RisNum\',\'nombre\',\'\',\'R\');return document.MM_returnValue" value="Guardar" />
                            </tr>
			  </table>
                </form>';
                
		return $retval;
	}
            // CREA PLANES AL CREAR ASEGURADORA ///
            function crea_planes($codigo){
              $retval = '';
                 global $dbmysql;
                 $sql = "SELECT * FROM  `gbaseguradora` WHERE ASE_CODIGO='$codigo'";
                      $val = $dbmysql->query($sql);
                       while ($row = $val->fetch_object()){
                           $nombre=$row->ASE_DESCRIPCION;
                       }
		$_SESSION['guardar'] = 1;
		$retval .= '
		<table width="40%" height="125" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
			    <tr>
			      <td height="30"  colspan="3" bgcolor="#940007" style="font-size:18px; color:#FFF"><strong>&nbsp;&nbsp;Aseguradoras</strong></td>
  </tr>
                            <tr>
                              <td width="34%" height="17">&nbsp;</td>
                              <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                              <td height="32"><strong>Codigo <a style="color:#F00">*</a>:</strong></td>
                              <td colspan="2"><input name="codigo" type="text" id="codigo" maxlength=13  value="'.$codigo.'" disabled="disabled"/>      </td>
                            </tr>
                            <tr>
                              <td height="31"><strong>Nombre <a style="color:#F00">*</a>: </strong></td>
                              <td colspan="2"><input name="nombre" type="text" id="nombre" value="'.$nombre.'"/></td>
                            </tr>
                            
			  </table>
                        <table width="60%" height="26" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
                             <tr>
                                <td height="20"  colspan="3" bgcolor="#940007" style="font-size:18px; color:#FFF"><strong>&nbsp;&nbsp;Ingreso de Planes</strong></td>
                                <tr align="center">
                                <td><strong>Iniciales</strong></td>
                                <td><strong>Descripcion</strong></td>
                                <td><strong>Accion</strong></td>
                             </tr>
                            <tr align="center">
                                <td><input name="iniciales" type="text" id="iniciales" size="10" /></td>
                                <td><input name="iniciales" type="text" id="iniciales"/></td>
                                <td><img src="images/mas.png" width="15" height="15" /></td>
                             </tr>
                             <tr>
                                 <td colspan="3"><div id="ShowPlanes">
                                 </div></td>
                             </tr>
                          </tr>
                        </table>';

		return $retval;  
                
            }
            // FUNCION DE GUARDADO Y ACTUALIZACION DE CLIENTES ///
            function save_aseguradora($inicial){
		global $dbmysql;
             
                $msg = '';
                if($inicial==''){
		$sql = "INSERT INTO `gbaseguradora` (
                        `ASE_CODIGO` ,
                        `ASE_DESCRIPCION`
                        )
                VALUES (NULL, '{$_POST['nombre']}');";
             }else{
                $sql = "UPDATE `gbaseguradora` SET 
                        `ASE_DESCRIPCION` = '{$_POST['nombre']}'
                        WHERE `ASE_CODIGO` = '$inicial'";
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
        		La Aseguradora: {$_POST['descripcion']} Se Insertado Con Exito!!!</div> ";
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
            function frm_busaseguradora(){
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
            function frm_veraseguradora(){
                global $dbmysql;
                 $retval='';
                $sql = "SELECT * FROM `gbaseguradora`";
                $val = $dbmysql->query($sql);
                $retval='<table class="bordered" width="50%" border="0" cellpadding="0" cellspacing="1" style="font-size:11px">
                    <thead>
                          <tr>
                            <th colspan="10" bgcolor="#940007"  height="30" style="font-size:18px; color:#FFF">Listado de Aseguradoras</th>
                          </tr>
                          <tr align="center" bgcolor="#000000"  height="10" style="font-size:12px; color:#FFF">
                            <td width="30"><strong>Codigo</strong></td>
                            <td width="217"><strong>Descripcion</strong></td>
                            <td width="68" colspan="79" align="center"><strong>Accion</strong></td>
                          </tr>
                      </thead>';
                while ($row = $val->fetch_object()){
                    $estilo='style="border-right-color:#000; border-right-style:dotted; border-right-width:1px; border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"';
                    $estilo2='style="border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"';
                    
                       $retval .='<tr>
                                    <td '.$estilo.'>'.$row->ASE_CODIGO.'</td>
                                    <td '.$estilo.'>'.$row->ASE_DESCRIPCION.'</td>
                                    <td align="center" '.$estilo2.'>
                                    <a href="?modulo=aseguradora&op=editaseguradora&codigo='.$row->ASE_CODIGO.'" onclick=""><img src="images/edit.png"  width="20" height="20" border="0" align="absmiddle" alt="Editar" title="Editar" /></a>
                                    <a href="?modulo=aseguradora&op=eliminaaseguradora&codigo='.$row->ASE_CODIGO.'" onclick="javascript: if (confirm(\'Estas Seguro de Eliminar el Ramo??\')){return true;} else {return false;}"><img src="images/del.png"  width="20" height="20" border="0" align="absmiddle" alt="Eliminar" title="Eliminar" /></a>
                                    <a href="#" onclick="popupCssShow(\'includes/popup/popup.php?page=Terminos&codigo='.$row->ASE_CODIGO.'\', 460);return false"><img src="images/Table.png"  width="20" height="20" border="0" align="absmiddle" alt="Planes" title="Planes" /></a>
                                    </td>
                                    </tr>';
               }
                 $retval .='</table>';
                
               
                
                return $retval;;
            }
            // ELIMINAR CLIENTES ///
            function eliminar_aseguradora($codigo){
                global $dbmysql;
                $sql = "DELETE FROM `gbaseguradora` WHERE `ASE_CODIGO` = '$codigo'";
			$val = $dbmysql->query($sql);
                        //saveauditoria('','',$_SESSION["user_id"],'Guarda Cliente: '.$_POST['nombre']);
               if($val){
                        $_SESSION['guardar'] = 0;
        		$style = 'style="background-color:#0F0;font-size:9px; width:350px"';
        		$img = '<img src="images/Ok.png" border="0" width="30" height="30">';
                        $valor='aprovado';
        		$mensaje = "
        		La Aseguradora Se Eliminado Con Exito!!!</div> ";
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
            // BUSCAR MAXIMO CODIGO DE ASEGURADORA //
            function MaxCodigoAseg(){
                global $dbmysql;
                $cod=0;
                $sql = "SELECT MAX(ASE_CODIGO) as codigo FROM `gbaseguradora`";
			$val = $dbmysql->query($sql);
                        $row = $val->fetch_object();
                $cod=$row->codigo+1;
                return $cod;
            }
?>
