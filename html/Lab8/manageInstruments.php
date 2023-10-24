<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$config = parse_ini_file('/home/miatomillo/mysqli.ini');
$dbname = 'instrument_rentals';



if (!$conn = new mysqli($config['mysqli.default_host'],
    $config['mysqli.default_user'],
    $config['mysqli.default_pw'],
    $dbname)){
     echo "Error: Failed to make a MySQL connection: " . "<br>";
     echo "Errno: $conn->connect_errno; i.e. $conn->connect_error \n";
     exit;
    }
    else
    {echo "Connected Sucessfully" ;}

$select_result = $conn -> query("SELECT * FROM instruments");
$resrows = $select_result->fetch_all();
require 'table_util.php';



$del_stmt = $conn->prepare("DELETE FROM instruments WHERE instrument_id = ?;");
$del_stmt->bind_param('i', $id);
$did_delete = false;
for($i = 0; $i < $select_result->num_rows; $i++){
    $id = $resrows[$i][0];
    $key = "checkbox" . $id;
    if (isset($_POST[$key])){
        $did_delete = true;
     if (!$del_stmt->execute()){
        echo $conn->error;
    }
}
}


$did_insert = false;
if (isset($_POST["Insert"])){

    $did_insert = true;
    $insert_to_table = file_get_contents("insert_table.sql");
    $conn->query($insert_to_table);
    echo $conn->error;
 
}
if ($did_delete || $did_insert){
    header("Location: {$_SERVER['REQUEST_URI']}",true, 303);
   exit();
    
}

?>
<form action="manageInstruments.php" method=POST>
    <?php
    $select_code = file_get_contents("select_instruments.sql");

$select_result = $conn -> query($select_code);

result_to_html_table($select_result);
?>
<form action="manageInstruments.php" method=POST>
<input name="Insert" type="submit" value="Add Instruments">

</form>
