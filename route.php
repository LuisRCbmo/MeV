<?php

include("conection.php");

$place=$_POST['imin'];
$nplace=$_POST['wannago'];

$placeo="SELECT * FROM classroom where cod_cl='$place'";
$fplace= pg_query($db,$placeo) or die("primer lugar");
$im=pg_fetch_array($fplace);
$imin=$im['ubication'];

$places="SELECT * FROM classroom where cod_cl='$nplace'";
$splace= pg_query($db,$places) or die ("segundo lugar");
$t=pg_fetch_array($splace);
$wnn=$t['ubication'];

$question="SELECT * FROM c_map where ubication='$imin' and destiny ='$wnn'";
$ruta= pg_query($db,$question);
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Mapa</title>
        <link rel="icon" href="image/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/styleIrA.css">
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/style2.css">
        <link rel="stylesheet" href="css/mapstyle.css">
        <link rel="stylesheet" href="css/modelviewer.css">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script src="https://unpkg.com/@webcomponents/webcomponentsjs@2.1.3/webcomponents-loader.js"></script>
        <script src="https://unpkg.com/intersection-observer@0.5.1/intersection-observer.js"></script>
        <script src="https://unpkg.com/resize-observer-polyfill@1.5.0/dist/ResizeObserver.js"></script>
        <script src="https://unpkg.com/@magicleap/prismatic/prismatic.min.js"></script>
    </head>
    <body>
        <header> 
            <nav class="navbar">
                <a href="#" class="navbar-brand">
                    <ul class="nav-links">
                        <li><a href="index.html" >Inicio</a></li>
                        <li><a href="search.html">Buscar Aula</a></li>
                        <li><a href="map.html">Mapa</a></li>
                        <li><a href="login.html">Iniciar Sesion</a></li>
                    </ul>
                    <button class="navbar-toggler">
                        <span></span>
                      </button>
            </nav>
    </header>
        <div class="wrapper">
            <div id="card">
<?php
if($rutas=pg_fetch_array($ruta)){
echo '<model-viewer src="'.$rutas['cod_map'].'"';
}else{

$nq="SELECT * FROM c_map where ubication='$wnn' and destiny ='$imin'";
$nr= pg_query($db,$nq);
if($nrs= pg_fetch_array($nr)){
    echo '<model-viewer src="'.$nrs['cod_map'].'"';
}}
?>
                    background-color="#ff0000"
                    alt="Wooden Eagle"
                    shadow-intensity="2"
                    camera-controls
                    auto-rotate ar>
                </model-viewer>
            </div>
            <div id="names">
                <h2>Leyenda</h2>
                <ul>
                    <li>Edificio Central: amarillo</li>
                    <li>Edificio Academico 2: Guindo</li>
                    <li>Edificio Gallinero: rojo</li>
                    <li>Edificio 607: Gris</li>
                    <li>Edificio 612: Cafe</li>
                    <li>Edificio 617: Rosa</li>
                    <li>Edificio 622: Azul</li>
                    <li>Edificio 623: celeste</li>
                    <li>Edificio 624: Azul marino</li>
                </ul>
            </div>
            <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.js"></script>
        </div>
        <style>
            @media screen and (max-width: 799px){
                .wrapper{
                margin-top: 15%;
                margin-bottom: 10%;
            }
            }
        </style>
        <footer>
            <div>
                <p>For You </p>
                <p>Made with ♡ </p>
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