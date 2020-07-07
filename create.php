<?php
include("conection.php");
$user=$_POST['username'];
$email=$_POST['email'];
$pass=$_POST['pasw'];
$rpass=$_POST['repasw'];

if($user != "" && $email!= "" && $pass!= "" && $rpass!= ""){
    if($pass === $rpass){
        $clave=md5('$pass');
        $datos="INSERT INTO student VALUES('$email','$clave','$user')";
        $conectar=pg_query($db,$datos) or die ("error al introducir datos");
        echo "<head><meta http-equiv='refresh' content='1; url=login.html'></head>";
    }else{
        die('las contraseñas no coinciden<a href="createAcount.html">Volver</a>'); 
    }
}else{
    echo'no se llenaron todos los campos<a href="creatAcount.html">';
}

?>