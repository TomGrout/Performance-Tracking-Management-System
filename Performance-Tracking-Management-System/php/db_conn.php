<?php
$servername = "localhost";

$username = "root";

$password = "";

$dbname = "MIROSdb";

//create connection
$conn = new mysqli($servername, $username, $password, $dbname);

//check the connection
if ($conn->connect_error){
    die("Connection Failed: " . $conn-> connect_error);

}

return $conn;