<?php

$user_name = "root";
$password  = "9kali9=81ub";
$database  = "toko";
// $database  = "putriajax";
$host_name = "localhost";

$con = mysqli_connect($host_name, $user_name, $password, $database);
mysqli_select_db($con, $database);

if ($con || mysqli_select_db($con, $database)) {

} else {
    echo " failed";
}

?>
