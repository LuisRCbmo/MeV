<?php

include("conection.php");
include("login.php");
session_start();
$class= $_POST[''];
$group= $_POST[''];
$data= "INSERT INTO student_class VALUES('$user','$class','$group')"
$upload= pg_query($db,$data) or die("error al subir los datos");

?>