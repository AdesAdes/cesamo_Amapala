<?php
    SESSION_START();
    if ($_SESSION['authenticated'] != '1') {
        header("location:login/login.php");
        exit;
    }
?>
