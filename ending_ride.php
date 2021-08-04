<?php
	session_start();
	echo "ending ride";
	
	$cycle_code = $_SESSION['cycle_code'];
	$user_id = $_SESSION['user_id'] ;

	$con=mysqli_connect("localhost","root","","gopedal");

	$qry = "UPDATE `cycles` SET `availability` = b'1' WHERE `cycles`.`cycle_id` = $cycle_code";
	$res = mysqli_query($con,$qry);

	$qry1 = "UPDATE `rentals` SET `end_time` = now() WHERE  cycle_id = $cycle_code";
	$res1 = mysqli_query($con,$qry1);


	//fare calculation



	$qry2= "SELECT fare_rate FROM cycles WHERE cycle_id = '$cycle_code'";
	$res2= mysqli_query($con,$qry2);
	$row= mysqli_num_rows($res2);

	while($row = $res2->fetch_assoc())
	{
	    $_SESSION['fare_rate'] = $row['fare_rate'];
	    $fare_rate = $row['fare_rate'];	
    }

    $qry3= "SELECT MINUTE((SELECT timediff(end_time,start_time) FROM rentals WHERE cycle_id = '$cycle_code'))as minutes";
	$res3= mysqli_query($con,$qry3);
	$row1= mysqli_num_rows($res3);

	while($row1 = $res3->fetch_assoc())
	{
	    $min = $row1['minutes'];	
    }
    
    $qry4= "SELECT HOUR((SELECT timediff(end_time,start_time) FROM rentals WHERE cycle_id = '$cycle_code'))as hours";
	$res4= mysqli_query($con,$qry4);
	$row2= mysqli_num_rows($res4);

	while($row2 = $res4->fetch_assoc())
	{
	    $hour = $row2['hours'];	
    }
    echo "<br>Total Riding time : ".$hour."hour -".$min."- minutes"."<br>";
    echo "Fare rate :".$fare_rate."TK per hour <br>";
    $fare_count =($min+($hour * 60)) *($fare_rate / 60);
    echo "Total Fare : ".$fare_count."<br>";


    $_SESSION['total_fare'] = $fare_count;

    $_SESSION['cycle_code'] = $cycle_code;
	$_SESSION['user_id'] = $user_id ;


    //fare calculation ended

    //station id  update
    $station_to_submit = $_POST['station_id'];
    $qry5 = "UPDATE `rentals` SET `station_id` = $station_to_submit WHERE  cycle_id = $cycle_code";
	$res5 = mysqli_query($con,$qry5);

	header('Location: fair_show.php');
?>