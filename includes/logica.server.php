<?php
session_start();
	include_once("logica.inc.php");
        include_once("database.inc.php");
	$dbmysql = new database();
        date_default_timezone_set('America/Bogota');
        
//clientes
function xverclave($a1,$b1){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
    $msg='';
	if ($a1!=$b1) {
		$retval = '';
		$msg='No Coninciden';
	}
	else
		$retval=$b1;
	if ($msg=='No Coninciden') {
			$objResponse->alert($msg);
	}

	$objResponse->assign("verclave", "value", $retval);
	return $objResponse;
	
}
function xcliente($x){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
    $j = $x+1;
    
	$retval = '<strong>'.$j .': Nombre: </strong><input type="text" name="nombre_con[]" /> <strong>E-Mail: </strong><input type="text" name="mail_con[]" />  
                                    <strong>Celular: </strong>
                                    <input name="celular_con[]" type="text" size="10" maxlength="10" />';
    if ( $j <= 8 )
      $retval .= ' <img src="images/icon-add.png" width="16" height="16" border="0" onclick="xajax_xcliente('.$j.');return false"/>';
	$objResponse->assign("clienteview".$j, "innerHTML", $retval);
	return $objResponse;
} 
function xconfiguraciones(){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
        $retval = configuracion();
	$objResponse->assign("content_derecho", "innerHTML", $retval);
	return $objResponse;
} 
function xnotificar($proceso,$codigo_tramite,$actividad){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
        grabanotificacion($proceso,$codigo_tramite,$actividad);
        $retval = '<img src="images/001_06.gif" width="20" height="20" border="0" alt="Notificado" title="Notificado"/>';
	$objResponse->assign("viewnotifica".$proceso, "innerHTML", $retval);
	return $objResponse;
} 
function xsubirarchivos($codigo_doc){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
        global $dbmysql;
        $sql_cliente="SELECT c.ruc,c.nombre,d.`DNK_CLIENTE_id`,d.`codigo` FROM `dnk_documento`d,  `dnk_cliente` c WhERE c.id=d.`DNK_CLIENTE_id` AND `codigo`='$codigo_doc'";
                $rows = $dbmysql->query($sql_cliente);
                $row = $rows->fetch_object();
                $cliente=$row->nombre;
	$retval .= '<div class="regresar_file"><a href="#" onclick="xajax_xconfiguraciones(1);return false;"><img src="images/atras.png" width="40" height="40"></a></div>
                        <div id="content_file">
                        <div class="title_file">
                        <h2 style="background:#940007;font-size:18px; color:#FFF; padding:10px ">Archivos del Tramite: '.$codigo_doc.'</h2>
                        </div>
                        <form method="post" enctype="multipart/form-data"   action="upload_archivos.php" target="ventana">
                        <table width="100%" border="0" style="border-color:#0F0; border-style:dotted; border-width:1px;">
                            <tr>
                              <td>Actividad:</td>
                              <td><select  name="actividad" id="actividad" >
                                <option value="0">--- Seleccione ---</option>
                                '.actividades().'
                              </select></td>
                            </tr>
                            <tr>
                              <td>Tipo Archivo:</td>
                              <td><select  name="tipo_archivo" id="tipo_archivo" >
                                <option value="0">--- Seleccione ---</option>
                                '.tpdoc_escaneado($valor_combo=0).'
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
                        <p class="title_file">Selecciona los archivos a Cargar...</p>
                        <div id="ver_subidos">
                            
                        </div>
                                <input type="hidden" name="codigo" id="codigo" value="'.$codigo_doc.'"/>
                                 <input type="hidden" name="MAX_FILE_SIZE" value="100000" />
                                 <input type="file" name="archivos[]" id="archivos[]" multiple/>
                                 <input type="submit" name="btn" id="btn" value="Subir Archivo!"/>
                        </form>
                        <div id="consulta_file">';
                 
        $sql="SELECT tpd.tipo_doc_desc,d.* FROM `dnk_doc_escaneados` d, `dnk_tpdoc_escaneado` tpd WHERE d.DNK_TPDOC_ESCANEADOS_id=tpd.tipo_doc_id AND DNK_DOCUMENTO_codigo='$codigo_doc'";
        $rows = $dbmysql->query($sql);
     if($rows->num_rows>0){
	$retval .='<table class="demoTable" border="0">
                   <caption>LISTA DE ARCHIVOS</caption>
		     <tr style="background: #940007; color: #fff">
			<th width="70" align="center">Vista</th>
			<th width="120">Descripcion</th>
			<th align="center">Opciones</th>
		     </tr>';
			while($row= $rows->fetch_object()){
                            $retval .='<tr>';
                            
					switch ($row->extencion) {
						case 'pdf':
								$retval .='<td><a target="_Blank" href="uploads/'.$row->DNK_DOCUMENTO_codigo.'/'.$row->nombre_almacenado.'"><img src="images/archivos/pdf.png" width="40" height="40"></a></td>';
							break;
						case 'docx':
								$retval .='<td><a target="_Blank" href="uploads/'.$row->DNK_DOCUMENTO_codigo.'/'.$row->nombre_almacenado.'"><img src="images/archivos/doc.png" width="40" height="40"></a></td>';
							break;
						case 'xlsx':
								$retval .='<td><a target="_Blank" href="uploads/'.$row->DNK_DOCUMENTO_codigo.'/'.$row->nombre_almacenado.'"><img src="images/archivos/xls.png" width="40" height="40"></a></td>';
							break;
						case 'html':
								$retval .='<td><a target="_Blank" href="uploads/'.$row->DNK_DOCUMENTO_codigo.'/'.$row->nombre_almacenado.'"><img src="images/archivos/html.png" width="40" height="40"></a></td>';
							break;
						case 'txt':
								$retval .='<td><a target="_Blank" href="uploads/'.$row->DNK_DOCUMENTO_codigo.'/'.$row->nombre_almacenado.'"><img src="images/archivos/txt.png" width="40" height="40"></a></td>';
							break;
						case 'zip':
								$retval .='<td><a target="_Blank" href="uploads/'.$row->DNK_DOCUMENTO_codigo.'/'.$row->nombre_almacenado.'"><img src="images/archivos/zip.png" width="40" height="40"></a></td>';
							break;
								
						default:
								$retval .='<td><a target="_Blank" href="'.$row->path.'"><img src="'.$row->path.'" width="40" height="40"></a></td>';
							break;
					}
				$retval .='<td>'.$row->tipo_doc_desc.'</td><td width="20" align="center"><a href="libs/borrar_archivo.php?id='.$row->path.'"><img title="Borrar" src="images/delete.png"></a></td>
                                    </tr>';
			}
	$retval .='</table>';
}else{
	$retval .='<div id="mensajevacio" align="center">No hay archivos por el momento</div>';
}
             $retval .= '</div>
                    </div>';
      
	$objResponse->assign("contenerdor_derecho", "innerHTML", $retval);
	return $objResponse;
}
//Procesos
   function xmuestraconfiguracion($x){
       date_default_timezone_set('America/Bogota');
       $objResponse = new xajaxResponse();
        $retval='<div>
                <table width="343" border="0">
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="3" align="center" bgcolor="#940007"  height="15" style="font-size:18px; color:#FFF; padding:10px ">Configuración Tramite: <strong>'.$x.'</strong></td>
                    </tr>
                    <tr>
                      <td width="84"><div style="font-size:11px;text-align:center">Notificaciones</div></td>
                      <td width="77"><div style="font-size:11px;text-align:center">Gastos</div></td>
                      <td width="77"><div style="font-size:11px;text-align:center">Facturas</div></td>
                    </tr>
                    <tr>
                      <td align="center"><a href="#" onclick="popupCssShow(\'includes/popup/popup.php?page=VerNotificacion&codigo='.$x.'\', 660);return false"><img src="images/email.png" width="64" height="64" /></a></td>
                      <td align="center"><a href="#" onclick="popupCssShow(\'includes/popup/popup.php?page=Gastos&codigo='.$x.'\', 600);return false"><img src="images/dinero.png" width="65" height="64" /></a></td>
                      <td align="center"><a href="#" onclick="popupCssShow(\'includes/popup/popup.php?page=facturas&codigo='.$x.'&codigo_proceso=11\', 700);return false"><img src="images/factura.png" width="95" height="64" /></a></td>
                    </tr>
                  </table>
                       
                     </div>';
            
	$objResponse->assign("contenerdor_derecho", "innerHTML", $retval);
	return $objResponse;
       
   }
   function xagregaproces($x,$fila){
       date_default_timezone_set('America/Bogota');
       $objResponse = new xajaxResponse();
       $date=date('Y-m-s H:i:s');
       
        $retval1 = 'Hola MUndo'.$fila;
        $retval = '<li><div id="proceso" style="display:-webkit-box; display:-moz-inline-box; position:relative; ">
                            <div style="width:25px">'.$actividad->proces_id.'</div>
                            <div style="width:160px"><strong>
                                <select name="actividad" id="actividad" class="makeprocess" onChange="mostrar_actividad(\''.$x.'\',this.value,\''.$actividad->proces_id.'\');">
                                    <option value="0">--- Escojer ---</option>
                                    '.actividades().'
                                </select></strong></div>
                            <div style="width:180px"><input name="observacion" id="observacion" type="text" "/></div>
                            <div style="width:50px">'.$_SESSION["usu_usuario"].'</div>
                            <div style="width:100px">'.$date.'</div>
                         </div>
                         <div><button id="create_process" name="create_process" onclick="xajax_xguardarproces(\''.$x.'\',document.getElementById(\'actividad\').value,document.getElementById(\'observacion\').value,\''.$fila.'\');return false;">+ Guardar</button></div></li>';
	$objResponse->assign("agregarproceso".$fila, "innerHTML", $retval);
	return $objResponse;
       
   }
   function xaumentarubro($codigo,$descripcion,$valor){
      date_default_timezone_set('America/Bogota');
       $objResponse = new xajaxResponse();
       $date=date('Y-m-s H:i:s');
       insertar_gasto($codigo,'1',$descripcion,$valor);
        $retval = '<table width="100%"  style="margin:0;padding:0;border-bottom-style:dotted;border-bottom-width:1px; border-bottom-color:#999">
                        <tr>
                          <td width="180">'.$descripcion.'</td>
                          <td width="80" align="center">$ '.$valor.'</td>
                          <td width="113"><div align="center"><img src="images/001_05.gif" width="18" height="18" /></div></td>
                        </tr>
                      </table>';
	$objResponse->assign("mostrargastos", "innerHTML", $retval);
	return $objResponse;
       
   }
   function xguardarproces($codigo,$actividad,$observacion,$fila){
       
        $objResponse = new xajaxResponse();
        global $dbmysql;
        date_default_timezone_set('America/Bogota');
        $date1=date('Y-m-d H:i:s');
        //CONSULTAR SI EL PROCESO TIENE UN PADRE//
        $sql_pa_ant="SELECT * FROM `dnk_procesos_actividad` WHERE DNK_ACTIVIDAD_APROBADA_id ='$actividad' OR `DNK_ACTIVIDAD_NEGADA_id` = $actividad";
        $val_pa_ant = $dbmysql->query($sql_pa_ant);
        $row_pa_ant=$val_pa_ant->fetch_object();
        
        if($val_pa_ant->num_rows!=0){
            $codigo_actividad=$row_pa_ant->DNK_PROCESO_id;
            $estado=($row_pa_ant->DNK_ACTIVIDAD_APROBADA_id==$actividad)?'A':'N';
            $sql_proceso="SELECT * FROM `dnk_procesos` WHERE `proces_codigo`='$codigo' AND `proces_actividad_id`=$codigo_actividad AND `proces_estado`='P'";
            $vals_proceso = $dbmysql->query($sql_proceso);
            $val_proceso=$vals_proceso->fetch_object();
            actualiza_estado_proceso($codigo,$val_proceso->proces_id,$estado);
        }
        
        
        $sql_actividad="SELECT * FROM `dnk_procesos_actividad` WHERE DNK_PROCESO_id =$actividad";
                $vals = $dbmysql->query($sql_actividad);
                $val=$vals->fetch_object();
                if($vals->num_rows>0){
                    $estado='P';
                }else{
                    $estado='A';
                }
        
        $estado='A';
        $sql="INSERT INTO  `dnk_procesos` (
                `proces_id` ,
                `proces_codigo` ,
                `proces_actividad_id` ,
                `proces_observacion` ,
                `proces_solicitud` ,
                `proces_usuario` ,
                `proces_fechahora`,
                `proces_estado`
                )
                VALUES (
                NULL ,  '$codigo',  '$actividad',  '$observacion',NULL , '{$_SESSION["user_id"]}','$date1','$estado');";
//                echo $sql;
         $rows = $dbmysql->query($sql);
//         if ($rows){
              $activ="SELECT a.descripcion,p.*,u.* FROM `dnk_procesos` p,dnk_actividad a,usuario u  WHERE proces_codigo= '$codigo' AND p.`proces_actividad_id`=a.id AND u.usu_id=p.proces_usuario AND `proces_observacion` ='$observacion' AND `proces_actividad_id` = '$actividad'";
              $act_row = $dbmysql->query($activ);
              $actividad = $act_row->fetch_object();
              if($actividad->proces_estado=='A'){
                  $codigo_proceso=$actividad->proces_id;
                            $estado_proceso='<img src="images/like.png" width="20" alt="Aprobado" title="Aprobado"> Aprobado';
                        }elseif($actividad->proces_estado=='N'){
                            $estado_proceso='<img src="images/nolike.png" width="20" alt="Rechazado" title="Rechazado"> Rechazado';
                        }else{
                             
                            if($actividad->proces_actividad_id==12){
                            $estado_proceso='<a href="#" onclick="mostrar_actividad(\''.$codigo.'\',33,\''.$codigo_proceso.'\');">
                                                <img src="images/like.png" width="20" alt="Aprobar" title="Aprobar">
                                             </a>
                                             <a href="#" onclick="xajax_xrechazar(\''.$codigo_proceso.'\');return false;">
                                                <img src="images/nolike.png" width="20" alt="Rechazar" title="Rechazar">
                                             </a>';
                        }else{
                             $estado_proceso='<a href="#" onclick="xajax_xrechazar(\''.$codigo_proceso.'\');return false;">
                                                <img src="images/nolike.png" width="20" alt="Rechazar" title="Rechazar">
                                             </a>';
                        }
                        
                            }
                        $localizacion=($actividad->localizacion=='E')?'Externo':'Interno';
              $bus="SELECT * FROM `dnk_notifica_cliente` WHERE DNK_PROCESOS_id=$actividad->proces_id ";
                        $notifi = $dbmysql->query($bus);
                        if($notifi->num_rows>0){
                            $notifica .='<a class="tooltip"><img src="images/001_06.gif" width="20" height="20" border="0" alt="Notificado" title="Notificado"/>
                                        <span class="custom info">
                                            <em>Listado de Notificados</em>';
                                            $sql_bus="SELECT * FROM `dnk_notificacion_mail` WHERE  DNK_DOCUMENTO_codigo='$row->codigo' ";
                                            $notificaciones = $dbmysql->query($sql_bus);
                                            while ( $notificacion=$notificaciones->fetch_object() ){
                                                $notifica .='<p>'.$notificacion->nombre_contacto.'</p>';
                                            }
                             $notifica .='</span>
                                       </a>';
                        }else{
                            $notifica='<a href="#" onclick="xajax_xnotificar(\''.$actividad->proces_id.'\',\''.$row->codigo.'\',\''.$actividad->proces_actividad_id.'\');return false;">
                                            <img src="images/mailsend.png" width="25" alt="Notificar" title="Notificar">
                                       </a>';
                        }
         $retval = '<li><div id="proceso" style="display:-webkit-box; display:-moz-inline-box; position:relative; ">
                            <div style="width:25px">'.$actividad->proces_id.'</div>
                            <div style="width:160px"><strong>'.$actividad->descripcion.'</strong></div>
                            <div style="width:180px">'.$actividad->proces_observacion.'</div>
                            <div style="width:50px;text-align:center;" id="viewnotifica'.$actividad->proces_id.'">'.$notifica.'</div>
                            <div style="width:50px">'.$actividad->usu_usuario.'</div>
                            <div style="width:50px">'.$localizacion.'</div>
                            <div style="width:100px">'.$actividad->proces_fechahora.'</div>
                            <div id="verestado'.$actividad->proces_id.'" style="width:100px">'.$estado_proceso.'</div>
                         </div>
                      </li>';
//         }
         $objResponse->assign("agregarproceso".$fila, "innerHTML", $retval);
	return $objResponse;
   }
   function xubicatramite($codigo){
       date_default_timezone_set('America/Bogota');
       $objResponse = new xajaxResponse();
       $retval = $codigo;
       $objResponse->assign("buscar_tramite", "value", $retval);
	return $objResponse;
   }
   function xaprobar($codigo_proceso){
       date_default_timezone_set('America/Bogota');
       $objResponse = new xajaxResponse();
       $date=date('Y-m-s H:i:s');
//       insertar_gasto($codigo,'1',$descripcion,$valor);
        $retval = '<img src="images/like.png" width="20" alt="Aprobar" title="Aprobar"> Aprobado';
	$objResponse->assign("verestado".$codigo_proceso, "innerHTML", $retval);
	return $objResponse;
       
   }
   function xrechazar($codigo_proceso){
       date_default_timezone_set('America/Bogota');
         global $dbmysql;
       $objResponse = new xajaxResponse();
       $date=date('Y-m-s H:i:s');
       $sql="SELECT * FROM `dnk_procesos` WHERE proces_id=$codigo_proceso";
       $vals = $dbmysql->query($sql);
       $val=$vals->fetch_object();
       $codigo_tramite=$val->proces_codigo;
       
//       insertar_gasto($codigo,'1',$descripcion,$valor);
        $retval = '<img src="images/nolike.png" width="20" alt="Rechazar" title="Rechazar"> Rechazado
                   <input type="text" name="descripcion"  id="descripcion"  value=""/>
                   <a href="#" onclick="xajax_xinsertarechazada(\''.$codigo_tramite.'\',\''.$codigo_proceso.'\',document.getElementById(\'descripcion\').value);return false;">
                        <img src="images/load.png" width="30" alt="Guardar" title="Guardar">
                   </a>';
	$objResponse->assign("verestado".$codigo_proceso, "innerHTML", $retval);
	return $objResponse;
       
   }
   function xinsertarechazada($codigo_tramite,$codigo_proceso,$descripcion){
       global $dbmysql;
       date_default_timezone_set('America/Bogota');
       $objResponse = new xajaxResponse();
       $date=date('Y-m-s H:i:s');
                $sql_actividad="SELECT * FROM `dnk_procesos` WHERE proces_id=$codigo_proceso";
                $vals_ac = $dbmysql->query($sql_actividad);
                $val_ac=$vals_ac->fetch_object();
                $codigo_actividad=$val_ac->proces_actividad_id;
                $sql="SELECT * FROM `dnk_procesos_actividad` WHERE DNK_PROCESO_id =$codigo_actividad";
                $vals = $dbmysql->query($sql);
                $val=$vals->fetch_object();
                $codigo_proceso_rechazo=$val->DNK_ACTIVIDAD_NEGADA_id;
       insertar_rechazada($codigo_proceso,$codigo_proceso_rechazo,$descripcion);
       actualiza_estado_proceso($codigo_tramite,$codigo_proceso,'N');
        $retval = '<img src="images/nolike.png" width="20" alt="Rechazar" title="Rechazar"> Rechazado';
	$objResponse->assign("verestado".$codigo_proceso, "innerHTML", $retval);
	return $objResponse;
       
   }

function xactualizafactura($tramite,$factura,$gasto){
    date_default_timezone_set('America/Bogota');
        global $dbmysql;
        $total=0;
	$objResponse = new xajaxResponse();
        $sql="UPDATE `dnk_documento_gasto` SET
                factura='$factura'
              WHERE id=$gasto";
        $vals = $dbmysql->query($sql);
        $sql_gasto="SELECT * FROM `dnk_documento_gasto` WHERE DNK_DOCUMENTO_codigo ='$tramite'";
                $vals_gasto = $dbmysql->query($sql_gasto);
                while($val_gasto=$vals_gasto->fetch_object()){
                    $total=$total+$val_gasto->valor;
                }
                $retval='$ '.$total;
	$objResponse->assign("subtotal", "value", $retval);
	return $objResponse;
}
//consultas
function xplanes($op,$cod){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
	$plan = planes($op);
          $retval ='<select name="planes" id="planes">
                                    <option value="0">--- Escoja una Opcion ---</option>
                                    '.planes($cod,$op).'
                                </select>';
	$objResponse->assign("showplanes", "innerHTML", $retval);
	return $objResponse;
	
}
function xdetallesplan($op){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
        global $dbmysql;
           
                $sql = "SELECT c.cl_asegurado, u.USU_NOMBRES, u.USU_APELLIDOS, u.USU_INICIALES, p. * , a.ase_descripcion, pla.pln_descripcion, f.FMP_DESCRIPCION
                    FROM `gbpoliza` p, `gbclientes` c, `gbaseguradora` a, `gbusuario` u, `gbplanes` pla, `gbformapago` f
                    WHERE c.cl_identificacion = p.cl_identificacion
                    AND p.ase_codigo = a.ase_codigo
                    AND p.pln_codigo = pla.pln_codigo
                    AND u.USU_CODIGO = p.USU_CODIGO
                    AND p.FMP_CODIGO = f.FMP_CODIGO
                    AND p.POL_CODIGO ='$op'";
                    $rows = $dbmysql->query($sql);
                    while ( $row=$rows->fetch_object() ){
                            $aseguradora = $row->ase_descripcion;
                            $plan = $row->pln_descripcion;
                            $formapago = $row->FMP_DESCRIPCION;
                            $poliza = $row->PLN_CODIGO;
                            $ramo = $row->RMO_DESCRIPCION;
                            $anexo = $row->POL_ANEXO;
                            $factura = $row->POL_FACTURA;
                            $valoraseg = $row->POL_VALORASEGURADO;
                            $primatotal = $row->POL_PRIMATOTAL;
                            $primaneta = $row->POL_PRIMANETA;

                    }
                    $retval ='<table border="0" align="center">
                        <tr>
                             <td><strong>Aseguradora</strong></td>
                             <td>'.$aseguradora.'</td>
                             <td><strong>Plan</strong></td>
                             <td>'.$plan.'</td>
                             <td><strong>Forma de Pago</strong>l</td>
                             <td>'.$formapago.'</td>
                        </tr>
                        <tr>
                             <td><strong>Poliza</strong></td>
                             <td>'.$poliza.'</td>
                             <td><strong>Ramo</strong></td>
                             <td>'.$ramo.'</td>
                             <td><strong>Anexo</strong></td>
                             <td>'.$anexo.'</td>
                        </tr>
                        <tr>
                             <td><strong>Factura</strong></td>
                             <td>'.$factura.'</td>
                             <td><strong>Valor Asegurado</strong></td>
                             <td>'.$valoraseg.'</td>
                             <td><strong>Prima Tota</strong>l</td>
                             <td>'.$primatotal.'</td>
                          </tr>
                        <tr>
                             <td><strong>Prima Neta</strong></td>
                             <td>'.$primaneta.'</td>
                             <td></td>
                             <td></td>
                             <td></td>
                             <td></td>
                      </tr>
                    </table>';
                  
                $objResponse->assign("verdetalles".$op, "innerHTML", $retval);
                return $objResponse;
}
//////////////////////////



function xcontacto($x){
	$objResponse = new xajaxResponse();
    $j = $x+1;
    
	$retval = $j .' : <input type="text" name="contacto[]" /> <strong>E-Mail: </strong><input type="text" name="email[]" size=16" /> ';
    if ( $j < 8 )

      $retval .= ' <img src="images/icon-add.png" width="16" height="16" border="0" onclick="xajax_xcontacto('.$j.');return false"/>';
	$objResponse->assign("contactoview".$j, "innerHTML", $retval);
	return $objResponse;
} 
function xmoverarchivo($cod,$path,$val){
    date_default_timezone_set('America/Bogota');
	$objResponse = new xajaxResponse();
	$retval='';
                $name_dir = date("Y-M");
                $url = $_SERVER['DOCUMENT_ROOT'] .'/denkel/administrador/SubirArchivos/DOCUMENTOS';
                $path_file = $url .'/'. $name_dir;
                
        if (!is_dir ( $path_file )){
                            if (!mkdir("$path_file" , 0777)){
                                $tmp_1 = "No se ha creado la Carpeta de la fecha";}
                            
                    }
                    $nam=$cod.'/';
                    $pat=$path_file.'/'.$nam;
                 if (!is_dir ( $pat )){
                            if (!mkdir("$pat" , 0777)){
                                $tmp_1 = "No se ha creado la Carpeta de la fecha";}
                            
                    }
        //echo $val.'--------------'.$path; exit;
        //$retval=up();
                    echo $val; exit;
  
        if(copy($path,$pat)){
        $retval .= 'SI PASO';
        }
        else
            $retval .='NO PASO';
	$objResponse->assign("viewpaso", "innerHTML", $retval);
	return $objResponse;
}
function xmenostotales(){
    date_default_timezone_set('America/Bogota');
	include_once("aduanas.inc.php");
	$objResponse = new xajaxResponse();
	$retval =$_SESSION['subtotal'] * 1.12;
	$retval = $retval + $_SESSION['subtotalsiniva'];
	$objResponse->assign("total", "value", $retval);
	return $objResponse;
}

	require("logica.common.php");
	$xajax->processRequest();
?>