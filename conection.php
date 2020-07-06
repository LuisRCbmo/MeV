<?php

  $host="host=localhost";
  $port="port=5432";
  $dbname="dbname=MeV";
  $user="user=postgres";
  $pass="password=thetripleg18";

  $db= pg_connect("$host $port $dbname $user $pass");
   if(!$db){
    echo"Error al conectarse a la base de datos".pg_last_error();
   }

?>