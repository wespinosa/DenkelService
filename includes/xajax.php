<?php

include_once 'clientes.class.php';
$clientes=new clientes();
$nombre=$_GET['term'];

//$nombre=strtoupper($nombrea);
$modulos = isset($_GET['modulo'])?$_GET['modulo']:'ninguno';
switch ($modulos){

		case 'clientes':
                        $tipos = isset($_GET['tipo'])?$_GET['tipo']:0;
                        $tipo=($tipos==2)?2:1;
			echo json_encode($clientes->buscarcliente($_GET['term'],$tipo));
		break;
                case 'codigo':
			echo json_encode($clientes->buscarCodigo($_GET['term']));
		break;
            
   }

//echo $clientes->buscarcliente($nombre);



