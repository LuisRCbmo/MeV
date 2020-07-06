<?php
include("conection.php");
session_start();
$user=$_POST['username'];
$email=$_POST['email'];
$pass=$_POST['pasw'];
$repass=$_POST['repasw'];

if($user != "" && $email!= "" && $pass!= "" && $repass!= ""){
    if($pass === $repass){
        $datos="INSERT INTO student VALUES('$email','$pass','$user')";
        $conectar=pg_query($db,$datos) or die ("error al introducir datos");
        echo "<head><meta http-equiv='refresh' content='1; url=login.html'></head>";
    }else{
        die('las contraseñas no coinciden<a href="createAcount.html">Volver</a>'); 
    }
}else{
    echo'no se llenaron todos los campos<a href="creatAcount.html">';
}

?>