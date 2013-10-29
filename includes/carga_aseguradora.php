<?php
include_once("database.inc.php");
include_once("logica.inc.php");
$dbmysql = new database();
echo "hola mundoooooooooooooooooo";
$aseg = aseguradora();
foreach($aseg as $key=>$value)
{
		echo "<option value=\"$key\">$value</option>";
}
?>