<?php
require_once('dbcon.php');
//$_POST['email'] = 'John@gmail.com';
//$_POST['password'] = 'abc111';
if($_SERVER["REQUEST_METHOD"]=="POST"){
	if(isset($_POST['email']) && $_POST['email']!=null && $_POST['email']!="") {
		if(isset($_POST['password']) && $_POST['password']!=null && $_POST['password']!="") {
			
			$email=$_POST['email'];			//$password=sha1($_POST['password']);
			$password=$_POST['password'];

			$query ="SELECT u_username,u_password,u_email,u_address,u_mobile FROM tbl_customer WHERE u_email=? AND u_password=? ";

			$stmt=mysqli_prepare($con,$query);
			$bind= mysqli_stmt_bind_param($stmt,"ss",$email,$password);

			if($bind){
				$result=mysqli_stmt_execute($stmt);
				}
				
				if($result){

					mysqli_stmt_store_result($stmt);

					if(mysqli_stmt_affected_rows($stmt)>0){



					$res=mysqli_stmt_bind_result($stmt,$uname,$upass,$uemail,$uadd,$umob);	
					$login_msg=array();

					while(mysqli_stmt_fetch($stmt)){
						$user_data["name"]=$uname;
						$user_data["pass"]=$upass;
						$user_data["email"]=$uemail;
						$user_data["address"]=$uadd;
						$user_data["mob"]=$umob;

					}
				
				
					echo json_encode(array("Login_info" =>"SUCCESS","USER"=>$user_data ));
					header('Content-Type: application/json');
				
			}
				else{
					
					echo json_encode(array("Login_info" => "FAILED"));
					header('Content-Type: application/json');
					//echo json_encode(array("result" => "error ".mysqli_errno($con). " ".mysqli_error($con)));
				}
			
			}
			mysqli_stmt_close($stmt);
			
		}else{
			echo json_encode(array("Login_info" => "Password required" ));
		}
		
	}else{
		echo json_encode(array("Login_info" => "Email required" ));
	}
	mysqli_close($con);
}



?>