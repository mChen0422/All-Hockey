<?php require 'conn.php'?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Player center</title>
<link href="css/css.css" rel="stylesheet" media="all" type="text/css">
    <link href="bootstarp/dist/css/bootstrap.min.css" rel="stylesheet">
<script type='text/javascript' src='js/jquery.js'></script>
<style>
body {
          background-image: url('https://kseblobstorage.blob.core.windows.net/sitefiles/Avalanche-Wallpapers-2022/CA-2122-Mack-desktop-2568x1444.jpg');
          background-repeat: no-repeat;
          
          font-style: white;

        }
        
</style>
</head>
<body>

<div class="main-content">
    <br><h1 style="text-align: center;color:white">Vote for your favorite player! </h1> <br>
    <form method="get" action="select.php" class="form-horizontal" role="form">
        <div class="form-group">
            <label for="name" class="control-label col-xs-2 col-xs-offset-2" style = "color:white"> </label>
            <div class="col-xs-4">
                <input id="name" type="text" name="user" class="form-control" placeholder="Please type his name here">
            </div>
            <input style="padding: 7px 30px;border-radius: 5px;border: none" class="col-xs-1 btn-success" type="submit" name="select" value="vote" style="color: PaleTurquoise;>
        </div>
    </form>
    <table width=100% align="center" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
        <tr>
            <td bgcolor="#FFFFFF">
                <table width=100% height=100% border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td><br>
                            <?php
                            include("conn.php");

                            ?>
                            <?php
                            $sql=mysqli_query($conn,"select * from player_data order by praise desc limit 0,10");
                            $info=mysqli_fetch_array($sql);
                            $sql1=mysqli_query($conn,"select found_rows() as total1");
                            $info1=mysqli_fetch_array($sql1);
                            $total1=$info1["total1"];
                            if(empty($_GET["page"])==true || is_numeric($_GET["page"])==false)
                            {
                                $page1=1;
                            }else{
                                $page1=intval($_GET["page"]);
                            }
                            if($total1==0){
                                echo "<div align=center>No information for this player</div>";
                            }else{
                            $pagesize1=10;
                            if($total1<$pagesize1){
                                $pagecount1=1;
                            }else{
                                if($total1%$pagesize1==0)
                                {
                                    $pagecount1=intval($total1/$pagesize1);
                                }else{
                                    $pagecount1=intval($total1/$pagesize1)+1;
                                }
                            }
                            ?>
                            <table border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <?php
                                    $sql=mysqli_query($conn,"select * from player_data order by praise desc limit ".($page1-1)*$pagesize1.",$pagesize1");
                                    $info=mysqli_fetch_array($sql);
                                    $i=1;
                                    do
                                    {
                                    if ($i % 2==0)
                                    {
                                    ?>
                                    <td height="25"><table width="200" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td><table width="415" height="175" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#6EBEC7">
                                                        <tr>
                                                            <td width="415" bgcolor="#FFFFFF">
                                                                <table width="415" height="170" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="135" rowspan="3" align="center"><div align="center"><a href="<?php echo $info["picture_url"]; ?>"><img src=" <?php echo $info["picture_url"]; ?>" width="135" height="150" border="0"></a></div></td>
                                                                        <td width="7" rowspan="3" bgcolor="#FFFFFF">&nbsp;</td>
                                                                        <td width="1" height="9" bgcolor="#FFFFFF"></td>
                                                                        <td width="280" rowspan="3" bgcolor="#FFFFFF" valign="middle"><table width="240" height="140" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td>&nbsp;<span class="a10">name&nbsp;&nbsp;&nbsp;：
          <?php
          echo "<td>" . $info['name'] . "</td>";
          ?>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>&nbsp;<span class="a10">Position:
          <?php
          echo "<td>" . $info['position'] . ". " . "Shoots: " . $info['shoots'] . "&nbsp;&nbsp;" . $info['height'] . "，" . $info['weight']."</td>";
          ?>
                                                                                    </td>
                                                                                </tr>
<tr>
<td &nbsp;><span class="a10">Born&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</div></td>
<td width="170"><?php echo $info['birthPLace']; ?></td>
</tr>
<tr>
    <td &nbsp;><span class="a10">Dled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</div></td>
    <td width="170"><?php
        echo $info['died'];
        ?></td>
</tr>
<tr>
    <td &nbsp;><span class="a10">Hall.of.Fame:</div></td>
    <td width="170"><?php
        echo $info['hall of fame'];
        ?></td>
</tr>
<tr>

    <td colspan="2"><img id="i" src="photo/huo.png" width="31" height="30" style="cursor: pointer;" border="0" alt="hide"/><?php echo $info['praise'];?>
        <button style="margin-left:4px" onclick="window.location.href='thumbsup.php?id=<?php echo $info['id']?>'" type="button">
            <img src="photo/thumbsup.png" width="31" height="30" alt="thumbsup">
            <span style="position:absolute;margin-top:6px;margin-left:2px;font-size:20px">
            <span style="position:absolute;margin-top:-2px;margin-left:6px;font-size:20px"></span>
        </button></td>
</tr>
</table></td>
</tr>
</table>
</td>
</tr>
</table></td>
<td width="10">&nbsp;</td>
</tr>
</table>
<br>		  </td>
</tr>
<?php
}
else
{
    ?>
    <td height="25"><table width="200" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="190"><table width="415" height="175" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#6EBEC7">
                        <tr>
                            <td bgcolor="#FFFFFF"><table width="130" height="170" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="173" rowspan="3" align="center"><div align="center"><a href="<?php echo $info["picture_url"]; ?>"><img src=" <?php echo $info["picture_url"]; ?>" width="135" height="150" border="0"></a></div></td>
                                        <td width="10" rowspan="3" bgcolor="#FFFFFF">&nbsp;</td>
                                        <td width="1" height="9" bgcolor="#FFFFFF"></td>
                                        <td width="285" rowspan="3" bgcolor="#FFFFFF" valign="middle"><table width="240" height="140" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>&nbsp;<span class="a10">name&nbsp;&nbsp;&nbsp;：
          <?php
          echo "<td>" . $info['name'] . "</td>";
          ?>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;<span class="a10">Position:
          <?php
          echo "<td>" . $info['position'] . ". " . "Shoots: " . $info['shoots'] . "&nbsp;&nbsp;" . $info['height'] . "，" . $info['weight']."</td>";
          ?>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td &nbsp;><span class="a10">Born&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</div></td>
                                                    <td width="170"><?php echo $info['birthPLace']; ?></td>
                                                </tr>
                                                <tr>
                                                    <td &nbsp;><span class="a10">Dled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</div></td>
                                                    <td width="170"><?php
                                                        echo $info['died'];
                                                        ?></td>
                                                </tr>
                                                <tr>
                                                    <td &nbsp;><span class="a10">Hall.of.Fame:</div></td>
                                                    <td width="170"><?php
                                                        echo $info['hall of fame'];
                                                        ?></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><img id="i" src="photo/huo.png" width="31" height="30" style="cursor: pointer;" border="0" alt="hide"/><?php echo $info['praise'];?>
                                                        <button style="margin-left:4px" onclick="window.location.href='zan.php?id=<?php echo $info['id']?>'" type="button">
                                                            <img src="photo/zan.png" width="31" height="30" alt="Thumbs Up">
                                                            <span style="position:absolute;margin-top:6px;margin-left:2px;font-size:20px">
            <span style="position:absolute;margin-top:-2px;margin-left:6px;font-size:20px"></span>
                                                        </button>
                                                        </td>
                                                </tr>
                                            </table></td>
                                    </tr>
                                </table></td>
                        </tr>
                    </table></td>
                <td width="10">&nbsp;</td>
            </tr>
        </table>
        <br>

    </td>

    <?php
}
$i++;
}while($info=mysqli_fetch_array($sql));
}
?>
</tr>
</table>
<table width="845" height="25" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
    <tr>
        <td width="531"><div align="left">&nbsp;&nbsp;Total hot players&nbsp;<?php echo $total1;?>&nbsp;位&nbsp;Each page shows &nbsp;<?php echo $pagesize1;?>&nbsp;player&nbsp;&nbsp;<?php echo $page1;?>&nbsp;page/total&nbsp;<?php echo $pagecount1;?>&nbsp;page</div></td>
        <td width="317"><div align="right"><a href="<?php echo $_SERVER["PHP_SELF"]?>?page=1" class="a1">The first page</a>&nbsp;<a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php
                if($page1>1)

                    echo $page1-1;
                else
                    echo 1;
                ?>" class="a1">Previous page </a>&nbsp;<a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php
                if($page1<$pagecount1)

                    echo $page1+1;
                else
                    echo $pagecount1;
                ?>" class="a1">Next page</a>&nbsp;<a href="<?php echo $_SERVER["PHP_SELF"]?>?page=<?php echo $pagecount1;?>" class="a1">Final Page</a>&nbsp;&nbsp;</div></td>
    </tr></table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</body>
</html>
