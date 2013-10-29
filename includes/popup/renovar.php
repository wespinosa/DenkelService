<?php
        include_once("../database.inc.php");
	$dbmysql = new database();
$x=$_GET['codigo'];
                
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

<div style="width:100%; height:100%; background-color:#FFF;" id="content_popup">
                        <div style="font-size:11px">
                            <div><a href="javascript:void(0);" title="Cerrar" onclick="popupCssHide();"><img src="images/001_05.gif"></a></div>
                            <div style="font-size:18px; color:#000; margin: 20px;"><strong>Polizas proximas a renovar</strong></div>
                          </div> 
                          <table class="bordered" width="100%" border="0" cellpadding="0" cellspacing="3" style="font-size:11px">
                          <thead>
                            <tr align="center" bgcolor="#000000"  height="10" style="font-size:12px; color:#FFF">
                              <th width="88">ASEGURADO</th>
                              <th width="88">AGENTE </th>
                              <th width="88">POLIZA</th>
                              <th width="88">ASEGURADORA</th>
                            </tr>
                           </thead>
                           <?php
                            $fecha_actual= date('Y-m-d');
                            $fecha_cinco=date('Y-m-d', strtotime('1 month'));
                            $sql = "SELECT c.cl_nombre,c.cl_apellido, u.USU_NOMBRE, u.USU_APELLIDO, u.USU_INICIAL, p.*, a.ase_descripcion, pla.pln_descripcion 
                                    FROM `gbpoliza` p, `gbclientes` c, `gbaseguradora` a, `gbusuario` u, `gbplanes` pla 
                                    WHERE c.cl_identificacion = p.cl_identificacion 
                                    AND p.ase_codigo = a.ase_codigo 
                                    AND p.pln_codigo = pla.pln_codigo 
                                    AND u.USU_CODIGO = p.USU_CODIGO 
                                    AND p.pol_renovacion BETWEEN '$fecha_actual'AND '$fecha_cinco'";
// echo $sql; exit;
                            $val = $dbmysql->query($sql);
                           while ($row = $val->fetch_object()){
                              $estilo='style="border-right-color:#000; border-right-style:dotted; border-right-width:1px; border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"';
                              $estilo2='style="border-bottom-style:dotted;border-bottom-color:#000; border-bottom-width:1px;"'; 
                            ?>
                            <tr align="center">
                                <td><?php echo $row->cl_asegurado?></td>
                                <td><?php echo $row->USU_INICIALES?></td>
                                <td><?php echo $row->POL_CODIGO?></td>
                                <td><?php echo $row->ase_descripcion?></td>
                             </tr>
                             <?php } ?>
                              </table>
<!--                        <table width="40%" height="125" border="0" align="center" cellpadding="0" cellspacing="3" style="font-size:11px">
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
                              <td><?php echo $x; ?></td>
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
                        </table>-->
</div>
<!--<div style="width:100%; height:100%; background-color:#FFF;" id="content_popup">
        <table width="100%" height="224" border="0" >
            <tr>
                <td><a href="javascript:void(0);" title="Cerrar" onclick="popupCssHide();"><img src="images/001_05.gif"></a></td>
                <td >&nbsp;</td>
            </tr>
            <tr>
                <td  colspan="3" align="center"> <h1>Confirma tu Seleccion para: <?php echo $x; ?></h1></td>
                </tr>
            <tr>
                <td  colspan="2" align="center"><div align="center">
                      <p><a href="javascript:void(0);" class="otherbutton" onclick="xajax_xrealizada(<?php echo $x; ?>);popupCssHide();return false"></a></p>
                        <br/><br/></div>
                </td>
            </tr>
             <tr>
                <td  colspan="2" align="center"><div align="center">
                        <p><a href="#" class="otherbutton2" onclick="xajax_xcancelar(<?php echo $x; ?>);return false"></a></p>
                        <br/><br/></div>
                </td>
            </tr>
            <tr>
                <td colspan="2"><div id="verdescripcion"></div></td>
                </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
</div>-->