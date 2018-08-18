<?php
	include 'lib/koneksi.php';
	include 'lib/fungsi.php';

	$requestData= $_REQUEST;

	if (!isset($_POST['action'])) {
			$outArr=['status'=>'invalid_request'];
	}else{
		$outArr=['status'=>'valid_request'];
		if ($_POST['action']=='ambil') {
			$sql= 'pinjam SET
						status="taken"';
			if(is_numeric($_POST['idPinjam'])){
				$s='UPDATE '.$sql.' WHERE idPinjam='.$_POST['idPinjam'];
			}else{
				$s='INSERT INTO '.$sql;
			}
			// pr($s);
			$e=mysqli_query($conn,$s);
			$outArr=['status'=>!$e?'failed save db':'success'];
		}
	}
	echo json_encode($outArr);  // send data as json format
?>
