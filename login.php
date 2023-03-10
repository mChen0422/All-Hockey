<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Player center</title>
    <link href="css/main.css" rel="stylesheet" media="all" type="text/css">
</head>
<body>
<div class="box">
    <h2>Login</h2>
    <form method="post">
        <div class="inputbox">
            <input type="text" name="username" required="">
            <label>Username</label>
        </div>
        <div class="inputbox">
            <input type="password" name="password" required="">
            <label>Password</label>
        </div>

<!--        <a href="zhuce.php">register</a>-->
        <input type="submit" name="" value="submit">
        <input type="button" value="register" onclick="window.location.href='zhuce.php'">
    </form>
</div>
</body>
</html>

<?php
include("conn.php");
session_start();
if (isset($_POST['username'])&& isset($_POST['password']))
{
    $username=$_POST['username'];
    $userpw = $_POST['password'];
    if($name == "root") {
        $sqlstr = "select * from user where username='$username' and passwd='$userpw'";
    } else {
        $sqlstr = "select * from user where username='$username' and passwd='$userpw'";
    }
    $result = mysqli_query($conn,$sqlstr);
    $row = mysqli_num_rows($result);
    if($row) {
        echo "<script>alert('login successfully！');window.location.href='index.php'</script>";
    }else{
        echo "<script>alert('username or password is wrong!');</script>";
    }
}

?>