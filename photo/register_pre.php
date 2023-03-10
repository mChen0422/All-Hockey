<?php
require_once("conn.php");

mysqli_query($conn,'set names utf8 ');
if(!(isset($_POST['username'])&&(!empty($_POST['username'])))){
    echo "<script>alert('The username cannot be empty');window.location.href='zhuce.php';</script>";
}
$username = $_POST['username'];
$password = $_POST['password'];

$sql="select * from user where username = '$username'";
$result=mysqli_query($conn, $sql);
if (mysqli_num_rows($result) >= 1){
    echo "<script>alert('The account exists');history.go(-1);</script>";
    
} else {
    $insert = "insert into user(username,passwd) values('$username','$password')";
    if(mysqli_query($conn,$insert)){
        echo "<script>alert('Register successfully');window.location.href='login.php';</script>";
    }else{
        echo "<script>alert('Register failed');window.location.href='register.php';</script>";
    }
}
?>