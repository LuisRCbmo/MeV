<?php

  $host="host=bmnuy1syncnwfmr4hz3s-postgresql.services.clever-cloud.com";
  $port="port=5432";
  $dbname="dbname=bmnuy1syncnwfmr4hz3s";
  $user="user=ulxnwds46l6ztfnqk063";
  $pass="password=P8IINRf7OA4VwXDL8KC8";

  $db= pg_connect("$host $port $dbname $user $pass");
   if(!$db){
    echo"Error al conectarse a la base de datos".pg_last_error();
   }

?>