<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// ----- TOGGLE DARK MODE -------------------------------------------------
$mode = "user_mode";
$light = "light";
$dark = "dark";
$button_pressed = "yes";
$button_label =  "Toggle Dark/Light Modes";

// ----- Initialize the dark/light mode cookie
if (!isset($_COOKIE[$mode])){
    setcookie($mode, $light, 0, "/", "", false, true);
    header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
    exit();
}

// ----- Check if the toggle button was pressed
if (isset($_POST[$button_pressed])){
    $new_mode = $_COOKIE[$mode] == $light ? $dark : $light;
    setcookie($mode, $new_mode, 0, "/", "", false, true);
     header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
  exit();

}

session_start();
if (!array_key_exists('num_deleted', $_SESSION)){
         $_SESSION['num_deleted'] = 0;
     }
     
     // ----- Logout
if (isset($_POST['logout'])){
    session_unset();
    session_destroy();
    header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
    exit(); 
     }
     
     // ----- Store username
     if (isset($_POST['username'])) {
         $_SESSION['username'] = $_POST['username'];
         header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
         exit(); 
     }


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
        $did_suceed = $del_stmt->execute();
     if (!$did_suceed){
        echo $conn->error;
    }
    else
    {$_SESSION['num_deleted']+=1;}
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

<!DOCTYPE html>
<?php
       if ($_COOKIE[$mode] == $dark){
       ?>
           <link rel="stylesheet" href="darkmode.css">
           
       <?php
       } else {
       ?>
           <link rel="stylesheet" href="basic.css">
       <?php
       }
       ?>

<form method=POST>
   <input type="submit" name="<?= $button_pressed ?>" value="Toggle Light/Dark Mode"/>
   </form>

   <?php
   if (isset($_SESSION['username'])) {
   ?>
       <p>Welcome <?php echo $_SESSION['username']; ?>!</p>
       <form  method=POST>
       <input type=submit name='logout' value="Logout"/>
       </form>
       <p>You have deleted <?php echo $_SESSION['num_deleted']; ?> Records.
   <?php
   } else {
   ?>
       <p>Remember my session:
       <form method=POST>
       <input type=text name='username' placeholder='Enter name...'/>
       <input type=submit value='Remember Me'/>
       </form>
       
   </p>
   <?php
   }
   ?>
</html>