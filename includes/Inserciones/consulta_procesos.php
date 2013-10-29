<?php

include_once("../database.inc.php");
            $dbmysql = new database();
            
            
global $dbmysql;
$codigo_actividad=$_POST['valor'];
$codigo_tramite=$_POST['codigo'];
$codigo_proceso=$_POST['codigo_proceso'];

$sql="SELECT * FROM `dnk_actividad` WHERE id=$codigo_actividad";
$val = $dbmysql->query($sql);
$row=$val->fetch_object();
//DATOS DEL PROCESO ///
    $orden=$row->orden;
    if ($orden<99){
    $descripcion_proceso=$row->descripcion;
    $orden_anterior=$orden-1;
    
    //CONSULTAR DATOS PROCESO ANTERIOR ///
    $sql_ant="SELECT * FROM `dnk_actividad` WHERE orden=$orden_anterior";
    $val_ant = $dbmysql->query($sql_ant);
    $row_ant=$val_ant->fetch_object();
        $codigo_proceso_anterior=$row_ant->id;
        $descripcion_proceso_anterior=$row_ant->descripcion;
        //CONSULTAR SI EL PROCESO TIENE UN PADRE//
        $sql_pa_ant="SELECT * FROM `dnk_procesos_actividad` WHERE DNK_ACTIVIDAD_APROBADA_id ='$codigo_actividad' OR `DNK_ACTIVIDAD_NEGADA_id` = $codigo_actividad";
        $val_pa_ant = $dbmysql->query($sql_pa_ant);
        $row_pa_ant=$val_pa_ant->fetch_object();
        if($val_pa_ant->num_rows==0){
        //CONSULTAR SI YA SE REALIZO EL PROCESO ANTERIOR ///
        $sql_pr_ant="SELECT * FROM `dnk_procesos` WHERE `proces_codigo` ='$codigo_tramite' AND `proces_actividad_id` = $codigo_actividad AND proces_estado<>'N'";
        $val_pr_ant = $dbmysql->query($sql_pr_ant);
        $row_pr_ant=$val_pr_ant->fetch_object();
        if($val_pr_ant->num_rows!=0){
            $resultado='Este proceso ya se realizo..!!';
        }else{
            $sql_pr_ant="SELECT * FROM `dnk_procesos` WHERE `proces_codigo` ='$codigo_tramite' AND `proces_actividad_id` = $codigo_proceso_anterior";
          
            $val_pr_ant = $dbmysql->query($sql_pr_ant);
            $row_pr_ant=$val_pr_ant->fetch_object();
//            $resultado=$sql_pr_ant;
            if($val_pr_ant->num_rows==0){
            $resultado='Debe realizar el proceso: '.$descripcion_proceso_anterior.' antes de continuar con: '.$descripcion_proceso;
            }
        }
      }else{
          $sql_pr_ant="SELECT * FROM `dnk_procesos` WHERE `proces_codigo` ='$codigo_tramite' AND `proces_actividad_id` = $row_pa_ant->DNK_PROCESO_id";
            $val_pr_ant = $dbmysql->query($sql_pr_ant);
            $row_pr_ant=$val_pr_ant->fetch_object();
//            $resultado=$sql_pr_ant;
            if($val_pr_ant->num_rows==0){
            $resultado='Debe realizar el proceso: '.$descripcion_proceso_anterior.' antes de continuar con: '.$descripcion_proceso;
            }
      }
    }else{
        $resultado='';
    }
echo $resultado;
?>
