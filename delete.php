<?php
    session_start();
    $conn = new mysqli('localhost', 'root', '', 'gopedal');
    
    $variable=$_POST['topology']; //contains the value they chose from T1, etc.
    //$result = $conn->query("select station_id, name from stations");
    //$result_1 = $conn->query("select cycle_id, color from cycles");

    echo "guuuiadfdsjflkajkflj";
    
    echo "asdfsdf : ".$variable;

/*
    while ($row = $result->fetch_assoc()) {

        unset($id, $name);
        $id = $row['stations_id'];
        $name = $row['name']; 
        echo '<option value="'.$id.'">'.$name.'</option>';
    }

    echo "</select>";
    echo "</div>";


    echo "</body>";
    echo "</html>";*/
?> 