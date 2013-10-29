<?php
	session_start();
	$_SESSION["autenticado"]= "NO";
	session_destroy();
	
	unset( $_SESSION['usu_id'] );
	unset( $_SESSION['usu_nombre'] );
	unset( $_SESSION['rol_id'] );
	unset( $_SESSION['usu_usuario'] );
	unset( $_SESSION['rolmenus'] );
    
	header("Location:/index.php");
?>