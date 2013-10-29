<?php

	include_once("database.inc.php");
	include_once('general.inc.php');
	$dbmysql = new database();
	
	function acercade(){
			global $dbmysql;
			
			$retval = '<table width="561" height="427" border="0" align="center" background="images/fondo_acerca_peque.png">
						  <tr>
						    <td width="85">&nbsp;</td>
						    <td width="119">&nbsp;</td>
						    <td width="127">&nbsp;</td>
						    <td width="116">&nbsp;</td>
						    <td width="80">&nbsp;</td>
						  </tr>
						  <tr>
						    <td height="148">&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
						    <td height="83">&nbsp;</td>
						    <td colspan="2"><p align="center">Quito</p>
						    <p align="center">Telf.: 092725859 // 084659676</p></td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
						    <td height="61">&nbsp;</td>
						    <td colspan="2" style="font-style:italic"><p align="center">Todos los derechos reservados </p>
						    <p align="center"><img src="images/LOGO-TRAMAD.png" width="175" height="78" />Version:1.2 </p></td>
						    <td>&nbsp;</td>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
						    <td>&nbsp;</td>
						    <td colspan="2">&nbsp;</td>
						    <td colspan="2"><strong>Licencia:</strong> TEER-QQ12-TTY</td>
						  </tr>
						</table>';
			
			return $retval;
	}
	
	