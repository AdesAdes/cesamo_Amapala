<!DOCTYPE html>
<!--
    Ingeniería del software
-->
<?php
    if(!isset($_SESSION)) 
	{ 
	  session_start(); 
	}
    include '../conection/conection.php';
    $user = $_POST['username'];
    $password = $_POST['password'];
    
    $stmt = $db->prepare("CALL selectAllUser(?,?)");
    $stmt->execute(array($user, $password));
    $rowCount = $stmt->rowCount();
    
    if ($rowCount == 1){
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($rows as $row){
            $status         =   $row['status'];
            $log            =   $row['log'];
            $codEmpleado    =   $row['codEmpleado'];
            $user           =   $row['userName'];
            $codRole        =   $row['codRole'];
        }
        if($status == 1){
            if($log == 0){
                header('location:../index.php');
                $_SESSION['authenticated'] = '1';
                $_SESSION['user'] = $user;
                $_SESSION['codEmpleado'] = $codEmpleado;
                $_SESSION['time_out'] = time();
                $_SESSION['codRole'] = $codRole;
            }
            else{
                header('location:login.php?error=0');
            }
        }
        else{
            header('location:login.php?error=1');
        }
    }
    else{
        header('location:login.php?error=2');
    }
?>
