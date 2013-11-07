<?php
        include_once("../database.inc.php");
        include_once("../logica.inc.php");
        $dbmysql = new database();
        global $dbmysql;
        $sql = "INSERT INTO `dnk_cliente` (
                `id` ,
                `ruc` ,
                `nombre` ,
                `direccion` ,
                `id_tipo_cliente` ,
                `telefono`
                )
                VALUES (
                NULL,'{$_POST['cedula']}', '{$_POST['nombre']}','{$_POST['direccion']}','{$_POST['tipo']}','{$_POST['telefono']}');";
			$val = $dbmysql->query($sql);
                        auditoria('Clientes',$_POST['cedula'],'I');
                        if($_POST['contacto']!=''){
                            $bus_cli="SELECT MAX(id) AS id FROM `dnk_cliente`";
                            $val_cli= $dbmysql->query($bus_cli);
                            $row_cli=$val_cli->fetch_object();
                            $sql_c = "INSERT INTO `dnk_contactos` (
                                    `id` ,
                                    `DNK_CLIENTE_id` ,
                                    `DNK_GERENCIAS_id` ,
                                    `contacto` ,
                                    `email` ,
                                    `celular`
                                    )
                                    VALUES (
                                    NULL,'$row_cli->id', '0','{$_POST['contacto']}','{$_POST['emailc']}','{$_POST['telefonoc']}');";
                                    $val_c = $dbmysql->query($sql_c);
                                    auditoria('Contacto',$_POST['cedula'],'I');
                        }
		 if($val){
        	$resultado ='correcto';
                 }
        	else{
//        	$resultado ='Existe Algun Error... No se Realizo la Insercion..';
                $resultado=$sql;
        	} 
 echo $resultado;
 
?>
