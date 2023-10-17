<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
?>
<?php
    $dbhost = 'localhost';
    $dbuser = 'miatomillo'; 
    $dbpass = 'centre2024';

                               


$conn = new mysqli($dbhost, $dbuser, $dbpass);


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
<?php $dblist = "SHOW databases"; 
 $result = $conn->query($dblist); ?>

 <?php
    while ($dbname = $result->fetch_array()) {
        echo $dbname['Database'] . "<br>";
    }
?>
<?php $conn->close(); ?>
<h2> Check Back Soon! </h2>
<form action="details.php" method="GET">
<p>
    "Database Name: "
    <input type="text" name="dbname">
</p>
<p>
    <input type="submit" value="See Details">
</p>
</form>