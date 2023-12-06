<?php
        //   $common_path = "../../../common/";
        //   $sql_path = "../../../web_sql/robotic_restaurant/";
     
        //   require $common_path . "format_result.php";
        //   require $common_path . "show_link_to_source.php";
     
         // Show ALL PHP's errors.
         ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);

        $config = parse_ini_file('/home/miatomillo/mysqli.ini');
$dbname = 'robotic_restaurant.sql';

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

     
    
        // Hard-code our connection parameters.
        $config = parse_ini_file($common_path . 'mysqli.ini');
        $dbname = 'robotic_restaurant';
    
        if (!$conn = new mysqli(
            $config['mysqli.default_host'],
            $config['mysqli.default_user'],
            $config['mysqli.default_pw'],
            $dbname
        )) {
            echo "Could not connect.<br>";
            echo "Error Num: $conn->connect_errno <br>";
            echo "Error Msg: $conn->connect_error <br>";
            exit;
        }
    ?>
    <!DOCTYPE html>
    <head>
        <title>Place an Order</title>
    </head>
    <body>
    <a href="../../index.html">Back to Home Page</a> &nbsp;
    <?php show_link_to_source(basename(__file__)); ?>
    
    <h1>Welcome to Alice's <code>Robotic</code> Restaurant</h1>
    <p>You can <code>grep</code> anything you want from Alice's restaurant.</p>
    
    <form action="order_confirm.php" method="POST">
    <h2>Menu</h2>
    <?php
        if (!$menu_res = $conn->query(file_get_contents($sql_path . "select_menu_items.sql"))){
            echo "<i>Failed to load menu!</i>\n";
            exit();
        }
        result_to_input_table($menu_res);
    ?>
 
    <table>
        <thead>
            <th></th>
        </thead>
        <tbody>
            <!-- Name -->
            <tr>
                <td style="text-align: right">Name:</td>
                <td><input type="text" name="cust_name"/></td>
            </tr>
            <!-- Location -->
            <tr>
                <td style="text-align: right">Latitude:</td>
                <td><input type="text" name="cust_lat"/></td>
            </tr>
            <tr>
                 <td style="text-align: right">Longitude:</td>
                <td><input type="text" name="cust_lon"/></td>
            </tr>
        </tbody>
    </table>
    <input type="submit" value="Place Order"/>
    </form>
    
    <h2>Cancel an Order</h2>
    <form action="order_delete.php" method="POST">
    <table>
        <tbody>
            <!-- Name -->
            <tr>
                <td style="text-align: right">Order ID:</td>
                <td><input type="text" name="order_id"/></td>
            </tr>
    </tbody>
    </table>
        <input type="submit" value="Delete Order"/>
    </form>
 
    <h2>Pending Orders</h2>
    <?php
        if (!$orders_res = $conn->query(file_get_contents($sql_path . "select_pending_orders.sql"))){
            echo "<i>Failed to load orders!</i>\n";
            exit();
        }
        result_to_html_table($orders_res);
    ?>
    </body>
    </html>
            