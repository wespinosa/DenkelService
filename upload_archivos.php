<?php
session_start();
        include_once("includes/database.inc.php");
        include_once("includes/logica.inc.php");
	$dbmysql = new database();
        date_default_timezone_set('America/Bogota'); 
?>
<style>
    #reporte_archivos{
        width: 50%;
    }
    #reporte_individual{
        border: solid #0099FF 5px;
        margin: 10px;
        padding: 10px;
        -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
                border-radius: 6px;
        -webkit-box-shadow: 0 1px 1px #666; 
            -moz-box-shadow: 0 1px 1px #666; 
                box-shadow: 0 1px 1px #666;  
    }
    #reporte_individual img{
        padding: 5px;
    }
</style>
<?php        
$retval='<div id="reporte_archivos">';
	if (isset ($_FILES["archivos"])) {
            global $dbmysql;
            $usuario=$_SESSION["user_id"];
            $nombre_archivo=$_POST['nombre'];
            $tipo_archivo=$_POST['tipo_archivo'];
            $tramite=$_POST["codigo"];
            $actividad=$_POST["actividad"];
            $codigo_proceso=$_POST['codigo_proceso'];
            //CONSULTA NOMBRE DE ARCHIVO
            $sql_nom="SELECT * FROM `dnk_tpdoc_escaneado` WHERE tipo_doc_id=$tipo_archivo";
            $rows = $dbmysql->query($sql_nom);
            $row=$rows->fetch_object();
            $tipodocumento=$row->tipo_doc_desc;
            $nom=crear_nombre($tipodocumento);
            $tot = count($_FILES["archivos"]["name"]);
                $destino='uploads/';
                $targetPath = $_SERVER['DOCUMENT_ROOT'] .'/DenkelService/'. $destino;
                $arrayreempla=array("/","");
                $date=date('Ymd');
                    //DATOS DEL ARCHIVO //
                        
                for ($i = 0; $i < $tot; $i++){         
                        $tmp_name = $_FILES["archivos"]["tmp_name"][$i];
                        $name = $_FILES["archivos"]["name"][$i];
                        $archivo_limpio=crear_nombre($name);
                        $type = $_FILES["archivos"][type][$i];
                        $final_name=$date. "-" .$nom.'-'.$archivo_limpio;
                        $archivo= str_replace($arrayreempla," ", $name);
                        $type= explode(".", $archivo);
                        $extension = end($type);
                    //NOMBRE DE LOS ARCHIVOS//
                    //DESCRIPCION DE LA RUTA ///
                    
                   $target =  str_replace('//','/',$targetPath) . $tramite;
                   $path_file = $target;
                     if (!is_dir ( $path_file )){
                            if (!mkdir("$path_file" , 0777)){
                           $tmp_2 = "No se ha creado el file";}
                    }
                    $targetFile=$path_file.'/'.$final_name;
                    $path=$destino.$tramite.'/'.$final_name;
                   $tamano = size($_FILES["archivos"]["tmp_name"][$i]);
                
                   //MUESTRA IMAGENES TUMBS//
                    switch ($extension) {
                            case 'pdf':
                                            $img="<a target='_Blank' href='".$path."'><img src='images/archivos/pdf.png' width='70' height='70'></a>";
                                    break;
                            case 'docx':
                                            $img="<a target='_Blank' href='".$path."'><img src='images/archivos/doc.png' width='70' height='70'></a>";
                                    break;
                            case 'xlsx':
                                            $img="<a target='_Blank' href='".$path."'><img src='images/archivos/xls.png' width='70' height='70'></a>";
                                    break;
                            case 'html':
                                            $img="<a target='_Blank' href='".$path."'><img src='images/archivos/html.png' width='70' height='70'></a>";
                                    break;
                            case 'txt':
                                            $img="<a target='_Blank' href='".$path."'><img src='images/archivos/txt.png' width='70' height='70'></a>";
                                    break;
                            case 'log':
                                            $img="<a target='_Blank' href='".$path."'><img src='images/archivos/log.png' width='70' height='70'></a>";
                                    break;
                            case 'zip':
                                            $img="<a target='_Blank' href='".$path."'><img src='images/archivos/zip.png' width='70' height='70'></a>";
                                    break;

                            default:
                                            $img="<a target='_Blank' href='".$path."'><img src='".$path."' width='70' height='70'></a>";
                                    break;
                    }
                   //DIBUJO DE RESULTADOS //
                   $retval .='<div id="reporte_individual">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="145"><b>Archivo </b> '.$key.' </td>
                                    <td width="397">'.$extension.'</td>
                                    <td width="55" rowspan="4"><div>'.$img.'</div></td>
                                  </tr>
                                  <tr>
                                    <td><b>Tramite Asignado:</b></td>
                                    <td><strong>'.$tramite.'</strong></td>
                                    </tr>
                                  <tr>
                                    <td><b>Peso del Archivo:</b></td>
                                    <td>'.$tamano.'</td>
                                    </tr>
                                  
                                  <tr>
                                    <td><b>Nombre original:</b></td>
                                    <td>'.$name.'</td>
                                    </tr>
                                  <tr>
                                    <td><b>Nombre final:</b></td>
                                    <td>'.$final_name.'</td>
                                    </tr>
                                  <tr>
                                    <td><b>Destino:</b></td>
                                    <td colspan="2">'.$path.'</td>
                                    </tr>
                                </table>
                                <img src="images/regresar.png" border="0" width="150" style="cursor: pointer;margin: 24px 193px 0;" onclick="history.back(-1);"></div>';
       //            copy($tmp_name, $tempruta);
                   grabar($tramite,$actividad,$usuario,$tipo_archivo,$nombre_archivo,$name,$final_name,$path,$tamano,$extension);
                   
                   move_uploaded_file($tmp_name,$targetFile);

//                   }
             }
             grabar_proceso($tot,$tramite,$codigo_proceso,$actividad,$tipodocumento,$nombre_archivo);   
        }
          $retval .='</div>';
           $resultado=  $retval;
	 echo $resultado;
  
         
  function crear_nombre($name){
      $trimmed = trim($name);
      $str = preg_replace('[\s+]',"", $trimmed);
      $cadena = strtolower($str);
      return $cadena;
  }       
  function size($path, $formated = true, $retstring = null){
        if(!is_dir($path) || !is_readable($path)){
            if(is_file($path) || file_exists($path)){
                $size = filesize($path);
            } else {
                return false;
            }
        } else {
            $path_stack[] = $path;
            $size = 0;
           
            do {
                $path   = array_shift($path_stack);
                $handle = opendir($path);
                while(false !== ($file = readdir($handle))) {
                    if($file != '.' && $file != '..' && is_readable($path . DIRECTORY_SEPARATOR . $file)) {
                        if(is_dir($path . DIRECTORY_SEPARATOR . $file)){ $path_stack[] = $path . DIRECTORY_SEPARATOR . $file; }
                        $size += filesize($path . DIRECTORY_SEPARATOR . $file);
                    }
                }
                closedir($handle);
            } while (count($path_stack)> 0);
        }
        if($formated){
            $sizes = array('B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
            if($retstring == null) { $retstring = '%01.2f %s'; }
            $lastsizestring = end($sizes);
            foreach($sizes as $sizestring){
                if($size <1024){ break; }
                if($sizestring != $lastsizestring){ $size /= 1024; }
            }
            if($sizestring == $sizes[0]){ $retstring = '%01d %s'; } // los Bytes normalmente no son fraccionales
            $size = sprintf($retstring, $size, $sizestring);
        }
        return $size;
    }         
  function grabar($codigo,$actividad,$usuario,$tipodocumento,$descripcion,$nombre_original,$nombre_final,$path,$peso,$tipo){
      global $dbmysql;
      $sql="INSERT INTO  `dnk_doc_escaneados` (
                `id` ,
                `DNK_DOCUMENTO_codigo` ,
                `DNK_ACTIVIDAD_id`,
                `usuario_id` ,
                `DNK_TPDOC_ESCANEADOS_id`,
                `descripcion` ,
                `nombre_original` ,
                `nombre_almacenado` ,
                `path` ,
                `size` ,
                `extencion`
                )
            VALUES (NULL ,'$codigo','$actividad','$usuario','$tipodocumento','$descripcion','$nombre_original','$nombre_final','$path','$peso','$tipo');";
      
      $rows = $dbmysql->query($sql);
  }
  function grabar_proceso($tot,$codigo,$codigo_proceso,$actividad,$tipodocumento,$nombre_archivo){
      global $dbmysql;
      $sql_verifica="SELECT a.orden,a.descripcion,p.* 
                     FROM `dnk_procesos` p,`dnk_actividad` a 
                     WHERE a.id=p.`proces_actividad_id` AND p.`proces_codigo` ='$codigo' AND p.`proces_actividad_id` =$actividad AND a.orden<99";
      $vals_verifica = $dbmysql->query($sql_verifica);
      if($vals_verifica->num_rows==0){
      $date=date('Y-m-d H:i:s');
      if($actividad==33){
          $texto="Solicitud de Egreso Cancelada, Documento: $nombre_archivo, cargado al sistema";
          actualiza_estado_proceso($codigo,$codigo_proceso,'A');
          $sql_proceso="SELECT * FROM `dnk_procesos` WHERE proces_id=$codigo_proceso";
          $vals_proceso = $dbmysql->query($sql_proceso);
          $val_proceso=$vals_proceso->fetch_object();
          $codigo_sol_egreso=$val_proceso->proces_solicitud;
          $text_desc_gasto ="Solicitud de Egreso ".$codigo_sol_egreso;        
          //CONSULTAR VALOR DE SOLICITUD
          $sql_solegreso="SELECT * FROM `dnk_solicitud_egreso` WHERE id_solicitud=$codigo_sol_egreso";
          $vals_solegreso = $dbmysql->query($sql_solegreso);
          $val_solegreso=$vals_solegreso->fetch_object();
          $valor_sol_egreso=($val_solegreso->anticipo_solicitud==0)?$val_solegreso->valtotal_solicitud:$val_solegreso->anticipo_solicitud;
          
          insertar_gasto($codigo,'',$text_desc_gasto,$valor_sol_egreso);
      }else{
          $texto="Subidos $tot Documentos Tipo: $tipodocumento, Descripción: $nombre_archivo";
      }
      $sql_actividad="SELECT * FROM `dnk_procesos_actividad` WHERE DNK_PROCESO_id =$actividad";
                $vals = $dbmysql->query($sql_actividad);
                $val=$vals->fetch_object();
                if($vals->num_rows>0){
                    $estado='P';
                }else{
                    $estado='A';
                }
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
                NULL ,  '$codigo',  '$actividad',  '$texto','','{$_SESSION["user_id"]}',  '$date','$estado');";
         $rows = $dbmysql->query($sql2);
      }else{
           $val=$vals_verifica->fetch_object();
           $texto="Subidos $tot Documentos Tipo: $tipodocumento, Descripción: $nombre_archivo";
           $observacion=$val->proces_observacion.' --- '.$texto;
          $sql2="UPDATE  `dnk_procesos` SET
                    `proces_observacion` ='$observacion'
                WHERE `proces_codigo`='$codigo' AND `proces_actividad_id`=$actividad";
         $rows = $dbmysql->query($sql2);
      }
  }
?>