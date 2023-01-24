<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Player center</title>
    <link rel="stylesheet" href="css/login.css">
    <link href="css/css.css" rel="stylesheet" media="all" type="text/css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header>
    <h1>Player center</h1>
</header>
<div class="box">
    <h3>Player center</h3>
    <form method="post">
        <table class="denglu">
            <tr><th>user name：</th><td><input type="text" name="username"></td></tr>
            <tr><th>password：</th><td><input type="password" name="password"></td></tr>
            <tr><th></th><td><input type="submit" id="login" value="login"></td></tr>
            <tr><th></th><td><a href="signup.php">Sign Up</a></td></tr>
        </table>
    </form>
</div>
</body>
</html>
<script>
    var img=document.getElementById('captcha');
    var change=document.getElementById('change');
    change.onclick=function()
    {
        img.src="code.php?rand="+Math.random();
        return false;
    }
</script>

<?php
include("conn.php");
session_start();
if (isset($_POST['username'])&& isset($_POST['password']))
{
    $username=$_POST['username'];//用户名
    $userpw = $_POST['password'];
    if($name == "root") {
        $sqlstr = "select * from user where name='$username' and passwd='$userpw'";
    } else {
        $sqlstr = "select * from user where name='$username' and passwd='$userpw'";
    }
    $result = mysqli_query($conn,$sqlstr);
    $row = mysqli_num_rows($result);
    if($row) {
        echo "<script>alert('login successfully！');window.location.href='index.php'</script>";
    }else{
        echo "<script>alert('Wrong account or password');</script>";
    }
}

?>