<?php
include("conection.php");
session_start();
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="icon" href="image/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/style2.css">
        <link rel="stylesheet" href="css/addStyle.css">
        <script src="js/navbar.js"></script>
        <script src="http://code.jquery.com/jque..."></script>
        <script language="javascript" src="js/jquery-3.5.1.js"></script>
        <script>
          $(document).ready(function(){
              $('#semestres').change(function(){
                  $.ajax({
                      data: "semestre="+$('#semestres').val(),
                      url: 'getsubjects.php',
                      type: 'post',
                      success: function(response){
                          $("#materias").html(response);
                      }
                  });
              })
          })</script>
          <script>$(document).ready(function(){
              $('#materias').change(function(){
                  $.ajax({
                      data: "materia="+$('#materias').val(),
                      url: 'getgroups.php',
                      type: 'post',
                      success: function(response){
                          $("#grupos").html(response);
                      }
                  });
              })
          })</script>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    </head>
    <body>
        <header>
            <div class="menu_bar">
                <a href="#" class="bt-menu"><span class="icon-menu"></span>Menu</a>
            </div>
            <div class="navegador">
                <nav class="nav">
                    <ul class="main-nav" id="js-menu">
                        <li><a href="search.html">Buscar Aula</a></li>
                        <li><a href="map.html">Mapa</a></li>
                        <li><a href="login.html">Cerrar Sesion</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="wrapper">
            <h2>Añadir materia</h2>
            <form action="select.php" method="POST">
                <label for="">Carrera: </label>
                <select name="carreras" id="carreras"><option value="">Informatica</option></select><br>
                <label for="">Semestre:</label>
                <select name="semestres" id="semestres">
                <?php
                   $info_sem="SELECT DISTINCT semester FROM class ORDER BY semester ASC";
                   $get_sem=pg_query($db,$info_sem);
                   while($cl=pg_fetch_array($get_sem)){
                        echo "<option value='".$cl['semester']."'>".$cl['semester']."</option>";
                    }
                ?>
                </select><br>
                <label for="">Materia: </label>
                <select name="materias" id="materias"><option value="">Seleccione materia</option></select><br>
                
                <label for="">Grupo: </label>
                <select name="grupos" id="grupos"><option value="">Seleccione grupo</option></select><br>
                <input id="boton" type="submit" value="Agregar materia">
            </form>
        </div>
        <footer>
            <div>
                <p>For You <br>
                Made with ♡ </p>
                <div class="social">
                    <div id="icon"><a href=""><img width="70" src="image/face.png" alt="Facebook"></a></div>
                    <div id="icon"><a href=""><img width="70" src="image/twitter.png" alt="Twitter"></a></div>
                    <div id="icon"><a href=""><img width="70" src="image/insta.png" alt="Instagram"></a></div>
                    <div id="icon"><a href=""><img width="70" src="image/wp.png" alt="WhatsApp"></a></div>
                </div>
            </div>
            <div id="deep">
                <p>© Copyright TRN Studio Ltd. 2020. · All rights reserved. Registered in Bolivia · Company number +591 65385951</p>
            </div>
        </footer>
    </body>
</html>