<html>
    <head>
    <title>PHP Test Page</title>
    </head>
    <body>
    <?php echo "Hello World!"; ?>
    <br>
    <!-- Example #1 -->
    <?php echo $_SERVER['HTTP_USER_AGENT']; ?>
    
   
    <br>
    <!-- Example #3 -->
    <?php
    if (str_contains($_SERVER['HTTP_USER_AGENT'], 'Firefox')) 
    {
    ?>
    <h3>str_contains() returned true</h3>
    <p>You are using Firefox</p>
    <?php
    } else {
    ?>
    <h3>str_contains() returned false</h3>
    <p>You are not using Firefox</p>
    <?php
    }
    ?>
    <!-- Dealing with Forms, Example #1 -->
    <form action="action.php" method="post">
    <label for="name">Your name:</label>
    <input name="name" id="name" type="text">

    <label for="age">Your age:</label>
    <input name="age" id="age" type="number">

    <button type="submit">Submit</button>
    </form>

    </body>
</html>