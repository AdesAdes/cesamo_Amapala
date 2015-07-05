<?php 
//definine esta variable temporal para tener un rol cuon el cual trabajar 
  $rol = 100;
?>
<div class="navbar navbar-default" id="subnav">
    <div class="col-md-12">
        <div class="collapse navbar-collapse" id="navbar-collapse2">
            <ul class="nav navbar-nav navbar-left">
                <!-- Generacion del navbar  -->
                <?php
                    // --------------------------------------------------------------
                    if($content == 'home'){
                        echo <<<HTML
                            <li  class="active"><a role='button' id="home" >Inicio</a></li>
HTML;
                    }
                    else{
                        $url = 'home.php';
                        echo <<<HTML
                            <li><a role='button' id="home" >Inicio</a></li>
HTML;
                    }
                    // ----------------------------------------------------------------
                    // pagina del neonatos
                    if($rol == 100 || $rol == 50 || $rol == 30 || $rol == 20){
                        if($content == 'neonatos'){       
                            echo <<<HTML
                                <li class="active"><a id="neonatos">Neonatos</a></li>
HTML;
                        }
                        else{
                            echo <<<HTML
                                <li><a role="button" id="neonatos">Neonatos</a></li>
HTML;
                        }
                    }
    // ----------------------------------------------------------------
             
    // pagina de Reportes
    if($rol == 100 || $rol == 50 || $rol == 30 || $rol == 20){
      if($content == 'reportes') 
      {
        // switch($rol){   
        //   case 100: 
        //     $url = 'pages/Reportes/principal_reportes.php?contenido=reportes';
        //     break;
        // }
          echo <<<HTML
          <li class="active"><a role="button" id="reportes">Reportes</a></li>
HTML;
      }
      else{
        echo <<<HTML
        <li><a role="button" id="reportes">Reportes</a></li>
HTML;
      }
    }

    // ----------------------------------------------------------------------
    if($rol == 100){
    // pagina del programa kanguro
      if($content == 'kanguro'){
        echo <<<HTML
        <li class="active"><a role="button" id="pkanguro">Programa Kanguro</a></li>

HTML;
      }
      else{
          $url = 'pages/Programa_Kanguro/principal_kanguro.php?contenido=kanguro';
          echo <<<HTML
                <li><a role="button" id="pkanguro">Programa Kanguro</a></li>
HTML;
      }
    } 
    // --------------------------------------------------------------------------

    if($rol >= 40){
     // pagina del modulo de gestion de folios
      if($content == 'inventario') {
        $url = 'pages/Inventario/principal_inventario.php?contenido=inventario';
        echo <<<HTML
        <li class="active"><a role="button" id="Inventario" >Inventario</a></li>
HTML;
      }
      else{
        $url = 'pages/Inventario/principal_inventario.php?contenido=inventario';
        echo <<<HTML
        <li><a role='button' id="Inventario"  >Inventario</a></li>
HTML;
        }
    }
    //---------------------------------------------------------------------------- 
?>

           </ul>
        </div>  
     </div> 
</div>