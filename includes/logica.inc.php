<?php

	include_once("database.inc.php");
	$dbmysql = new database();
	 date_default_timezone_set('America/Bogota');
	function menu_principal(){
//            global $dbmysql;
            $retval = '<div id="container">
                        <ul class="efectos">
                                <li>
                                        <img src="images/clientes.jpg" width="200" height="150" alt="Imagen uno" />
                                        <h2>Clientes</h2>
                                        <hr />
                                        <p>Mantenimiento y Consulta de Clientes</p>
                                        <a class="boton" href="?modulo=clientes&op=viewcliente" title="Click para Ingresar">Ingresar</a>
                                </li>
                                <li>
                                        <img src="images/proveedores.png" width="200" height="150" alt="Imagen dos" />
                                        <h2>Proveedores</h2>
                                        <hr />
                                        <p>Mantenimiento y Consulta de Proveedores</p>
                                        <a class="boton" href="#" title="Click para Ingresar">Ingresar</a>
                                </li>
                                <li>
                                        <img src="images/documentos.jpg" width="200" height="150" alt="Imagen tres" />
                                        <h2>Tramites</h2>
                                        <hr />
                                        <p>Revisión, Creacion y Mantenimiento de Tramites</p>
                                        <a class="boton" href="?modulo=tramites&op=vertramite" title="Click para Ingresar">Ingresar</a>
                                </li>
                                <li>
                                        <img src="images/plan.jpg" width="200" height="150" alt="Imagen cuatro" />
                                        <h2>Mensajeria</h2>
                                        <hr />
                                        <p>Mantenimiento de Mensajeria</p>
                                        <a class="boton" href="#" title="Click para Ingresar">Ingresar</a>
                                </li>				
                        </ul></div>';
            
            return $retval;
        }
        function cambiarnombre($tipo,$nombreactual){
            global $dbmysql;
            
                $nombrefinal = '';
                $sql = "SELECT * FROM `dnk_tpdoc_escaneado` where tipo_doc_id=".$tipo;
		$val = $dbmysql->query($sql);
                $row = $val->fetch_object();
                $ini = date('d_Hi');
                $ext =  explode(".", $nombreactual);
                $nomfin = str_replace(".","",trim($row->tipo_doc_desc));
                $nom= str_replace(" ", "_", $nomfin);
                $nombrefinal= $ini.'_'.$nom.'.'.$ext[1];
        
            return $nombrefinal;
        }
        function tpdoc_escaneado($val){
		global $dbmysql;
		$retval = '';
                if($val==0){
                    $sql = "SELECT * FROM `dnk_tpdoc_escaneado` ORDER BY `tipo_doc_id` ASC";
                    $rows = $dbmysql->query($sql);
                    while ( $row=$rows->fetch_object() ){
                            $retval .= '<option value="'.$row->tipo_doc_id.'">'.$row->tipo_doc_desc.'</option>';
                    }
                }else{
                    $sql = "SELECT * FROM `dnk_tpdoc_escaneado` WHERE tipo_doc_id=$val";
                    $rows = $dbmysql->query($sql);
                    $row=$rows->fetch_object();
                            $retval .= '<option value="'.$row->tipo_doc_id.'" selected="selected">'.$row->tipo_doc_desc.'</option>';
                   
                }
		return $retval;

	}
        function saveauditoria($destinatarios,$descripcion,$tipo,$estado){
             global $dbmysql;
            $date=date('Y-m-d');
            $hora=date('H:i:s');
            $sql="INSERT INTO  `glauben`.`gbenviomails` (
                    `mail_id` ,
                    `mail_descripcion` ,
                    `mail_destinatarios` ,
                    `mail_tipo` ,
                    `mail_fecha` ,
                    `mail_hora` ,
                    `mail_estado`
                    )
                    VALUES (
                    NULL ,  '$descripcion','$destinatarios','$tipo', '$date','$hora', '$estado');";
            
            $val = $dbmysql->query($sql);
        }
        //TRAMITES///
        function listar_tramites(){
          global $dbmysql;
          $docs="SELECT c.nombre,d.* FROM `dnk_documento` d, dnk_cliente c WHERE d.`DNK_CLIENTE_id`=c.id";
          $rows = $dbmysql->query($docs);
          
         $retval='<table border="0" width="100%" id="hover">
                    <tr>
                            <th width="20">&nbsp;</th>
                            <th width="47" class="col-name">Codigo</th>
                            <th width="48" class="col-comment">Cliente</th>
                            <th width="69" class="col-response">Proveedor</th>
                            <th width="81" class="col-response">Ref. Cliente</th>
                            <th width="53" class="col-response">Via</th>
                            <th width="240" class="col-response">Servicio</th>
                    </tr>';
        while ( $row = $rows->fetch_object()){
            $prov="SELECT * FROM dnk_cliente WHERE id=".$row->proveedor;
            $rows1 = $dbmysql->query($prov);
            $row1 = $rows1->fetch_object();
            $retval .='  <tr>
                            <td><input type="hidden" name="codigo" id="codigo" value="'.$row->codigo.'"/>
                              <input type="radio" name="escojer" id="radio" value="radio" onchange="xajax_xtramites(document.getElementById(\'codigo\').value);return false;"/>
                            </td>
                            <td class="col-name">'.$row->codigo.'</td>
                            <td class="col-comment"><span class="col-name">'.$row->nombre.'</span></td>
                            <td class="col-response"><span class="col-name">'.$row1->nombre.'</span></td>
                            <td class="col-response"><span class="col-name">'.$row->num_ref_cliente .'</span></td>
                            <td class="col-response"><span class="col-name">'.$row->codigo.'</span></td>
                            <td class="col-response"><span class="col-name">'.$row->codigo.'</span></td>
                     </tr>';
        }        
        $retval .='<tr>
                    <td colspan="7" align="center">
                    <div id="verdetalles" style="">
                            
                    </div>
                </td>
            </tr>
            </table>';
         
         return $retval;
     } 
        function verOrdenes(){
            global $dbmysql;
             $retval .='<div id="dialog-form" title="Crear Nuevo Tramite">
                                <p class="validateTips">Todos los campos con * son requeridos</p>
                                '.frmrecep_documento().'
                        </div>';
            $retval .= '<div id="container_two">
                            <table width="100%" border="0" cellpadding="0" cellspacing="3" style="font-size:11px">
                                <tr>
                                    <th colspan="12" bgcolor="#940007"  height="30" style="font-size:18px; color:#FFF">Tramites Generales</th>
                                </tr>
                                <tr>
                                    <td>
                                        <div>Busqueda:</div>
                                        <div><input type="text" class="texto-gris"  id="buscar_tramite"  value="Buscar..." onfocus="if (this.value == \'Buscar...\') {this.value = \'\';}" onblur="if (this.value == \'\') {this.value = \'Buscar...\';}"/><input name="buscar" type="button" value="Buscar" /></div>
                                        <div><button id="create-user">+ Nuevo Tramite</button></div>      
                                    </td>
                                </tr>
                            </table>
                            <table id="report">
                            <thead><tr>
                                <th width="50">Codigo</th>
                                <th>Cliente</th>
                                <th>Proveedor</th>
                                <th>Ref. Cliente</th>
                                <th>Via</th>
                                <th>Servicio</th>
                                <th>Distrito</th>
                                <th></th>
                            </tr></thead><tbody>';
            $docs="SELECT c.nombre,tp.descripcion as servicio,ciu.descripcion  as distrito,d.* 
                    FROM `dnk_documento` d, dnk_cliente c,dnk_tp_documento tp, dnk_ciudad ciu 
                    WHERE d.`DNK_CLIENTE_id`=c.id AND tp.id=d.DNK_TP_DOCUMENTO_id AND
                    ciu.id=d.ciudad_id ORDER BY `id` DESC";
            $rows = $dbmysql->query($docs);
         
            while ( $row = $rows->fetch_object()){
                $sql_estado="SELECT * FROM `dnk_procesos` WHERE proces_codigo='$row->codigo'";
                $rows_estado = $dbmysql->query($sql_estado);
                $row_estado = $rows_estado->fetch_object();
                $style=($row_estado->proces_estado=='P')?'style="background:#fff url(images/row_bkg_a.png) repeat-x scroll center left;"':'';
                
            $prov="SELECT * FROM dnk_cliente WHERE id=".$row->proveedor;

            $rows1 = $dbmysql->query($prov);
            $row1 = $rows1->fetch_object();
            if($row->via=='MA'){
                $via='Maritima';
            }else if($row->via=='AE'){
                $via='Aerea';
            }else{ $via='Terrestre';}
                 $retval .= '<tr class="odd" onclick="xajax_xmuestraconfiguracion(\''.$row->codigo.'\');return false;">
                                <td '.$style.'><strong>'.$row->codigo.'</strong></td>
                                <td '.$style.'>'.$row->nombre.'</td>
                                <td '.$style.'>'.$row1->nombre.'</td>
                                <td '.$style.'>'.$row->num_ref_cliente .'</td>
                                <td '.$style.'>'.$via.'</td>
                                <td '.$style.'>'.$row->servicio.'</td>
                                <td '.$style.'>'.$row->distrito.'</td>
                                <td '.$style.'><div class="arrow"></div></td>
                            </tr>';
                 $codigo_tramite=$row->codigo;
                    $activ="SELECT a.localizacion,a.descripcion,p.*,u.* FROM `dnk_procesos` p,dnk_actividad a,usuario u WHERE proces_codigo= '$codigo_tramite' AND p.`proces_actividad_id`=a.id AND u.usu_id=p.proces_usuario";
                    $act_row = $dbmysql->query($activ);
                $retval .= '<tr>
                                <td colspan="8">
                                    <h4>Informacion de Procesos</h4>';
                while (  $actividad = $act_row->fetch_object()){//&codigo=
                        if($actividad->proces_estado=='A'){
                            $estado_proceso='<img src="images/like.png" width="20" alt="Aprobado" title="Aprobado"> Aprobado';
                        }elseif($actividad->proces_estado=='N'){
                            $estado_proceso='<img src="images/nolike.png" width="20" alt="Rechazado" title="Rechazado"> Rechazado';
                        }else{
                            
                            if($actividad->proces_actividad_id==12){
                            $estado_proceso='<a href="#" onclick="mostrar_actividad(\''.$codigo_tramite.'\',33,\''.$actividad->proces_id.'\');">
                                                <img src="images/like.png" width="20" alt="Aprobar" title="Aprobar">
                                             </a>
                                             <a href="#" onclick="xajax_xrechazar(\''.$actividad->proces_id.'\');return false;">
                                                <img src="images/nolike.png" width="20" alt="Rechazar" title="Rechazar">
                                             </a>';
                            }else{

                                 $estado_proceso='<a href="#" onclick="xajax_xrechazar(\''.$actividad->proces_id.'\');return false;">
                                                    <img src="images/nolike.png" width="20" alt="Rechazar" title="Rechazar"> Rechazar
                                                 </a>';
                        }
                        }
                        $localizacion=($actividad->localizacion=='E')?'Externo':'Interno';
                        if($actividad->proces_actividad_id==12){//
                            $a='<a href="#" onclick="popupCssShow(\'includes/popup/popup.php?page=VerSolicitudEgreso&codigo='.$codigo_tramite.'&solicitud='.$actividad->proces_solicitud.'\', 660);">'.$actividad->proces_solicitud.' | ';
                            $fa='</a>';
                        }else{$a='';$fa='';}
                        $bus="SELECT * FROM `dnk_notifica_cliente` WHERE DNK_PROCESOS_id=$actividad->proces_id ";
                        $notifi = $dbmysql->query($bus);
                        if($notifi->num_rows>0){
                            $notifica ='<a class="tooltip"><img src="images/001_06.gif" width="20" height="20" border="0" alt="Notificado" title="Notificado"/>
                                        <span class="custom infor">
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
                                            <img src="images/mailsend.png" width="25" alt="Notificar" title="Norificar">
                                       </a>';
                        }
                        $retval .= '<li><div id="proceso" style="display:-webkit-box; display:-moz-inline-box; position:relative; ">
                                                <div style="width:25px">'.$actividad->proces_id.'</div>
                                                <div style="width:160px">'.$a.'<strong>'.$actividad->descripcion.'</strong>'.$fa.'</div>
                                                <div style="width:180px">'.$actividad->proces_observacion.'</div>
                                                <div style="width:50px;text-align:center;" id="viewnotifica'.$actividad->proces_id.'">'.$notifica.'</div>
                                                <div style="width:50px">'.$actividad->usu_usuario.'</div>    
                                                <div style="width:50px">'.$localizacion.'</div>
                                                <div style="width:100px">'.$actividad->proces_fechahora.'</div>
                                                <div id="verestado'.$actividad->proces_id.'" style="width:100px">'.$estado_proceso.'</div>
                                             </div></li>';
                         $xi=$actividad->proces_id+1;
                }     
               
                        $retval .= '<div><div id="agregarproceso'.$xi.'"></div><button id="create-user" onclick="xajax_xagregaproces(\''.$row->codigo.'\',\''.$xi.'\');return false;">+ Nuevo Proceso</button></div><div style="width:100px">
                                                    <input type="hidden" name="codigo_tramite"  id="codigo_tramite"  value="'.$row->codigo.'"/>
                                                        <button onclick="xajax_xsubirarchivos(\''.$row->codigo.'\');return false;">+Documentos</button>
                                                        </ul>   
                                </td>
                            </tr>';
                        $xi++;
        }        
        $retval .='</tbody></table></div>';
            
            
            return $retval;
        }
        function actividades(){
		global $dbmysql;
		$retval = '';
		$sql = "SELECT ar.id as ACROL,u.rol_id,u.usu_id,u.usu_nombre,a.* FROM `dnk_actividad_rol` ar, `dnk_actividad` a,`usuario` u
                        WHERE a.id=ar.`DNK_ACTIVIDAD_id` AND u.rol_id=ar.rol_id AND a.tipo=0 AND u.usu_id={$_SESSION['user_id']} ORDER BY orden";
		$rows = $dbmysql->query($sql);
		while ( $row=$rows->fetch_object() ){
                    $color=($row->orden<99)?'style="color:blue"':'';
			$retval .= '<option value="'.$row->id.'" '.$color.'>['.$row->localizacion.'] '.$row->descripcion.'</option>';
		}
		return $retval;

	}
        function frmrecep_documento(){
		$cod =  getcodigo();
               // echo $cod; exit;
		$_SESSION['guardar'] = 1;
             
                $name_dir = date("Y-M").'/';
//                $directorio = $_SERVER['DOCUMENT_ROOT'] .'/administrador/SubirArchivos/INPUT/'.$name_dir.$cod.'/';
                   $retval .='<form class="contacto_documento" method="post" action="?modulo=gestion&op=insdocumento">
                                <table width="100%" border="0" align="center"  style="font-size:12px">
                                    <tr>
                                        <td width="38%">
                                            <div>
                                                <label><strong>*</strong> Cliente:</label>
                                            </div>
                                        </td>
                                        <td colspan="2">
                                            <div>
                                                <input type="text" class="codigo_cliente" name="codigo_cliente"  id="codigo_cliente" value="" size="4" maxlength="5" readonly="true">
                                                <input type="text" class="cliente" name="buscar_cliente_doc" id="buscar_cliente_doc" value="" size="40">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="38%">
                                            <div>
                                                <label><strong>*</strong> Proveedor:</label>
                                            </div>
                                        </td>
                                        <td colspan="2">
                                            <div>
                                                <input class="codigo_proveedor" name="codigo_proveedor" type="text" id="codigo_proveedor" value="" size="4" maxlength="5" readonly="true">
                                                <input type="text" class="cliente" name="buscar_proveedor_doc" id="buscar_proveedor_doc" value="" size="40">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><div><label><strong>*</strong> Codigo:</label></div></td><td colspan="2"><div><input type="text" class="codigo" name="codigo" id="codigo" value="'.$cod.'" style="color:#FF0000; font-style:normal"  readonly="readonly"></div></td>
                                    </tr>
                                    <tr>
                                        <td><div><label><strong>*</strong> Referencia del Cliente:</label></div></td><td colspan="2"><div><input type="text" class="num_ref_cliente" name="num_ref_cliente" id="num_ref_cliente" onkeyup="javascript:this.value=this.value.toUpperCase();"></div></td>
                                    </tr>
                                    <tr style="display:none">
                                        <td><div><label>Fecha :</label></div></td><td colspan="2"><div><input type="text" class="fecha" name="fecha" id="fecha" value="'.date('Y-M-d').'" readonly="readonly"></div></td>
                                    </tr>
                                    <tr style="display:none">
                                        <td><div><label>Hora:</label></div></td><td colspan="2"><div><input type="text" class="hora" name="hora" id="hora"  value="'.date('h:i:s a').'" readonly="readonly"></div></td>
                                    </tr>
                                    <tr>
                                        <td><div><label><strong>*</strong> Via Transporte:</label></div></td><td colspan="2"><div><select name="via" size="1" id="via" class="via">
                                                                <option value="0">-- Seleccione uno --</option>
                                                                <option value="MA">Maritima</option>
                                                                <option value="AE">Aerea</option>
                                                                <option value="TE">Terrestre</option>
                                                            </select></div></td>
                                    </tr>
                                    <tr>
                                        <td><div><label><strong>*</strong> Servicio:</label></div></td><td colspan="2"><div><select name="servicio" size="1" id="servicio" class="servicio">
                                                                <option value="0">-- Seleccione uno --</option>
                                                                '.tpdocumento('').'
                                                            </select></div></td>
                                    </tr>
                                    <tr>
                                        <td><div><label><strong>*</strong> Tipo de Carga:</label></div></td><td><div><select name="tpcarga" size="1" id="tpcarga" class="tpcarga">
                                                                <option value="0">-- Seleccione una --</option>
                                                                '.tpcarga('').'
                                                            </select></div></td>
                                        <td align="center"></td>
                                    </tr>
                                     <tr>
                                        <td><div><label><strong>*</strong> Distrito:</label></div></td><td width="22%"><div><select name="distrito" size="1" id="distrito" class="distrito">
                                                                <option value="0">-- Seleccione una --</option>
                                                                '.distrito('').'
                                                            </select></div></td>
                                        <td width="40%" rowspan="2" align="center"></td>
                                    </tr>
                                    <tr>
                                        <td><div><label><strong>*</strong> Responsable:</label></div></td><td><div><select name="responsable" size="1" id="responsable" class="responsable">
                                                                <option value="0">-- Seleccione una --</option>
                                                                '.responsable('').'
                                                            </select></div></td>
                                    </tr>
                                    
                            </table>
                          </form>';
		
		return $retval;
	}
        function getcodigo(){
		global $dbmysql;
		$cod = '';
		$anio = date("y");
                $sql_max="SELECT MAX(id) AS id FROM `dnk_documento`";
                $rows_max = $dbmysql->query($sql_max);
                $row_max=$rows_max->fetch_object();
                $id=$row_max->id;
		$sql = "SELECT SUBSTRING( codigo, 1,2 ) AS anio,MAX(SUBSTRING( codigo, 7 )) AS id, codigo
                        FROM `dnk_documento` WHERE id='$id'";
		$rows = $dbmysql->query($sql);
//                echo $sql;
		$row=$rows->fetch_object();
		if(!is_null($row->id)){
                        $num=$row->id+1;
                        $num_val=($num<10)?'0':'';
				$cod = $anio.'-DK-'.$num_val.$num;
		}else{
                            $parametro = "SELECT * FROM `dnk_parametros` WHERE id=1";
//                                           echo $parametro; exit;
                            $rows = $dbmysql->query($parametro);
                            $row=$rows->fetch_object();
                            
                            $cod = $anio.'-DK-'.$row->valor1;
                          // echo $cod;exit;
                }
		
                
		return $cod;
	}
        function tpdocumento(){
		global $dbmysql;
		$retval = '';
		$sql = "SELECT * FROM `dnk_tp_documento`";
		$rows = $dbmysql->query($sql);
		while ( $row=$rows->fetch_object() ){
			$retval .= '<option value="'.$row->id.'">'.$row->descripcion.'</option>';
		}
		return $retval;

	}
        function banco($op){
		global $dbmysql;
		$retval = '';
		$sql = "SELECT * FROM `dnk_banco`";
		$rows = $dbmysql->query($sql);
		while ( $row=$rows->fetch_object() ){
                     if($op!=''){
                           $select=($op==$row->id)?'selected="selected"':'0';
                       }
			$retval .= '<option value="'.$row->id.'" '.$select.'>'.$row->descripcion.'</option>';
		}
		return $retval;

	}
        function distrito($op){
		global $dbmysql;
		$retval = '';
		$sql = "SELECT * FROM `dnk_ciudad`";
		$rows = $dbmysql->query($sql);
		while ( $row=$rows->fetch_object() ){
                     if($op!=''){
                           $select=($op==$row->id)?'selected="selected"':'0';
                       }
			$retval .= '<option value="'.$row->id.'" '.$select.'>'.$row->abreviatura.'---'.$row->descripcion.'</option>';
		}
		return $retval;

	}
        function tpcarga($op){
		global $dbmysql;
		$retval = '';
		$sql = "SELECT * FROM `dnk_tp_carga`";
		$rows = $dbmysql->query($sql);
		while ( $row=$rows->fetch_object() ){
                    if($op!=''){
                           $select=($op==$row->id)?'selected="selected"':'0';
                       }
			$retval .= '<option value="'.$row->id.'"'.$select.'>'.$row->descripcion.'</option>';
		}
		return $retval;
		
	}
        function responsable($op){
		global $dbmysql;
		$retval = '';
		$sql = "SELECT * FROM `usuario` where rol_id >=3 and rol_id <=6";
		$rows = $dbmysql->query($sql);
		while ( $row=$rows->fetch_object() ){
                    if($op!=''){
                           $select=($op==$row->id)?'selected="selected"':'0';
                       }
			$retval .= '<option value="'.$row->usu_id.'"'.$select.'>'.$row->usu_nombre.'</option>';
		}
		return $retval;
		
	}
        
        //FUNCIONES DE LAS NOTIFICACIONES //
        function configuracion(){
            $retval='';
            $retval='<div>
                <table width="343" border="0">
                    <tr>
                      <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td colspan="3" align="center" bgcolor="#940007"  height="15" style="font-size:18px; color:#FFF; padding:10px ">Configuración de Tramites</td>
                    </tr>
                    <tr>
                      <td width="84"><div style="font-size:11px;text-align:center">Notificaciones</div></td>
                      <td width="77"><div style="font-size:11px;text-align:center">Gastos</div></td>
                      <td width="77"><div style="font-size:11px;text-align:center">Facturas</div></td>
                    </tr>
                    <tr>
                      <td align="center"><div class="notificaciones_botones"><img src="images/email.png" width="64" height="64" /></div></td>
                      <td align="center"><div class="notificaciones_botones"><img src="images/dinero.png" width="65" height="64" /></div></td>
                      <td align="center"><div class="notificaciones_botones"><img src="images/factura.png" width="95" height="64" /></div></td>
                    </tr>
                  </table>
                       
                     </div>';
            
            
            return $retval;
        }
        function insertar_notificacion(){
            global $dbmysql;
            if($_POST['mail_inter']!=''){
             foreach ($_POST['mail_inter'] as $key => $value) {
                 $partida = ( isset($_POST['mail_inter'][$key]))?$_POST['mail_inter'][$key]:0;
                 
                  
                  //$mail_interno[]=array($key,'Operaciones',);
                  switch ($key){
                        case 600:
                           //Operaciones//
                            $sql = "SELECT * FROM `usuario` where `rol_id`=3 and `usu_id` > 2";
                            echo $partida; 
                            $rows = $dbmysql->query($sql);
                            if($partida==1){
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'A');
                                }
                            }else{
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'I');
                                }
                            }
                      break;
                        case 601:
                         //Administrativo//
                            $sql = "SELECT * FROM `usuario` where `rol_id`=4 and `usu_id` > 2";
                            $rows = $dbmysql->query($sql);
                            if($partida==1){
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'A');
                                } 
                            }else{
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'I');
                                } 
                            }
                      break;
                        case 602:
                         //Contabilidad//
                             $sql = "SELECT * FROM `usuario` where `rol_id`=5 and `usu_id` > 2";
                             $rows = $dbmysql->query($sql);
                            if($partida==1){
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'A');
                                } 
                            }else{
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'I');
                                } 
                            }
                      break;
                        case 603:
                         //Logistica//
                             $sql = "SELECT * FROM `usuario` where `rol_id`=6 and `usu_id` > 2";
                             $rows = $dbmysql->query($sql);
                             if($partida==1){
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'A');
                                } 
                            }else{
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'I');
                                } 
                            }
                      break;
                        case 604:
                        //Comercial//
                             $sql = "SELECT * FROM `usuario` where `rol_id`=7 and `usu_id` > 2";
                             $rows = $dbmysql->query($sql);
                             if($partida==1){
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'A');
                                } 
                            }else{
                                while ( $row = $rows->fetch_object()){ 
                                    insertar_notificacion_interna($_POST['codigo'],$row->usu_nombre,$row->email,'I',$row->rol_id,'I');
                                } 
                            }
                      break;
                  }
             }
            }
             foreach ($_POST['nombre'] as $key => $value) {
                 $partida = ( isset($_POST['check'][$key]))?$_POST['check'][$key]:0;
                  $estado=($partida==0)?'I':'A';
                  
                  $sql_insertado="SELECT * FROM `dnk_notificacion_mail` WHERE `DNK_DOCUMENTO_codigo`='{$_POST['codigo']}' AND `nombre_contacto`='$value'";
                  $val_insertados = $dbmysql->query($sql_insertado);
                  $val_insertado = $val_insertados->fetch_object();
                  $nom_buscar=$val_insertado->nombre_contacto;
//                  echo $sql_insertado;
                    $sql = "INSERT INTO `dnk_notificacion_mail` (
                            `id` ,
                            `DNK_DOCUMENTO_codigo` ,
                            `nombre_contacto` ,
                            `email_contacto` ,
                            `lugar_contacto` ,
                            `rol_id` ,
                            `estado_contacto`
                            )
                            VALUES (
                            NULL , '{$_POST['codigo']}', '{$value}', '{$_POST['email'][$key]}', '{$_POST['tipo'][$key]}',0,'$estado');";
//             echo $sql; exit;
		if ( $_SESSION['guardar'] == 1 ){
                    if($nom_buscar==''){
			$val = $dbmysql->query($sql);
                        
//                          saveauditoria('',$_POST['DNK_DOCUMENTO_id'],$_SESSION["user_id"],'Guardar Liquidacion');
//			insertactividaddoc(6,$_POST['DNK_DOCUMENTO_id']);
//			save_responsable(6,$_POST['DNK_DOCUMENTO_id'],$_SESSION['user_id']);
//                        if($_POST['observacion_cli']!='')
//                            guardar_observaciones($_POST['DNK_DOCUMENTO_id'],6,$_SESSION['user_id'],date('Y-m-d'),'Externo',$_POST['observacion_cli'],$_POST['id_observacion']);
			//mailsend($_POST['DNK_DOCUMENTO_id'],$url);
		}else{
                        if($val_insertado->estado_contacto=='I' and $estado=='A'){
                            $sql="UPDATE `dnk_notificacion_mail` SET  
                                    `estado_contacto` = 'A',
                                    `email_contacto` = '{$_POST['email'][$key]}' WHERE `id` = '$val_insertado->id';";
                            $val = $dbmysql->query($sql);
                        }else{
                            if($estado=='I'){
                                $sql="UPDATE `dnk_notificacion_mail` SET  
                                    `estado_contacto` = 'I' WHERE `id` = '$val_insertado->id';";
                                $val = $dbmysql->query($sql);
                            }else{
                            $sql="UPDATE `dnk_notificacion_mail` SET  
                                    `email_contacto` = '{$_POST['email'][$key]}' WHERE `id` = '$val_insertado->id';";
                            $val = $dbmysql->query($sql);
                            }
                        }
                }
            }
    }
		if ($val){
        	$_SESSION['guardar'] = 0;
          $msg = '<p style="font-size:11px">El proceso fue completado correctamente </p>';
          
	    }
    	else
          $msg = '<p style="font-size:11px">El proceso no se completado correctamente </p>';
		
        return $msg;

}
        function grabanotificacion($proceso,$codigo_tramite,$actividad){
            global $dbmysql;

            $date=  date('Y-m-d H:i:s');
            $envio_mail=mailingresotramite($codigo_tramite,$actividad);
            if($envio_mail==''){
            $sql = "INSERT INTO `dnk_notifica_cliente` (
                    `DNK_PROCESOS_id` ,
                    `DNK_DOCUMENTO_codigo` ,
                    `DNK_ACTIVIDAD_id` ,
                    `usu_id` ,
                    `fechahora_notifica`
                    )
                    VALUES (
                    '$proceso', '$codigo_tramite', '$actividad', '{$_SESSION['user_id']}', '$date'
                    );";

            if ( $_SESSION['guardar'] == 1 ){
                $val = $dbmysql->query($sql);
                $_SESSION['guardar'] = 0;
            }
            }
}
        // ENVIO DE MAIL DE NOTIFICACION ///
        function mailingresotramite($id_documento,$actividad){
		global $dbmysql;
                    $act="SELECT * FROM `dnk_actividad` WHERE id=$actividad";
                    $val_act = $dbmysql->query($act);
                    $valac=$val_act->fetch_object();
                        $actividad_local=$valac->localizacion;
                    $retval =textomails($id_documento,$actividad);
                 //************************************//
                 //     OBTENER CONTACTOS DE ENVIO     //
                 //************************************//
                    
                $sql_contactos = "SELECT * FROM `dnk_notificacion_mail`WHERE DNK_DOCUMENTO_codigo='$id_documento' AND `estado_contacto`='A'";
                $contactos = $dbmysql->query($sql_contactos);
                 //************************************//
                 //     OBTENER RESPONSABLE DE TRAMITE   //
                 //************************************//
                
                 $sql_respon= "SELECT d.*,u.usu_nombre, u.email FROM `dnk_documento` d,`usuario` u WHERE d.usuario_id=u.usu_id AND codigo='$id_documento'";
                 if($actividad_local=='I'){
                     $sql_respon .=" AND lugar_contacto='I'";
                 }
                 $responsables = $dbmysql->query($sql_respon);
                 $responsable=$responsables->fetch_object();
                 
                 //************************************//
                 //     OBTENER SUBJECT                //
                 //************************************//
                 $subject=crear_subject($id_documento);
                 
                 //************************************//
                 //     OBTENER ADJUNTOS                //
                 //************************************//
                 $sql_adjuntos = "SELECT a.localizacion,tpd.tipo_doc_desc,d.* 
                                    FROM `dnk_doc_escaneados`d,  `dnk_tpdoc_escaneado` tpd, `dnk_actividad` a  
                                    WHERE a.id=d.DNK_ACTIVIDAD_id AND d.`DNK_TPDOC_ESCANEADOS_id`=tpd.tipo_doc_id AND d.`DNK_DOCUMENTO_codigo` ='$id_documento' AND DNK_ACTIVIDAD_id=$actividad";
                  //AND d.`DNK_TPDOC_ESCANEADOS_id` IN(6,13,46,57,11,44,73,74,75)
                 $adjuntos = $dbmysql->query($sql_adjuntos);
//                 echo $sql_adjuntos; exit();                       
                                        
         include_once("class.phpmailer.php");
                $mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch

                $mail->IsSMTP(); // telling the class to use SMTP
                try {
                  $mail->Host       = "mail.iblack.com.ec"; // SMTP server
                  $mail->SMTPAuth   = TRUE;                  // enable SMTP authentication
                  $mail->Host       = "mail.iblack.com.ec"; // sets the SMTP server
                  $mail->Port       = 26;                    // set the SMTP port for the GMAIL server
                  $mail->Username   = "wespinosa@iblack.com.ec"; // SMTP account username
                  $mail->Password   = "Walejandro86";        // SMTP account password
                  $mail->AddReplyTo($responsable->email, $responsable->usu_nombre);
                  while($contacto=$contactos->fetch_object()){
                        $mail->AddAddress( $contacto->email_contacto,$contacto->nombre_contacto);
                    }
                  //$mail->AddBCC( $correo->email,$correo->usu_nombre);
                  $mail->SetFrom('info@denkelservice.com', 'DENKEL SERVICE S.A.');
                  $mail->Subject = $subject;
                  $mail->MsgHTML($retval);
                  $path=$_SERVER['DOCUMENT_ROOT'] .'/DenkelService/';
                  while($adjunto=$adjuntos->fetch_object()){
                      if($actividad_local=='I'){
                        $mail->AddAttachment($path.$adjunto->path,$adjunto->nombre_almacenado);
                      }elseif($adjunto->localizacion=='E'){
                        $mail->AddAttachment($path.$adjunto->path,$adjunto->nombre_almacenado);
                      }
                  }
                  $mail->Send();
                 } catch (phpmailerException $e) {
                    $error= $e->errorMessage(); //Pretty error messages from PHPMailer
                } catch (Exception $e) {
                    $error= $e->getMessage(); //Boring error messages from anything else!
                }
                echo $error;
 		return ($error!='')?$error:'';
	}
        function insertar_notificacion_interna($codigo,$usuario,$mail,$tipo,$rol,$estado){
            global $dbmysql;
            $sql = "INSERT INTO `dnk_notificacion_mail` (
                                            `id` ,
                                            `DNK_DOCUMENTO_codigo` ,
                                            `nombre_contacto` ,
                                            `email_contacto` ,
                                            `lugar_contacto` ,
                                            `rol_id` ,
                                            `estado_contacto`
                                            )
                                            VALUES (
                                            NULL , '$codigo', '$usuario', '$mail', '$tipo','$rol','$estado'
                                            );
                                            ";
                                            if ( $_SESSION['guardar'] == 1 ){
                                                $sql_insertado="SELECT * FROM `dnk_notificacion_mail` WHERE `DNK_DOCUMENTO_codigo`='$codigo' AND `nombre_contacto`='$usuario'";
                                                $val_insertados = $dbmysql->query($sql_insertado);
                                                $val_insertado = $val_insertados->fetch_object();
                                                $nom_buscar=$val_insertado->nombre_contacto;
                                                if($nom_buscar==''){
                                                    $val = $dbmysql->query($sql);
                                                }else{
                                                        if($val_insertado->estado_contacto=='I' and $estado=='A'){
                                                            $sql="UPDATE `dnk_notificacion_mail` SET  
                                                                    `estado_contacto` = 'A',
                                                                    `email_contacto` = '$mail' WHERE `id` = '$val_insertado->id';";
                                                            $val = $dbmysql->query($sql);
                                                        }else{
                                                            if($estado=='I'){
                                                                $sql="UPDATE `dnk_notificacion_mail` SET  
                                                                    `estado_contacto` = 'I' WHERE `id` = '$val_insertado->id';";
                                                                $val = $dbmysql->query($sql);
                                                            }else{
                                                            $sql="UPDATE `dnk_notificacion_mail` SET  
                                                                    `email_contacto` = '$mail' WHERE `id` = '$val_insertado->id';";
                                                            $val = $dbmysql->query($sql);
                                                            }
                                                        }
                                                }
                                                }
                                            
        }
        function insertar_Solicitud(){
            global $dbmysql;
             date_default_timezone_set('America/Bogota');
            $codigo_tramite=$_POST['codigo_tramite'];
            $codigo_cliente=$_POST['codigo_cliente'];
            $codigo=$_POST['codigo_solicitud'];
            $fecha=$_POST['fecha_solicitud'];
            $hora=date('H:i:s');
            $date=date('Y-m-s H:i:s');
            $motivo=$_POST['motivo_solicitud'];
            $anticipo=$_POST['anticipo_solicitud'];
            $valortotal=$_POST['valtotal_solicitud'];
            $viapago=$_POST['viapago_solicitud'];
            $tipocuenta=$_POST['tipocuenta_solicitud'];
            $banco=$_POST['banco_solicitud'];
            $numerocuenta=$_POST['numerocuenta_solicitud'];
            $beneficiario=$_POST['beneficiario_solicitud'];
            $cedula=$_POST['cedula_solicitud'];
            $observacion=$_POST['observacion_solicitud'];
            
            
            $sql = "INSERT INTO `dnk_solicitud_egreso` (
                        `id_solicitud` ,
                        `fecha_solicitud` ,
                        `hora_solicitud` ,
                        `motivo_solicitud` ,
                        `anticipo_solicitud` ,
                        `valtotal_solicitud` ,
                        `viapago_solicitud` ,
                        `tipocuenta_solicitud` ,
                        `banco_solicitud` ,
                        `numcuenta_solicitud` ,
                        `beneficiario_solicitud` ,
                        `cedula_solicitud` ,
                        `observacion_solicitud` ,
                        `DNK_DOCUMENTO_codigo` ,
                        `DNK_CLIENTE_id`,
                        `estado_solicitud`
                        )
                        VALUES (
                        '$codigo', '$fecha', '$hora', '$motivo', '$anticipo', '$valortotal', '$viapago', '$tipocuenta', '$banco', '$numerocuenta', '$beneficiario', '$cedula', '$observacion', '$codigo_tramite', '$codigo_cliente','A'
                        );";
             if ( $_SESSION['guardar_solicitud'] == 1 ){
                   $val = $dbmysql->query($sql);
                            $valor=($anticipo==0)?$valortotal:$anticipo;
                            $sql2="INSERT INTO  `dnk_procesos` (
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
                                    NULL ,  '$codigo_tramite',  '12',  'Creacion Solicitud:$codigo, por el Valor de:$ $valor','$codigo',  '{$_SESSION["user_id"]}',  '$date','P'
                                    );";
                             $rows = $dbmysql->query($sql2);
                             $up_sql="UPDATE `dnk_usuario_solicitud` SET 
                                        `sol_secuencia` = '$codigo' 
                                      WHERE `usu_codigo` ={$_SESSION["user_id"]};";
                              $rows_up = $dbmysql->query($up_sql);        
                        
//                             echo $_SESSION['guardar']; exit;
                           
                            
                             
                             $_SESSION['guardar_solicitud'] = 0;
                             
                        }
//                                       echo $sql;
        }
        function actualiza_Solicitud($codigo,$op){
            global $dbmysql;
            if($op !='anular'){
            $sql="UPDATE `dnk_solicitud_egreso` SET  
                    `observacion_solicitud` = '{$_POST['observacion']}' WHERE `id_solicitud` = '$codigo';";
                      
            }else{
                 $sql="UPDATE `dnk_solicitud_egreso` SET  
                    `estado_solicitud` = 'N' WHERE `id_solicitud` = '$codigo';";
            }
            $rows = $dbmysql->query($sql);  
        }
        function insertar_gasto($codigo_tramite,$factura,$descripcion,$valor){
            global $dbmysql;
            $fecha=date('Y-m-d');
            $sql="INSERT INTO  `db_denkel`.`dnk_documento_gasto` (
                        `id` ,
                        `DNK_DOCUMENTO_codigo` ,
                        `factura`,
                        `fecha` ,
                        `descripcion`,
                        `valor`
                        ) VALUES (NULL ,'$codigo_tramite','$factura','$fecha','$descripcion','$valor');";
            if ( $_SESSION['guardar'] == 1 ){
                $val = $dbmysql->query($sql);
            }
        }
        function crear_subject($tramite){
            global $dbmysql;
            $sql = "SELECT ciu.abreviatura AS ciudad, c.nombre AS cliente,p.nombre AS proveedornom,d.* 
                    FROM `dnk_documento` d, `dnk_cliente` c, `dnk_cliente` p, `dnk_ciudad` ciu 
                    WHERE d.`DNK_CLIENTE_id`=c.id AND p.id=d.`proveedor` AND ciu.id=d.`ciudad_id` AND `codigo`='$tramite'";
            $vals = $dbmysql->query($sql);
            $val=$vals->fetch_object();

                $cliente=$val->cliente;
                $proveedor=$val->proveedornom;
                $refcliente=$val->num_ref_cliente;
                $distrito=$val->ciudad;
            
            $subject=$tramite.'//'.$cliente.'//'.$proveedor.'//'.$refcliente.'///'.$distrito;
            return $subject;
        }
        function textomails($id_documento,$actividad){
            global $dbmysql;
            switch ($actividad){
                case 1://Apertura de DK
                    $retval = '<div><img src="images/logodenkel.jpg" alt="" width="132" height="89" /></div>
                            <div>
                              <p>Estimado Cliente,</p>
                              <p>&nbsp;</p>
                            </div>
                            <div>
                              <p>Se Realiza la apertura del Presente Email con el objeto de dar inicio al proceso de la referencia.</p>
                              <p>&nbsp;</p>
                            </div>
                            <table width="50%" border="0" align="center" cellpadding="0" cellspacing="3"  style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:11px">';
                        $sql = "SELECT  doc.`id` AS DNK_DOCUMENTO_id,
                                        doc.`codigo` AS DNK_DOCUMENTO_codigo,
                                        doc.`num_ref_cliente` AS DNK_DOCUMENTO_referencia, 
                                        doc.`fecha` AS DNK_DOCUMENTO_fecha, 
                                        doc.`hora` AS DNK_DOCUMENTO_hora, 
                                        cli.`id` AS DNK_CLIENTE_id,
                                        cli.nombre AS DNK_CLIENTE_nombre, 
                                        cli.ruc AS DNK_CLIENTE_ruc, 
                                        prov.nombre AS DNK_PROVEEDOR_nombre, 
                                        tpc.descripcion AS DNK_TP_CARGA_descripcion, 
                                        tpd.descripcion AS DNK_TP_DOCUMENTO_descripcion, 
                                        usu.usu_nombre AS usuario_nombre,
                                        usu.usu_id AS usuario_id
                                FROM `dnk_documento` doc, dnk_cliente cli, dnk_cliente prov, dnk_tp_carga tpc,dnk_tp_documento tpd, usuario usu
                                WHERE doc.`DNK_CLIENTE_id` = cli.id
                                AND doc.`proveedor` = prov.id
                                AND doc.`id_tp_carga` = tpc.id
                                AND doc.DNK_TP_DOCUMENTO_id = tpd.id
                                AND doc.`usuario_id` = usu.usu_id
                                AND doc.codigo ='$id_documento'";
                                        $rows = $dbmysql->query($sql);
                                        $row=$rows->fetch_object();
                        $retval .= '
                        <tr bgcolor="#D7F2FF">
                                <td bgcolor="#D7F2FF"><strong>Importador</strong></td>
                                <td>'.$row->DNK_CLIENTE_nombre.'</td>
                                <td><strong>RUC</strong></td>
                                <td>'.$row->DNK_CLIENTE_ruc.'</td>
                        </tr>
                        <tr>
                                <td><strong>Numero del DK</strong></td>
                                <td color="RED"><strong>'.$row->DNK_DOCUMENTO_codigo.'</strong></td>
                                <td><strong>Fecha</strong></td>
                                <td>'.$row->DNK_DOCUMENTO_fecha .' '.$row->DNK_DOCUMENTO_hora.'</td>
                        </tr>
                        <tr bgcolor="#D7F2FF">
                                <td><strong>Numero de referencia</strong></td>
                                <td>'.$row->DNK_DOCUMENTO_referencia.'</td>
                                <td></td>
                                <td></td>
                        </tr>
                        <tr>
                                <td><strong>Carga</strong></td>
                                <td>'.$row->DNK_TP_CARGA_descripcion.'</td>
                                <td><strong>Documento</strong></td>
                                <td>'.$row->DNK_TP_DOCUMENTO_descripcion.'</td>
                        </tr>
                        <tr bgcolor="#D7F2FF">
                                <td><strong>Operador Responsable</strong></td>
                                <td>'.$row->usuario_nombre.'</td>
                                <td><strong>Proveedor</strong></td>
                                <td>'.$row->DNK_PROVEEDOR_nombre.'</td>
                        </tr>';

                        $retval .= '</table>
                        <p>&nbsp;</p>
                        <div>
                          <p>Durante   diferentes etapas, este email sera el medio mediante el cual cada uno   de los operadores de nuestra representada, notificaran informacion de   trascendencia para el control y conocimiento de las partes que   intervienen, para su efectivo control y/o instruccion de ser el caso.</p>
                          <p>Agradecemos   que cualquier detalle sobre la referencia sea transmitido bajo este   mismo "Subject"-"Asunto" y que se mantenga en copia a las personas que   por necesidad operativa se han anadido a este remitente.</p>
                          <p>De   la misma forma, notificaciones de Aviso-Llegada / Informacion   Portuaria/ Aeroportuaria-Declaraciones de Valor/Liquidaciones aduaneras y   comentarios de trascendencia que no tengan un formato, se enviaran   mediante el presente, para los cuales agradecemos mantener sus   respuestas e indicaciones por este medio asegurando de esta forma su   correcta aplicacion.</span> </p>
                          <p>De esta forma estara ayudandonos a darle un mejor servicio y a canalizar bien sus necesidades.</span></p>
                          <p>Muchas Gracias por confiar en Denkel su importante procedimiento.</span></p>
                          <p>Cordialmente.</span></p>
                          <p><strong>DENKEL</span></strong></p>
                          <p><strong>Supply Chain Services</span></strong></p>
                          <p><strong>Ecuador</span></strong></p>
                        </div>';
                    break;
                case 2://inicio de Procesos
                    setlocale(LC_ALL,"es_ES");
                    $fecha= strftime("%A %d de %B del %Y");
                        $hora=date('H:i');
                        $retval = '<div><img src="images/logodenkel.jpg" alt="" width="132" height="89" /></div>
                            <div>
                              <p>Estimado Cliente,</p>
                              <p>&nbsp;</p>
                            </div>
                            <div>
                              <p>Por medio del presente comunicado, deseamos notificarle que se ha completado toda la documentación necesaria para su pedido y por tanto procederemos inmediatamente a realizar las diligencias necesarias para emitir la declaración aduanera de su importación y/o exportación.</p>
                              <p>Fecha: '.$fecha.'</p>
                              <p>Hora: '.$hora.'</p>
                            </div>
                            <table width="50%" border="0" align="center" cellpadding="3" cellspacing="3"  style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:11px; border-color:#F00; border-width:0.5px; border-style:dotted;">';
                        $sql = "SELECT tpd.tipo_doc_desc,d.* FROM `dnk_doc_escaneados`d,  `dnk_tpdoc_escaneado` tpd  
                                WHERE d.`DNK_TPDOC_ESCANEADOS_id`=tpd.tipo_doc_id AND d.`DNK_DOCUMENTO_codigo` ='$id_documento'";
                         //AND d.`DNK_TPDOC_ESCANEADOS_id` IN(6,13,46,57,11,44,73,74,75)
                                        $rows = $dbmysql->query($sql);
                                        
                        $retval .= '
                        <tr bgcolor="#D7F2FF">
                                <td bgcolor="#D7F2FF"><strong>Documento</strong></td>
                                <td><strong>Número</strong></td>
                        </tr>';
                        WHILE($row=$rows->fetch_object()){
                        $retval .= '<tr>
                                        <td>'.$row->tipo_doc_desc.'</td>
                                        <td> '.$row->id.'</td>
                                    </tr>';
                        }
                        $retval .= '</table>
                        <p><strong>INFORMACIÓN A CONSIDERAR:</strong></p>
                        <div>
                          <p>Los documentos que se adjuntan van a ser los que Denkel use para su declaración aduanera, teniendo en cuenta el proceso, estos documentos serán remitidos a la autoridad y será imposible modificarlos, agradecemos comunicar en caso de que alguno estuviere erróneo o no fuera acorde a su pedido.</p>
                          <p>Esperamos que esta información sea de utilidad para el correcto desenvolvimiento de su proceso.</p>
                          <p>Muchas Gracias por confiar en Denkel su importante procedimiento.</span></p>
                          <p>Cordialmente.</span></p>
                          <p><strong>DENKEL</span></strong></p>
                          <p><strong>Supply Chain Services</span></strong></p>
                          <p><strong>Ecuador</span></strong></p>
                        </div>';
                    break;
                
                default :
                    $retval='Texto a Prueba';
                    break;
            }
            
            return $retval;
        }
        function insertar_rechazada($codigo_proceso,$codigo_proceso_rechazo,$descripcion){
             global $dbmysql;
             $date1=date('Y-m-d H:i:s');
             $consulta="SELECT * FROM `dnk_procesos` WHERE proces_id=$codigo_proceso";
             $val_consultas = $dbmysql->query($consulta);
             $val_con=$val_consultas->fetch_object();
                $codigo_tramite=$val_con->proces_codigo;
               
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
                NULL ,  '$codigo_tramite',  '$codigo_proceso_rechazo',  '$descripcion',NULL , '{$_SESSION["user_id"]}','$date1','A');";
                $rows = $dbmysql->query($sql);
        }
        function actualiza_estado_proceso($codigo,$codigo_proceso,$estado){
            global $dbmysql;
             $date1=date('Y-m-d H:i:s');
            $sql="UPDATE  `dnk_procesos` SET
                    `proces_estado`='$estado'
                  WHERE `proces_id`=$codigo_proceso AND `proces_codigo`='$codigo'";
                $rows = $dbmysql->query($sql);
        }
        function insertar_factura(){
             global $dbmysql;
              date_default_timezone_set('America/Bogota');
              $codigo_tramite=$_POST['codigo_tramite'];
              $date=date('Y-m-s H:i:s');
              $valor=$_POST['subtotal'];
              $sql2="INSERT INTO  `dnk_procesos` (
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
                                    NULL ,  '$codigo_tramite',  '31',  'Se cargan las facturas sumando un total de:$ $valor','',  '{$_SESSION["user_id"]}',  '$date','A'
                                    );";
                             $rows = $dbmysql->query($sql2);
            
        }