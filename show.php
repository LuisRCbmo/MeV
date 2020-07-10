<?php
include("conection.php");
include("login.php");

$use_by=$_SESSION["username"];
$info="SELECT name as clase, full_name as docente,starts as empieza,ends as termina, day as dia,
cod_cl as aula
from student_class,class,schedule, time_of
where student_class.cod_cls=class.cod_cls and student_class.group_of=class.group_of
and class.cod_cls=schedule.cod_cls and class.group_of=schedule.group_of 
and student_class.cod_cls=schedule.cod_cls and student_class.group_of=schedule.group_of
and schedule.cod_ti=time_of.cod_ti AND username='$use_by'";

$clases= pg_query($db,$info);

while($subjets=pg_fetch_array($clases)){
    echo $subjects['name'];
    echo $subjects['full_name'];
    echo $subjects['starts'];
    echo $subjects['ends'];
    echo $subjects['day'];
    echo $subjects['cod_cl'];
}
?>