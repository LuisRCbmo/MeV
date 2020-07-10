<?php

include("conection.php");
$mate=$_POST['materia'];

$queryM="SELECT DISTINCT group_of FROM class WHERE name='$mate' ORDER BY group_of ASC";
$resultM=pg_query($db,$queryM) or die("no se pudo conectar consulta");
$html="";
while($gro=pg_fetch_array($resultM)){
    $html= "<option value='".$gro['name']."'>".$gro['name']."</option>";
    echo $html;
}
?>