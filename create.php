<?php
include("conection.php");
$user=$_POST['username'];
$email=$_POST['email'];
$pass=$_POST['pasw'];
$rpass=$_POST['repasw'];

if($user != "" && $email!= "" && $pass!= "" && $rpass!= ""){
    if($pass === $rpass){
        $datos="INSERT INTO student VALUES('$email','$pass','$user')";
        $conectar=pg_query($db,$datos) or die ('<script>alert("usuario o correo ya en uso")</script><head><meta http-equiv="refresh" content="0; url=createAcount.html"></head>');
        echo "<head><meta http-equiv='refresh' content='1; url=login.html'></head>";
    }else{
        die('<script>alert("las contraseñas no coinciden")</script><head><meta http-equiv="refresh" content="0; url=createAcount.html"></head>'); 
    }
}else{
    echo'<script>alert("no se llenaron todos los campos")</script><head><meta http-equiv="refresh" content="0; url=createAcount.html"></head>';
}

?>