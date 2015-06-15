<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>CESAMO AMAPALA</title>
        <link href="bootstrap-3.3.4-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-3.3.4-dist/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-3.3.4-dist/css/estiloPersonal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container well" id="contenedorLogin" >
            <form class="form-horizontal">
                <div class="form-group" id="figura">
                    <img src="http://static.freepik.com/foto-gratis/vector-de-usuario-avatar-icono_279-10313.jpg" id="imagenLogin" alt="" class="img-circle"/>
                </div>
                <div class="form-group">
                <label for="usuario" class="col-sm-4 contro-label">Usuario</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" id="usuarioLogin">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="password" class="col-sm-4 ontro-label">Contraseña</label>
                <div class="col-sm-8">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input type="password" class="form-control" id="contrasenaLogin">
                    </div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox"> Recuerdame
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-success">Iniciar Sesion</button>
                </div>
              </div>
            </form>
        </div>
        <script src="bootstrap-3.3.4-dist/js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.4-dist/js/bootstrap.js" type="text/javascript"></script>
        <script>
          function load() {
            $("#contenedorLogin").css('animation-name','volar');
          }
          window.onload = load;
        </script>
    
    </body>
</html>
