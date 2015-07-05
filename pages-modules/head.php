
<?php 
    $rol = $_SESSION['codRole'];
    $user = $_SESSION['codEmpleado'];
    if(isset($_GET['content'])){
        $content = $_GET['content'];
    }
    else{
        $content = 'index';
    }
    
    require_once("login/time_out.php");
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>CESAMO AMAPALA</title>
        <meta name = "viewport" content = "width = device-whidth, initial-scale=1">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
        <!-- Aqui van todos los enlaces css necesarios -->
        
        <!-- Estilos css personales -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#options">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Douglas</a>
                </div>
                <div class="collapse navbar-collapse" id="options">
                    <ul class="nav navbar-nav">
                        <li><a href="#">Inicio</a></li>
                    </ul>
                    <ul class="nav navbar-collapse navbar-right">
                        <li><a href="#">Configurar</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Perfil <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="login/login.php">Cerrar sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <script src="bootstrap/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>