<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="icon" href="image/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/showcss.css">
        <link rel="stylesheet" href="css/tableStyle.css">
        <script src="js/jquery-3.5.1.js"></script>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    </head>
    <body>
    <header> 
            <div class="cabecera">
                <h1>Movimiento é Vida</h1>
            </div>
            <nav class="navbar">
                <a href="#" class="navbar-brand">
                    <ul class="nav-links">
                        <li><a href="index.html" >Inicio</a></li>
                        <li><a href="search.html">Buscar Aula</a></li>
                        <li><a href="map.html">Mapa</a></li>
                        <li><a href="login.html">Cerrar Sesion</a></li>
                    </ul>
                    <button class="navbar-toggler">
                        <span></span>
                      </button>
            </nav>
        </header>
        <div class="wrapper">
            <h2>Horario</h2>
            <ul class="horario"></ul>
            <a href="insert.php"><input type="button" value="Añadir Materias"></a>
            <table id="dat">
            <thead><tr>
            <td>clase</td>
            <td>docente</td>
            <td>empieza</td>
            <td>termina</td>
            <td>dia</td>
            <td>aula</td>
            </tr></thead>
            <tbody>
<?php
include("conection.php");
session_start();
$use_by=$_SESSION["username"];

$info="SELECT name as clase, full_name as docente,starts as empieza,ends as termina, day as dia,
cod_cl as aula
from student_class,class,schedule, time_of
	where class.cod_cls=schedule.cod_cls and class.group_of=schedule.group_of
	and schedule.cod_ti=time_of.cod_ti
	and student_class.cod_cls=schedule.cod_cls and student_class.group_of=schedule.group_of
	and student_class.cod_cls=class.cod_cls and student_class.group_of=class.group_of
	AND username='$use_by'";

$clases= pg_query($db,$info);

while($subjects=pg_fetch_array($clases)){
    ?>
    <tr>
        <td><?php echo $subjects['clase']; ?></td>
        <td><?php echo $subjects['docente']; ?></td>
        <td><?php echo $subjects['empieza']; ?></td>
        <td><?php echo $subjects['termina']; ?></td>
        <td><?php echo $subjects['dia']; ?></td>
        <td><?php echo $subjects['aula']; ?></td>
    </tr>
    <?php
}
?>
            <tbody></table>
        </div>
        <footer>
            <div>
                <p>For You <br>
                Made with ♡ </p>
                <div class="social">
                    <div id="icon"><a href="meme.html"><img width="70" src="image/face.png" alt="Facebook"></a></div>
                    <div id="icon"><a href="meme.html"><img width="70" src="image/twitter.png" alt="Twitter"></a></div>
                    <div id="icon"><a href="meme.html"><img width="70" src="image/insta.png" alt="Instagram"></a></div>
                    <div id="icon"><a href="meme.html"><img width="70" src="image/wp.png" alt="WhatsApp"></a></div>
                </div>
            </div>
            <div id="deep">
                <p>© Copyright TRN Studio Ltd. 2020. · All rights reserved. Registered in Bolivia · Company number +591 65385951</p>
            </div>
        </footer>
        <script src="js/navbar.js"></script>
    </body>
</html>