<?php
include("conection.php");
session_start();

$user=$_POST['username'];
$psw=$_POST['pasw'];

$query= 'SELECT * FROM student WHERE "USER"= $user AND pasword=$psw';
$result=pg_query($db,$query) or die("no se puede realizar la consulta");

if($result->num_rows > 0){
    echo'existe el usuario';
    

}else{
    echo'ingrese un usuario valido';
}

?>