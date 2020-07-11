<?php

include("conection.php");
$mate=$_POST['materia'];

$queryM="SELECT DISTINCT group_of FROM class WHERE cod_cls='$mate' ORDER BY group_of ASC";
$resultM=pg_query($db,$queryM) or die("no se pudo conectar consulta");
$html="";
while($gro=pg_fetch_array($resultM)){
    $html= "<option value='".$gro['group_of']."'>".$gro['group_of']."</option>";
    echo $html;
}
?>