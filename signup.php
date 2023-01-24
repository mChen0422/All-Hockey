<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Player center</title>
    <link href="css/css.css" rel="stylesheet" media="all" type="text/css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<header>
    <h1>Player center</h1>
</header>
<div class="box">
    <div class="title">用户注册</div>
    <form  method="post" name="myform">
        <table class="login">
            <tr><th>用户名：</th><td><input type="text" name="username" id="name"></td></tr>
            <tr><th>密码：</th><td><input type="password" name="password" id="pw"></td></tr>
            <tr><th>确认密码：</th><td><input type="text" name="confirmpw" id="cpw"></td></tr>
            <tr><th></th><td><input type="submit" value="注册" onclick="return mycheck()"></td></tr>
            <tr><th></th><td><a href="login.php">重新登陆</a></td></tr>

        </table>
    </form>
</div>
</body>
</html>
<script language="JavaScript">
    function mycheck() {
        if (myform.name.value=="" || myform.pw.value=="" || myform.cpw.value=="")
        {
            alert("用户名、密码和确认密码均不能为空：");
            myform.name.focus();
            return false;
        }
        if (myform.pw.value!==myform.cpw.value)
        {
            alert("密码和确认密码输入不一致！");
            myform.pw.value="";
            myform.cpw.value="";
            myform.pw.focus();
            return false;
        }

    }
</script>

<?php
include("conn.php");
if (isset($_POST['username'])&& isset($_POST['password']))
{
    $username = $_POST['username'];//用户名
    $userpw = $_POST['password'];//密码
    $searchsqr="SELECT * FROM `user` WHERE `name` LIKE '$username'";
    $result=mysqli_query($conn,$searchsqr);
    $row=mysqli_fetch_array($result);
    if (empty($row))
    {
        $sqlstr="INSERT INTO `user` (`name`, `passwd`) VALUES ('".$username."','".$userpw."')";
        mysqli_query($conn,$sqlstr);
        echo "<script>alert('注册成功!');</script>";
    }
    else
    {
        header("location:zhuce.php");//重新注册
    }

}
require "zhuce.php";
