<?php
    $charset = 'utf8';
    $host = 'localhost';
    $dbname = 'cesamo';
    $username = 'root';
    $password = '';
    $db = new PDO('mysql:host='.$host.'; dbname='.$dbname.';charset='.$charset,
            $username, $password, array(PDO::ATTR_EMULATE_PREPARES => FALSE,
                                  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    $db -> setAttribute (PDO :: ATTR_ERRMODE, PDO :: ERRMODE_EXCEPTION);
    $db -> setAttribute (PDO :: ATTR_EMULATE_PREPARES, FALSE);
?>