<?php
session_start();
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */ 

include_once("../database.inc.php");
            $dbmysql = new database();
 date_default_timezone_set('America/Bogota'); 
global $dbmysql;
$fecha=date('Y-m-d');
$hora=date('H:i:s');
$date1=date('Y-m-d H:i:s');
$sql = "INSERT INTO `dnk_documento` (
            `id` ,
            `DNK_CLIENTE_id` ,
            `DNK_GERENCIAS_id` ,
            `codigo` ,
            `num_ref_cliente` ,
            `fecha` ,
            `hora` ,
            `proveedor` ,
            `id_tp_carga` ,
            `via`,
            `DNK_TP_DOCUMENTO_id` ,
            `ciudad_id` ,
            `estado` ,
            `usuario_id` ,
            `fecha_fin`
       )
        VALUES (NULL,
        '{$_POST['cliente']}','','{$_POST['codigo']}', '{$_POST['referencia']}','$fecha','$hora', '{$_POST['proveedor']}', '{$_POST['tipocarga']}', '{$_POST['via']}','{$_POST['servicio']}','{$_POST['distrito']}','1','{$_POST['responsable']}','');";
//        if ( $_SESSION['guardar'] == 1 ){
			$val = $dbmysql->query($sql);
                            $sql_pro="INSERT INTO  `dnk_procesos` (
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
                                    NULL ,  '{$_POST['codigo']}',  '1',  'Se crea DK, y se envia datos al cliente',NULL , '{$_SESSION["user_id"]}','$date1','A');";
                             $rows = $dbmysql->query($sql_pro);
                                    $act="SELECT MAX(proces_id) AS codigo FROM `dnk_procesos` WHERE `proces_codigo`= '{$_POST['codigo']}'";
                                    $val_act = $dbmysql->query($act);
                                    $valac=$val_act->fetch_object();
                                        $proceso=$valac->codigo;
                                  $_SESSION['guardar'] = 1;      
                             grabanotificacion($proceso,$_POST['codigo'],'1');
//                }
		 if($val){
                        $_SESSION['guardar'] = 0;
        	$resultado ='El Tramite '.$_POST['codigo'].' del Cliente '.$_POST['cliente'].' Se Insertado Con Exito!!!';
                 }
        	else{
//        	$resultado ='Existe Algun Error... No se Realizo la Insercion..';
                $resultado='';
        	} 
 echo $resultado;
 
?>
