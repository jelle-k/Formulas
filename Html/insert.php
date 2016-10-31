<?php
$servername = "localhost";
$username = "root";
$password = "trick";
$dbname = "utilities";


// Escape user inputs for security
$hwater = (!empty( $_POST['hwater']) ? $_POST['hwater'] : ''); 
$cwater = (!empty( $_POST['cwater']) ? $_POST['cwater'] : '');
$gas = (!empty( $_POST['gas']) ? $_POST['gas'] : '');
$power181 = (!empty( $_POST['power181']) ? $_POST['power181'] : ''); 
$power182 = (!empty( $_POST['power182']) ? $_POST['power182'] : ''); 
$adate = (!empty( $_POST['adate']) ? $_POST['adate'] : ''); 
$heating = (!empty( $_POST['heating']) ? $_POST['heating'] : '');


try {
    // Connecto to database
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // begin the transaction
    $conn->beginTransaction();
    
    // our SQL statements
    $conn->exec("INSERT INTO utlt (hwater, cwater, gas, power181, power182, adate, heating) VALUES (:hwater, :cwater, :gas, :power181, :power182, :adate, :heating)");

    // commit the transaction
    $conn->commit();
    echo "New records created successfully";
    }
catch(PDOException $e)
    {
    // roll back the transaction if something failed
    $conn->rollback();
    echo "Error: " . $e->getMessage();
    }

$conn = null;
?>