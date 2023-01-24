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

    </style>
</head>
<body>
<header>
    <h1>vote for your favorite player</h1>
    <a href="zhu.php" class="btn2">other</a>
    <!--    <a href="index.php"><span class="col-xs-1">学生信息</span></a>-->
    <!--    <a href="cha.php" class="btn2">select</a>-->
</header>
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
                        $user = $_GET['user'];
                        $sql=mysqli_query($conn,"select * from player_data where `name` = '$user'");
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
                            echo "<div align=center>暂无球员</div>";
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
                                $sql=mysqli_query($conn,"select * from player_data where `name` = '$user'");
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

                                                                                <td colspan="2"><img id="i" src="photo/huo.png" width="31" height="30" style="cursor: pointer;" border="0" alt="隐藏"/><?php echo $info['praise'];?>
                                                                                    <button style="margin-left:4px" onclick="window.location.href='zan.php?id=<?php echo $info['id']?>'" type="button">
                                                                                        <img src="photo/zan.png" width="31" height="30" alt="赞">
                                                                                        <span style="position:absolute;margin-top:6px;margin-left:2px;font-size:20px">
            <span style="position:absolute;margin-top:-2px;margin-left:6px;font-size:20px"></span>
                                                                                    </button>(点这个标可投票)</td>
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
                                                                                <td colspan="2"><img id="i" src="photo/huo.png" width="31" height="30" style="cursor: pointer;" border="0" alt="隐藏"/><?php echo $info['praise'];?>
                                                                                    <button style="margin-left:4px" onclick="window.location.href='zan.php?id=<?php echo $info['id']?>'" type="button">
                                                                                        <img src="photo/zan.png" width="31" height="30" alt="赞">
                                                                                        <span style="position:absolute;margin-top:6px;margin-left:2px;font-size:20px">
            <span style="position:absolute;margin-top:-2px;margin-left:6px;font-size:20px"></span>
                                                                                    </button>
                                                                                    (点这个标可投票)</td>
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
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
