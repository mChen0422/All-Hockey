<head>
	<title>Predict Winning Probability</title>
 </head>
 <body>
    

 <?php
echo "<style> body { background-image: url(\"https://wallpaperaccess.com/full/1253978.jpg\"); } </style>";
$dbhost = '';
$dbuser = '';
$dbpass = '';
$dbname = "";
$mysqli = new mysqli($dbhost,$dbuser,$dbpass,$dbname);

if (mysqli_connect_errno()){
	printf("Connect failed: %s<br>", mysqli_connect_error());
	eixt();
}

$tmId1 = $_POST['Team1Name'];
$tmId2 = $_POST['Team2Name'];

function printTableHeader(){
    echo "<tr>";
    echo "<th> Team1 Winning Percentage </th>";
    echo "<th> Team2 Winning Percentage </th>";
    echo "<tr>";

    
}


if ($mysqli->multi_query("CALL PredictWin('".$tmId1."','".$tmId2."');")) {
    do{
        if ($result = $mysqli->store_result()) {

            echo "<table border=\"1px solid black\">";
            $row = $result->fetch_row();
    	    $status = explode(" ", $row[0])[0];
                printTableHeader();
                do {
                    echo "<tr>";
                    for($i = 0; $i < sizeof($row); $i++){
                        echo "<td>" . $row[$i] . "</td>";
                    }
                    echo "</tr>";
                } while($row = $result->fetch_row());
            echo "</table>";
            $result->close();

        }
    } while($mysqli->next_result());
}

else {
        printf("<br>Error: %s\n", $mysqli->error);
}
mysqli_close($mysqli);
 ?>
 </body>


