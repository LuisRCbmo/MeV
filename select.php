<?php
include("conection.php");
session_start();

$Carrera=$_POST['carreras'];
$Semester=$_POST['semestres'];
$Materia=$_POST['materias'];
$Grupo=$_POST['grupos'];

$use_by=$_SESSION['username'];

$Sche="INSERT INTO student_class VALUES('$use_by','$Materia','$Grupo')";
$upload=pg_query($db,$Sche) or die ("error al introducir datos");
echo "<head><meta http-equiv='refresh' content='1; url=show.php'></head>";

?>