<?php
require_once 'lib/koneksi.php';
require_once 'lib/fungsi.php';
?>
<html>
<head>
	<title>dipinjami </title>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />

	<style type="text/css">
	.no-js #loader { display: none;  }
	.js #loader { display: block; position: absolute; left: 100px; top: 0; }
	.pageLoader {
		position: fixed;
		left: 0px;
		top: 0px;
		width: 100%;
		height: 100%;
		z-index: 9999;
		background: url(assets/images/loading.gif) center no-repeat #fff;
		opacity: 0.7;
	}
	</style>

	<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
	<body>
		<div class="pageLoader"></div>
		<!-- <br /> -->

		<div class="container">
			<div class="card">
				<div class="card-body">
					<h2>Notifikasi Peminjaman </h2>
					<!-- <div id="alertinfo" class="alert alert-success alert-dismissible"> -->
					<div style="display:none;" id="alert-div" class="alert alert-dismissible">
					  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					  <span id="alert-msg">
					  		<!-- message text here -->
					  </span>
					</div>

	        <!-- confirmation Dialog -->
	        <div class="modal fade" id="confirmModal" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
	          <div class="modal-dialog">
	            <div class="modal-content">
	              <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title "></h4>
	              </div>
	              <div class="modal-body">
	                <p>Are you sure about this ?</p>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Belum</button>
	                <button type="button" class="btn btn-success" id="confirm">Sudah</button>
	              </div>
	            </div>
	          </div>
	        </div>

					<?php
						$toko = 'A';	// nama toko yang ...
						$durasi = 7; 	//lama tampil 7 hari

						echo 'Anda login sekarang sebagai <div class="badge badge-info"> Toko '.$toko.'</div>';
						getNotifPeminjaman('dipinjam',$toko,$durasi);
						getNotifPeminjaman('meminjam',$toko,$durasi);

					 ?>

				</div>
			</div>

			<br />

		</div>
		<br />
	</body>

	<script>
		$(document).ready(function(){
			setTimeout(function(){
				$('.pageLoader').attr('style','display:none');
			}, 700);
		});

		$('#confirmModal').on('show.bs.modal', function (e) {
			 $message = $(e.relatedTarget).attr('data-message');
			 $(this).find('.modal-body p').text($message);

			 $title = $(e.relatedTarget).attr('data-title');
			 $(this).find('.modal-title').text($title);
		 });

		 function ambilBarang(id) {
			 	$('#confirm').on('click',function(){
			 		$.ajax({
						url:'notif_peminjaman_proses.php',
						headers: {
				     'Cache-Control': 'no-cache, no-store, must-revalidate',
				     'Pragma': 'no-cache',
				     'Expires': '0'
					 	},
						cache:false,
			 			data:{'action':'ambil','idPinjam':id},
			 			method:'post',
			 			dataType:'json',
						beforeSend:function () {
							$('.pageLoader').removeAttr('style');
						},
						success:function(dt){ // success
							setTimeout(function(){ //setTimeout
								$('.pageLoader').attr('style','display:none');
				 				if(dt.status!='success')
									alert(dt.status);
				 				else { // else
				 					$('#confirmModal').modal('hide');
									$('#idAlert_'+id).fadeOut('slow',function(){
		                $('#idAlert_'+id).remove();
				 					});
								} // end of else
			 				},700); // setTimeout
			 			} // end of success
			 		}); // end of ajax
			 	});// end of on click
			} // end of function

	</script>

</html>
