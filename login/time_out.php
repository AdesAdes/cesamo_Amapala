<!DOCTYPE html>
<!--
Ingeniería del software
-->
<?php
if(!isset($_SESSION['time_out']))
  {
    $_SESSION['time_out'] = time();
  }
else
  {
    $tiempo = $_SESSION['time_out'];

    if (time() >  $tiempo + 60*1) 
      {
       // session timed out
        // // $_SESSION['contenido'] = $contenido;
        
        // session_destroy();

        // header("location:../login/ckeckout.php");
      }
    else
      {
        $_SESSION['time_out'] = time();
      }
  }

?>