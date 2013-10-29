<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


include_once("administrador/includes/database.inc.php");
//include_once("administrador/includes/general.php");
$dbmysql = new database();

		global $dbmysql;
 	$fecha= date('Y-M-d');
        $clave=genera_password(5);
 		$retval = '<div><img src="administrador/images/logodenkel.jpg" alt="" width="132" height="89" /></div>
                            <div>
                            <p><strong>Estimad@, '.$_POST['buscar_usuario'].'</strong></p>
                            <p>&nbsp;</p>
                            </div>
                            <div>
                            <p>Se realiza el Cambio de su contraseña, se le ha asignado una contraseña aleatoria..!!.</p>
                            <p>&nbsp;</p>
                            </div>
                            <table width="50%" border="0" align="center" cellpadding="0" cellspacing="3"  style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:11px">';
 		$sql = "SELECT * FROM `usuario` WHERE `usu_nombre` = '{$_POST['buscar_usuario']}'";
		
 		$rows = $dbmysql->query($sql);
 		$row=$rows->fetch_object();
                $id_usuario=$row->usu_id;
 		$retval .= '
                            <tr bgcolor="#D7F2FF">
                                    <td bgcolor="#D7F2FF"><strong>Nombre Completo</strong></td>
                                    <td>'.$row->usu_nombre.'</td>
                            </tr>
                            <tr>
                                    <td><strong>Usuario</strong></td>
                                    <td>'.$row->usu_usuario.'</td>
                            </tr>
                            <tr bgcolor="#D7F2FF">
                                    <td><strong>Password</strong></td>
                                    <td>'.$clave.'</td>
                            </tr>
                            <tr>
                                    <td><strong>Fecha de Cambio</strong></td>
                                    <td>'.$fecha.'</td>
                            </tr>
                            ';
                $retval .= '</table>
                <p>&nbsp;</p>
               ';
//              
         include_once("administrador/includes/class.phpmailer.php");
                $mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch

                $mail->IsSMTP(); // telling the class to use SMTP
                 
                try {
                  $mail->Host       = "mail.denkelservice.com"; // SMTP server
                  $mail->SMTPAuth   = true;                  // enable SMTP authentication
                  $mail->Host       = "mail.denkelservice.com"; // sets the SMTP server
                  $mail->Port       = 2525;                    // set the SMTP port for the GMAIL server
                  $mail->Username   = "info@denkelservice.com"; // SMTP account username
                  $mail->Password   = "info3822";        // SMTP account password
                  $mail->AddReplyTo('info@denkelservice.com', 'DENKEL S.A.');
                        $mail->AddAddress( $row->email,$row->usu_nombre);
                        $mail->AddAddress( 'sistemas@denkelservice.com','SISTEMAS');
                  $mail->SetFrom('info@denkelservice.com', 'DENKEL SERVICE S.A.');
                  $mail->Subject = 'DENKEL S.A., Cambio de Password';
                  $mail->MsgHTML($retval);
                  $mail->Send();
                
                 } catch (phpmailerException $e) {
                    $error= $e->errorMessage(); //Pretty error messages from PHPMailer
                } catch (Exception $e) {
                    $error= $e->getMessage(); //Boring error messages from anything else!
                } 
                
                //echo saveauditoria('','',$_SESSION["user_id"],'Envio Mail Cambio de Contraseña');
 		echo ($error!='')?$error:'';
                $newclave=$clave;
                //echo actualiza_clave($newclave,$id_usuario);
                $sql="update usuario set usu_pass= MD5('$newclave') where usu_id=".$id_usuario;
                $val = $dbmysql->query($sql);
                header("Location: http://sistema.denkelservice.com");
    ?>          
<?php
 function genera_password($longitud,$tipo="alfanumerico"){

    if ($tipo=="alfanumerico"){
        $exp_reg="[^A-Z0-9]";
    } elseif ($tipo=="numerico"){
        $exp_reg="[^0-9]";
    }
    
    return substr(eregi_replace($exp_reg, "", md5(rand())) .
       eregi_replace($exp_reg, "", md5(rand())) .
       eregi_replace($exp_reg, "", md5(rand())),
       0, $longitud);
}


?>
