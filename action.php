<?php
require_once 'lib/koneksi.php';
require_once 'lib/lib.php';


$isRequest=false;

if (isset($_POST['mode'])) {
	$isRequest=true;
	$returns = [];
	$returns['getparam']=false;
	
	switch ($_POST['mode']) {
		case 'comboharga':
			if (isset($_POST['jenis'])) {
				$returns['getparam']=true;
				$sql= ' SELECT id_param,nama
						FROM parameter 
						WHERE 	param1 = "harga" AND
								param2 = "'.$_POST['jenis'].'"
						ORDER BY 
							CAST(nama as DECIMAL) ASC';
				$exe   = mysqli_query($con,$sql);
			// pr($exe);

				if (!$exe) { // failed query 
					$returns['queried'] = false;
				}else{ // success query 
					$returns['queried'] = true;
					$returns['total']   = mysqli_num_rows($exe);
				
					// pr($res);
					while ($res=mysqli_fetch_assoc($exe)){
						$returns['data'][]=array(
							'id_param'    =>$res['id_param'],
							'harga_rp'    =>'Rp. '.(number_format($res['nama'])),
							'harga_angka' =>$res['nama'],
						);
					}
				}
			}
		break;

		case 'view':
			// code here
		break;

		case 'create':
			$sql='INSERT INTO ajax SET 
				nama   ="'.$_POST['nama'].'",
				no_tlp ="'.$_POST['no_tlp'].'",
				jenis  ="'.$_POST['jeniscombo'].'",
				harga  ="'.$_POST['hargacombo'].'"';
			$exe = mysqli_query($con,$sql);
			// pr($sql);	
			$returns['success']=!$exe?false:true;
		break;

		case 'edit':
			// code here
		break;

		case 'delete':
			// code here
		break;

		default:
			// code here
		break;
	}

}

echo json_encode([
	'request' =>$isRequest,
	'returns' =>$returns
]);

?>