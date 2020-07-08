<?php

include("conection.php");
include("login.php");
session_star();

$consulta="SELECT name as clase, full_name as docente,starts as empieza,ends as termina, day as dia,
cod_cl as aula
from student_class,class,schedule, time_of
where student_class.cod_cls=class.cod_cls and student_class.group_of=class.group_of
and class.cod_cls=schedule.cod_cls and class.group_of=schedule.group_of 
and student_class.cod_cls=schedule.cod_cls and student_class.group_of=schedule.group_of
and schedule.cod_ti=time_of.cod_ti
AND username='$user'";

$res= pg_query($db,$consulta) or die("error al consultar");

?>