<!DOCTYPE html>
<!--
    Ingeniería del software
-->
<?php
    session_start();
    if (isset($_SESSION['codEmpleado'])) {
        include '../conection/conection.php';
        $user = $_SESSION['codEmpleado'];
        $stmt = $db->prepare("CALL updateLog(0,?)");
        $stmt->execute(array($user));
    }
    $_SESSION = array();
    session_destroy();
    
    function validateError(){
        if(isset($_GET["error"]))
        {
            $accion = $_GET["error"];
            switch ($accion) {
                case 0: printError(0); break;
                case 1: printError(1); break;
                case 2: printError(2); break;
                default: break;
            }
        }
    }
    
    function printError($error){
        $message = "";
        switch ($error) {
            case 0:
                $message = "El usuario ingresado se encuentra en sesión";
                break;
            case 1:
                $message = "Su usuario ha sido deshabilitado, consulte al administrador";
                break;
            case 2:
                $message = "El usuario o contraseña ingresados con incorrectos";
                break;
            default:
                break;
        }
        echo    '<div class="alert alert-danger alert-error">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong> Error! </strong>'.$message.
                '</div>';
   }
 ?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CESAMO AMAPALA</title>
        <meta name = "viewport" content = "width = device-whidth, initial-scale=1">
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="login">
        <div class="container well" id="container-login">
            <div class="row">
                <div class="col-xs-12">
                    <img src="../images/User.png" alt="" class="img-responsive" id="avatar"/>
                </div>
            </div>
            <?php
                validateError();
            ?>
            <form class="login" action="validateLogin.php" method="POST">
                <div class="form-group">
                    <input type="username" class="form-control" placeholder="Ingrese su usuario" name="username" id="username" required autofocus>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Ingrese la contraseña" name="password" id="password" required>
                </div>
                <button class="btn btn-lg btn-success btn-block" type="submit">Iniciar sesión</button>
                <div class="checkbox">
                    <label class="checkbox">
                        <input type="checkbox" value="1" name="remember">No cerrar sesión
                    </label>
                    <p class="help-block"><a href="#">¿No puedes acceder a tu cuenta?</a></p>
                </div>
            </form>
        </div>
        <script src="../bootstrap/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../bootstrap/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
