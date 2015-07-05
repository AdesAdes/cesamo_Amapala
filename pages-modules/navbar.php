<!DOCTYPE html>
<!--
Ingeniería del software
-->
<?php
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
                    // --------------------------------------------------------------
                    // pagina del - de la recepcionista
                    if($rol == 2){
                        if($content == 'reception'){       
                            echo <<<HTML
                                <li class="active"><a id="reception">Recepción</a></li>
HTML;
                        }
                        else{
                            echo <<<HTML
                                <li><a role="button" id="reception">Recepción</a></li>
HTML;
                        }
                    }
                    // --------------------------------------------------------------  
                    // página del médico
                    if($rol == 3){
                        if($content == 'medical') {
                            echo <<<HTML
                                <li class="active"><a role="button" id="medical">Médico</a></li>
HTML;
                        }
                        else{
                            echo <<<HTML
                                <li><a role="button" id="medical">Médico</a></li>
HTML;
                        }
                    }
                    // --------------------------------------------------------------
                    // página del programa kanguro
                    if($rol == 1){
                        if($content == 'admin'){
                            echo <<<HTML
                                <li class="active"><a role="button" id="adminnv">Administración</a></li>
HTML;
                        }
                        else{
                            $url = 'pages-modules/administration/principal.php?content=admin';
                            echo <<<HTML
                                <li><a role="button" id="adminnv">Administración</a></li>
HTML;
                        }
                    } 
                    // --------------------------------------------------------------
                ?>
           </ul>
        </div>  
     </div> 
</div>