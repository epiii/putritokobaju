<?php
	include 'lib/koneksi.php';
	include 'lib/fungsi.php';

	$requestData= $_REQUEST;

	if (!isset($_POST['action'])) {
			$outArr=['status'=>'invalid_request'];
	}else{
		$outArr=['status'=>'valid_request'];
		if ($_POST['action']=='ambil') {
			$s='UPDATE pinjam SET status="taken" WHERE idPinjam='.$_POST['idPinjam'];
			$e=mysqli_query($conn,$s);
			$outArr=['status'=>!$e?'failed save db':'success'];
		}elseif ($_POST['action']=='tolak') {
			$s= 'UPDATE pinjam SET status="refuse" WHERE idPinjam="'.$_POST['idPinjam'].'"';
			$e=mysqli_query($conn,$s);
			$outArr=['status'=>!$e?'failed save db':'success'];
		}elseif ($_POST['action']=='sediakan') {
			$s='UPDATE pinjam SET status="approved" WHERE idPinjam='.$_POST['idPinjam'];
			$e=mysqli_query($conn,$s);
			$outArr=['status'=>!$e?'failed save db':'success'];
		}
	}
	echo json_encode($outArr);  // send data as json format
?>
