<?php

include ('conexion.php');
$user=$_POST['username'];
$pass=$_POST['password'];
$db = new MySQL();
$roles = array();
$sql = "select * from usuario where usu_usuario ='".$user."' and usu_pass = MD5('".$pass."') and usu_estado<>2";
$consulta = $db->consulta($sql);
//echo $sql; exit;
// md5($sql)
if($db->num_rows($consulta)>0)
{
	//Vamos a consultar informacion de la BDD necesarias para la sesion
	session_start();

        $_SESSION["autenticado"]= "SI";
	////VARIABLE KE SE DEBE MODIFICAR SI ES KE EL SISTEMA SE INSTALA EN UN HOSTING ONLINE SI ES KE ES NECESARIO
	$_SESSION["NOMBRE_BASE_DATOS"]= "denkelse_DB_denkel"; // nombre por defecto, cambiar de ser necesario
	/// FIN VARIABLE HOSTING ONLINE
	$consulta = $db->consulta("select rol_id from usuario where usu_usuario ='".$user."'");
	$_SESSION["rol"]=mysql_result ($consulta, 0, "rol_id");
           $sql = "select r.rol_desc, u.usu_id, u.usu_nombre,u.usu_usuario from usuario u, rol r where u.rol_id=r.rol_id AND usu_usuario ='".$user."'";
	$consulta = $db->consulta($sql);
	
	while( $row = mysql_fetch_object($consulta)){
		$_SESSION["user_id"]=$row->usu_id;
		$_SESSION["usu_real_nombre"]=$row->usu_nombre;
		$_SESSION["usu_usuario"]=$row->usu_usuario;
                $_SESSION["rol_usuario"]=$row->rol_desc;
                
//		$sql = 'SELECT DNK_ACTIVIDAD_id FROM `DNK_ACTIVIDAD_USUARIO` WHERE usuario_id='.$row->usu_id;
//
//		$_roles = $db->consulta($sql);
//		while( $row = mysql_fetch_object($_roles)){
//			$roles[] = $row->DNK_ACTIVIDAD_id ;
//		}				
//		$_SESSION["rolmenus"] = $roles;
	}

	header ("Location: inicio.php");
	mysql_close($consulta);
}
else
{
	//si no existe se va a login.php
	header("Location: index.php");
}
?>