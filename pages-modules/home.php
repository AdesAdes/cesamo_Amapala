<?php
    if(isset($_GET['content'])){
        $content = $_GET['content'];
    }
    else{
        $content = 'home';
    }
    require_once("pages-modules/navbar.php");
?>

<div class="container-fluid" >
<div class="row">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-md-12">
                <div class="featurette">
                    <img class="featurette-image  pull-left" src="images/background-form-login.png">
                </div>
            </div>
        </div>
    </div>  
</div>