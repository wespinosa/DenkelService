<?php
        include_once("../database.inc.php");
	$dbmysql = new database();
$x=$_GET['codigo'];
$sql = "SELECT * FROM  `gbaseguradora` WHERE ASE_CODIGO='$x'";
                      $val = $dbmysql->query($sql);
                       while ($row = $val->fetch_object()){
                           $nombre=$row->ASE_DESCRIPCION;
                       }
 ?>

<script type="text/javascript">
	$(document).ready(function() {
		$('.otherbutton,.otherbutton2').append('<span class="hover"></span>').each(function () {
	  		var $span = $('> span.hover', this).css('opacity', 0);
	  		$(this).hover(function () {
	    		$span.stop().fadeTo(500, 1);
	 		}, function () {
	   	$span.stop().fadeTo(500, 0);
	  		});
		});
	});
</script>

<div style="width:100%; height:100%; background-color:#FFF; margin: 10px" id="content_popup">
                        <table width="40%"  border="1" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
                            <tr>
                                <td colspan="5"><a href="javascript:void(0);" title="Cerrar" onclick="popupCssHide();"><img src="images/001_05.gif"></a></td>
                                <td>&nbsp;</td>
                            </tr>
			    <tr>
			      <td height="30"  colspan="3" bgcolor="#940007" style="font-size:18px; color:#FFF"><strong>&nbsp;&nbsp;Aseguradora</strong></td>
                            </tr>
                            </tr>
                            <tr>
                              <td height="32"><strong>Codigo:</strong></td>
                              <td><?php echo $x; ?>"</td>
                              <td height="31"><strong>Nombre: </strong></td>
                              <td><?php echo $nombre; ?></td>
                            </tr>
			  </table>
                        <table width="40%" height="26" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
                             <tr>
                                <td height="20"  colspan="3" bgcolor="#940007" style="font-size:18px; color:#FFF"><strong>&nbsp;&nbsp;Ingreso de Planes</strong></td>
                                <tr align="center">
                                <td><strong>Iniciales</strong></td>
                                <td><strong>Descripcion</strong></td>
                                <td><strong>Accion</strong></td>
                             </tr>
                            <tr align="center">
                                <td><input name="iniciales" type="text" id="iniciales" size="10" /></td>
                                <td><input name="iniciales" type="text" id="iniciales"/></td>
                                <td><img src="images/mas.png" width="15" height="15" /></td>
                             </tr>
                             <tr>
                                 <td colspan="3"><div id="ShowPlanes">
                                 </div></td>
                             </tr>
                          </tr>
                        </table>
</div>
