<?php
session_start();

	echo "renting cycle";

	$cycle_code = $_SESSION['cycle_code'];

	$con1=mysqli_connect("localhost","root","","gopedal");

	$qry2 = "UPDATE `rentals` SET `start_time` = NULL WHERE  cycle_id = $cycle_code";
	$res2 = mysqli_query($con1,$qry2);

	$qry3 = "UPDATE `rentals` SET `end_time` = NULL WHERE  cycle_id = $cycle_code";
	$res3 = mysqli_query($con1,$qry3);
	//echo "<br>".$id;

	echo "starting ride";
	
	echo $cycle_code;
	//here by user_id we can add users details of ride.or for every ride we can use users detail....
	$user_id = $_SESSION['user_id'] ;

	$con=mysqli_connect("localhost","root","","gopedal");

	$qry = "UPDATE `cycles` SET `availability` = b'0' WHERE `cycles`.`cycle_id` = $cycle_code";
	$res = mysqli_query($con,$qry);

	$qry1 = "UPDATE `rentals` SET `start_time` = now() WHERE  cycle_id = $cycle_code";
	$res1 = mysqli_query($con,$qry1);

//for submitting station 
	$db_connect1 = mysqli_connect('localhost','root','','gopedal');
	echo "<br><br>Station ID-----Station name----------Area";
	echo "<br>---------------------------------------------------<br>";
	$qry1 = "SELECT * FROM stations as s JOIN addresses a ON (s.address_id=a.address_id) WHERE 1";
	$res = mysqli_query($db_connect1,$qry1);
	$row = mysqli_num_rows($res);
	while($row = $res->fetch_assoc())
	{
    	echo $row["station_id"]."----------------".$row["name"]."---------".$row["area"]."<br>";  	
	}

	header('Location: cycle_selection.php');//this mother fucker is not working?????????

?>
