<?php
    session_start();
    $con = new mysqli('localhost', 'root', '', 'gopedal');

    echo "success";
    $station_id=$_POST['station_name'];

    $result = $con->query("SELECT * 
            FROM rentals as r JOIN cycles as c ON (r.cycle_id=c.cycle_id) 
            JOIN stations as s ON(r.station_id=s.station_id)
            WHERE s.station_id = '$station_id' AND availability = b'1'");

    echo "station id : ".$station_id;

/*
    while ($row = $result->fetch_assoc())
     {

            echo $row["cycle_id"]."------".$row["color"]."------".$row["fare_rate"]."-----"."<br>";  
     }*/

    $row = $result->fetch_assoc();
    echo $row["cycle_id"];

    $cycle_code = $row["cycle_id"];
    $fare_rate = $row["fare_rate"];
    $_SESSION['cycle_code'] = $cycle_code;
    $_SESSION['fare_rate'] = $fare_rate;

    echo $fare_rate;
 
    echo "ki vaya cycle lagbe?<br>";
    echo "Cycle Id - Color - Fare Rate - Rating";

    header('Location: ../renting.php');



?>