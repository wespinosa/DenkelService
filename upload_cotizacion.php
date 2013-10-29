<?php
session_start();
        include_once("includes/database.inc.php");
	$dbmysql = new database();
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
	if (isset ($_FILES["archivo_cotizacion"])) {
            global $dbmysql;
            $usuario=$_SESSION["user_id"];
            $codigo_solicitud=$_POST['solicitud'];
                //de se asi, para procesar los archivos subidos al servidor solo debemos recorrerlo
                //obtenemos la cantidad de elementos que tiene el arreglo archivos
                $tramite=$_POST["codigo"];
                $tot = count($_FILES["archivo_cotizacion"]["name"]);
                $destino='uploads/';
                $targetPath = $_SERVER['DOCUMENT_ROOT'] .'/DenkelService/'. $destino;
                $arrayreempla=array("/","");
                $date=date('Ymd');
                
                //este for recorre el arreglo
//                for ($i = 0; $i < $tot; $i++){
                    //DATOS DEL ARCHIVO //
                        $cotizacion=$_POST['cotizacion'];
                        
                        $tmp_name = $_FILES["archivo_cotizacion"]["tmp_name"];
                        $name = $_FILES["archivo_cotizacion"]["name"];
                        $archivo_limpio=crear_nombre($name);
                        $type = $_FILES["archivo_cotizacion"][type];
                        $final_name=$date. "-" .'COT'.'-'.$cotizacion.'-'.$archivo_limpio;
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
                   $tamano = size($_FILES["archivo_cotizacion"]["tmp_name"]);
                   $tamano2=filesize($_FILES["archivo_cotizacion"]["tmp_name"]);
                   if($tamano2>1048576){
                       $retval .='<div id="reporte_individual">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="145"><b>Archivo No subido Pesa mas de 1MB </b></td>
                                    <td width="397">Reintente...</td>
                                    <td width="55" rowspan="4"><div><img src="images/archivos/pdf.png" width="70" height="70"></div></td>
                                  </tr>
                                </table>
                                <img src="images/regresar.png" border="0" width="150" style="cursor: pointer;margin: 24px 193px 0;" onclick="history.back(-1);"></div>';
                   }else{
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
                                        <td>'.$tamano2.'</td>
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
                   grabar($tramite,$usuario,$name,$final_name,$path,$tamano,$extension);
                   grabar_proceso($tramite,$cotizacion,$extension,$codigo_solicitud);
                   move_uploaded_file($tmp_name,$targetFile);

//                   }
             }   
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
  function grabar($codigo,$usuario,$nombre_original,$nombre_final,$path,$peso,$tipo){
      global $dbmysql;
      $sql="INSERT INTO  `dnk_doc_escaneados` (
                `id` ,
                `DNK_DOCUMENTO_codigo` ,
                `usuario_id` ,
                `nombre_original` ,
                `nombre_almacenado` ,
                `path` ,
                `size` ,
                `extencion`
                )
            VALUES (NULL ,'$codigo','$usuario','$nombre_original','$nombre_final','$path','$peso','$tipo');";
      
      $rows = $dbmysql->query($sql);
  }
  function grabar_proceso($codigo,$cotizacion,$tipoarchivo,$codigo_solicitud){
      global $dbmysql;
      $date=date('Y-m-d H:i:s');
      $sql2="INSERT INTO  `dnk_procesos` (
                `proces_id` ,
                `proces_codigo` ,
                `proces_actividad_id` ,
                `proces_observacion` ,
                `proces_solicitud` ,
                `proces_usuario` ,
                `proces_fechahora`
                )
                VALUES (
                NULL ,  '$codigo',  '3',  'Subida la Cotización: $cotizacion, Documento Tipo: $tipoarchivo','$cotizacion',  '{$_SESSION["user_id"]}',  '$date');";
         $rows = $dbmysql->query($sql2);
  }
?>