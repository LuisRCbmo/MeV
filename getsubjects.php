<?php

include("conection.php");
$semest=$_POST['semestre'];

$queryS="SELECT DISTINCT cod_cls, name FROM class WHERE semester='$semest' ORDER BY name ASC";
$resultS=pg_query($db,$queryS) or die("no se pudo conectar consulta");
$html="";
while($mat=pg_fetch_array($resultS)){
    $html= "<option value='".$mat['cod_cls']."'>".$mat['name']."</option>";
    echo $html;
}
?>