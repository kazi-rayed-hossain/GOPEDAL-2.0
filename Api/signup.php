<?php
   // 
   session_start();
    $user = 'root';
    $pass = '';
    $db = 'gopedal';
    $con=mysqli_connect("localhost","root","","gopedal");
    //
    $u_fname=$_POST['u_fname'];
    $u_lname=$_POST['u_lname'];
    $u_dob=$_POST['u_dob'];
    $u_email=$_POST['u_email'];
    $u_phone=$_POST['u_phone'];
    $u_address=$_POST['u_address'];
    $u_nid=$_POST['u_nid'];
    $u_password=$_POST['u_password'];
    

    if(empty($u_fname)||empty($u_lname)||empty($u_dob)||empty($u_email)||empty($u_phone)||empty($u_address)||empty($u_nid)||empty($u_password))
    {

        header("Location: ../register.php?error=empty fields");
        exit();
    }
 /*   
    $hasedpass = password_hash($u_password,PASSWORD_DEFAULT);
    
    else if(!filter_var($u_email,FILTER_VALIDATE_EMAIL))
    {
        header("Location: ../signupform.php?error=emailpattern");
        exit();
        INSERT into customers
                VALUES (null,'bashar','ahmed','1990-02-10','ab@gmail.com','01910103456',103,null,'120987650','pass');
    }*/


       /* 
        
        $qry ="INSERT into customers
                VALUES (null,'bash','dibe','1999-02-10','gab@gmail.com','01910103444',101,null,'1209876598','aaaa');";*/
        $qry = "INSERT into customers()
         VALUES (null,'$u_fname','$u_lname','$u_dob','$u_email','$u_phone','$u_address','$u_nid','$u_password')";
        echo $qry;  
        $con->query($qry);
     
        $_SESSION['user_name'] = $u_fname;	
        header('Location: ../home_after_registration.php?successfulsignup');
       

    


?>