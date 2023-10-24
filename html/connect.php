<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
?>
<?php
$config = parse_ini_file('/home/miatomillo/mysqli.ini');
$dbname = 'instrument_rentals';
$conn = new mysqli(
            $config['mysqli.default_host'],
            $config['mysqli.default_user'],
            $config['mysqli.default_pw'],
            $dbname
            )

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