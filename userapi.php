<?php
require_once('dbcon.php');
if($_SERVER["REQUEST_METHOD"]=="GET")
{

	$sql="SELECT u_id,u_username,u_password,u_email,u_address,u_mobile FROM tbl_customer";

	$stmt = mysqli_prepare($con,$sql);
	$result=mysqli_stmt_execute($stmt);

	if($result){
		mysqli_stmt_bind_result($stmt,$id,$name,$pass,$email,$address,$mob);

		$user_array=array();
		while(mysqli_stmt_fetch($stmt)){
			$temp_array["id"]=$id;
			$temp_array["name"]=$name;
			$temp_array["pass"]=$pass;
			$temp_array["email"]=$email;
			$temp_array["address"]=$address;
			$temp_array["mob"]=$mob;

		array_push($user_array,$temp_array);//assigning the $temp_array to $user_array
	}
	//var_dump($user_array);
	echo json_encode(array("user_data" => $user_array),JSON_PRETTY_PRINT);
	header('Content-Type: application/json');
}
}

if($_SERVER["REQUEST_METHOD"]=="POST"){
	if(isset($_POST['email']) && $_POST['email']!=null && $_POST['email']!="") {
		if(isset($_POST['username']) && $_POST['username']!=null && $_POST['username']!="") {
			if(isset($_POST['password']) && $_POST['password']!=null && $_POST['password']!="") {
				if(isset($_POST['address']) && $_POST['address']!=null && $_POST['address']!="") {
					if(isset($_POST['mobile']) && $_POST['mobile']!=null && $_POST['mobile']!="") {

						$name=$_POST['username'];
						$password=sha1($_POST['password']);
						$email=$_POST['email'];
						$address=$_POST['address'];
						$mobile=$_POST['mobile'];
						$api_key=md5($email);



						$query ="INSERT INTO tbl_customer (u_username,u_password,u_email,u_address,u_mobile,u_secret) VALUES (?,?,?,?,?,?)";

						$stmt=mysqli_prepare($con,$query);
						$bind= mysqli_stmt_bind_param($stmt,"ssssss",$name,$password,$email,$address,$mobile,$api_key);

						if($bind){
						$result=mysqli_stmt_execute($stmt);
						if($result){
							echo json_encode(array("result" => "success" ));
						}
						else{
							echo json_encode(array("result" => "error ".mysqli_errno($con). " ".mysqli_error($con)));
						}
					}
					mysqli_stmt_close($stmt);
					}else{
						echo json_encode(array("result" => "Mobile required" ));
					}



				}else{
					echo json_encode(array("result" => "Address required" ));
				}
			}else{
				echo json_encode(array("result" => "Password required" ));
			}
		}else{
		echo json_encode(array("result" => "Username required" ));
	}
	}else{
		echo json_encode(array("result" => "Email required" ));
	}
	mysqli_close($con);
}



?>