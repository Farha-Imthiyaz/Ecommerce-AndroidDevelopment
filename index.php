<?php
require_once('dbcon.php');
if($_SERVER["REQUEST_METHOD"]=="GET")
{
	if(isset($_GET['api_key']) && $_GET['api_key']!=null && $_GET['api_key']!=""){

		$api_key=$_GET['api_key'];

		$usql="SELECT u_secret,u_activation FROM tbl_customer WHERE u_secret=? LIMIT 1";

		$stmt = mysqli_prepare($con,$usql);
		
		


		if(mysqli_stmt_bind_param($stmt,"s",$api_key)){
			$result=mysqli_stmt_execute($stmt);
			$activate=0;
			if($result){
				mysqli_stmt_bind_result($stmt,$api,$_activate);
				while (mysqli_stmt_fetch($stmt)) {
					$activate=$_activate;
				}
				mysqli_stmt_close($stmt);
				if($activate==1){
					$sqlprod="SELECT prod_id,p_name,p_price,p_image FROM tbl_product";

					$stmtprod = mysqli_prepare($con,$sqlprod);
					$resultprod=mysqli_stmt_execute($stmtprod);

					if($resultprod){
						mysqli_stmt_bind_result($stmtprod,$proId,$proName,$proPrice,$proImage);

						$product_array=array();
						while(mysqli_stmt_fetch($stmtprod)){
							$temp_array["proId"]=$proId;
							$temp_array["proName"]=$proName;
							$temp_array["proPrice"]=$proPrice;
							$temp_array["proImage"]=$proImage;


		array_push($product_array,$temp_array);//assigning the $temp_array to $user_array
	}
	//var_dump($user_array);
	echo json_encode(array("product_data" => $product_array),JSON_PRETTY_PRINT);
	header('Content-Type: application/json');

}
}else{
	echo "access denied";

}
}
}else{
				//var_dump($apikey);
	echo json_encode(array('result' => "Api Key not found" ));
}

}else{
	echo json_encode(array('result' => "Api Key not found" ));
}
}

if($_SERVER["REQUEST_METHOD"]=="POST"){
	$proName=$_POST['proName'];
	$proPrice=$_POST['proPrice'];
	$proImage=$_POST['proImage'];
	
	
	$query ="INSERT INTO tbl_product (p_name,p_price,p_image) VALUES (?,?,?)";

	$stmt=mysqli_prepare($con,$query);
	mysqli_stmt_bind_param($stmt,"sss",$proName,$proPrice,$proImage);

	$result=mysqli_stmt_execute($stmt);
	if($result){
		echo "data inserted";
	}
	else{
		echo "Not inserted";
	}
}
?>