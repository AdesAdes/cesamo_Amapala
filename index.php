<!DOCTYPE html>
<!--
Ingeniería del software
-->
<?php
    include 'login/security.php';
    include 'login/time_out.php';
    
    require_once ('pages-modules/head.php');
?>

<div id="principalContainer">
    <?php
    if(!isset($_GET['content'])){
        require_once("pages-modules/home.php");
    }
    else{
        $content = $_GET['content'];
    }
?>
</div>