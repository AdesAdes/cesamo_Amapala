<!DOCTYPE html>
<!--
Ingeniería del software
-->
<?php
    require_once 'login/time_out.php';
    $rol = $_SESSION['codRole'];
    $user = $_SESSION['codEmpleado'];
    if(isset($_GET['content'])){
        $content = $_GET['content'];
    }
    else{
        $content = 'index';
    }
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
        <nav class="navbar navbar-inverse navbar-fixed-top header">
            <div class="col-md-12">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapses">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="index.php" class="navbar-brand">CESAMO <small>AMAPALA</small></a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <?php
                    //En esta parte se carga la del usuario según su rol
                    if($rol == 1){
                        echo <<<HTML
                                <li class="dropdown">   
                                    <a id ="admin" role="button" class="fa fa-cogs" >
                                        <i class = "glyphicon glyphicon-cog" ></i>
                                            Administración
                                    </a>
                                </li> 
HTML;
                    }  
                    ?>
                    <li class="dropdown">
                        <a id="user" role="button" class="fa fa-cogs">
                            <i class="glyphicon glyphicon-user"></i>
                            <?php echo " ".$user; ?>
                        </a>
                    </li>
                    <li class="dropdown" >
                        <a href="login/login.php">
                            <i class="glyphicon glyphicon-log-out"></i>Salir
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <br><br><br>
        <script src="bootstrap/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="js/functionsNavbar.js" type="text/javascript"></script>
    </body>
</html>