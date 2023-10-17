<?php 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

    $dbhost = 'localhost';
    $dbuser = 'miatomillo'; 
    $dbpass = 'centre2024';
    $dbname = $_GET["dbname"];

$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);


    if ($conn->connect_errno) {
        echo "Error: Failed to make a MySQL connection, here is why: ". "<br>";
        echo "Errno: " . $conn->connect_errno . "\n";
        echo "Error: " . $conn->connect_error . "\n";
        exit; 
    } else {
        echo "Connected Successfully!" . "<br>";
        echo "YAY!" . "<br>";
    }

    ?>

<?php $dbname = "SHOW tables"; 
 $result = $conn->query($dbname); ?>
<ul>
 <?php

    while ($tablename = $result->fetch_array()) {
       echo "<li>" .  $tablename["Tables_in_" . $_GET["dbname"] ] . "<br>" . "</li>";
    }

?>
<ul>