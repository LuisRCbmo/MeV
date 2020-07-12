<?php
include("conection.php");
session_start();

$user=$_POST['username'];
$psw=$_POST['pasw'];

$query= "SELECT * FROM student WHERE username= '$user' AND password='$psw'";
$result=pg_query($db,$query) or die("no se puede realizar la consulta");

$rows= pg_num_rows($result);
if($rows>0){
    $row=pg_fetch_row($result);
    $_SESSION['correo']=$row[0];
    $_SESSION['password']=$row[1];
    $_SESSION['username']=$row[2];
    echo "<head><meta http-equiv='refresh' content='0; url=show.php'></head>";
}else{
    echo'<head><meta http-equiv="refresh" content="0; url=login.html"></head><script>alert("usuario o contraseña incorrecta")</script>';
}

?>