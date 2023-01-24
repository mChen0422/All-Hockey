<?php
require 'conn.php';
header("content-type:text/html;charset=utf-8");
session_start();
$ArticleID = $_GET['id'];
$insert="update player_data set praise=praise+1 where id = '$ArticleID'";
$result=mysqli_query($conn, $insert);
if($result){
    echo "<script>window.location.href='index.php';</script>";
}else {
    echo "<script>window.location.href='index.php'; </script>";
}
?>