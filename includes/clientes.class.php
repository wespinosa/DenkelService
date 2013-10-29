<?php

class clientes {
         
    public function __construct() {
        $dbhost='localhost';
        $dbuser='root';
        $dbpass='';
        $dbname='DB_denkel';
        mysql_connect($dbhost,$dbuser,$dbpass);
        mysql_select_db($dbname);
    }






    public function buscarcliente($nombre,$tipo){
               $datos = array();
               if($tipo==1){
                   $msql="nombre LIKE '%$nombre%'";
                   $op=1;
               }else
                   $msql="ruc = '$nombre'";
		
                $sql = "SELECT * FROM dnk_cliente WHERE ".$msql;
//               echo $sql; exit;
                $rows = mysql_query($sql);
		while ( $row = mysql_fetch_array($rows)){
                        $val=($op==1)?$row['nombre']:$row['ruc'];
                        $datos[]=array("value" => $val,
                                        "id" => $row['id'],
                                        "direccion" => $row['direccion'],
                                        "id_tipo_cliente" => $row['id_tipo_cliente'],
                                        "telefono" => $row['telefono'],
                                );
           }
          
           return $datos;
    }
    public function buscarCodigo($codigo){
//              $datos = array();
                $sql = "SELECT * FROM dnk_documento WHERE codigo LIKE '%$codigo%'";
//               echo $sql; exit;
                $rows = mysql_query($sql);
		while ( $row = mysql_fetch_array($rows)){
                        $datos[]=array("value" => $row['codigo'],
                                );
           }
          
           return $datos;
    }
   
}
?>
