<?php
require_once 'lib/koneksi.php';
require_once 'lib/fungsi.php';
?>
<html>
<head>
	<title>dipinjami </title>
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" /> -->
	<!-- <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
	<!-- <script src="js/jquery-latest.min.js" type="text/javascript"></script> -->
	<!-- <script src="js/popper.min.js"></script> -->

	<!-- <script type="text/javascript" src="js/action.js"></script> -->
	<!-- <script type="text/javascript" src="js/jquery.js"></script> -->

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
		<br />

		<div class="container">
			<div class="card">
				<div class="card-body">
					<h2>Notifikasi </h2>
					<p>(halaman toko Peminjam)</p>
					<br />

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
	                <h4 class="modal-title"></h4>
	              </div>
	              <div class="modal-body">
	                <p>Are you sure about this ?</p>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
	                <button type="button" class="btn btn-success" id="confirm">OK</button>
	              </div>
	            </div>
	          </div>
	        </div>

					<?php
						$dipinjami = 'A';
						$s = 'SELECT
									  	idPinjam,
									  	kode,
									  	status,
											toko1,
											merk,
									  	ukuran,
									  	jumlah,
									  	status,
									  	jenisBarang,
									  	date(tglPinjam)tgl_pinjam,
									    curdate() tgl_skrg,
											abs(datediff(date(tglPinjam),date(curdate()))) selisih_hari
									FROM
									  	pinjam
									WHERE
									  	toko2 = "'.$dipinjami.'"
									  	AND status = "approved"
											AND abs(datediff(date(tglPinjam),date(curdate())))<=7
									ORDER BY
									    tgl_pinjam asc
									    ';
						$e=mysqli_query($conn,$s);
						while ($r=mysqli_fetch_assoc($e)) {
							$alerts.='<div id="idAlert_'.$r['idPinjam'].'" class="alert alert-success">
									<a href="#" class="btn btn-xs btn-success pull-right"
										data-title="Konfirmasi "
										data-toggle="modal"
										data-target="#confirmModal"
										onclick="ambilBarang('.$r['idPinjam'].')"
										data-message="Yakin anda sudah mengambil \''.$r['jenisBarang'].' \' ?"
										>
										ambil
									</a>
									Toko <strong>'.$r['toko1'].'</strong> telah menyediakan barang dengan
									jenis <b>'.$r['jenisBarang'].'</b>,
									merk <b>'.$r['merk'].'</b>,
									ukuran <b> '.$r['ukuran'].'</b>,
									sebanyak <b> '.$r['jumlah'].'</b>,

								</div>';
						} echo $alerts;
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

		function hargacb(jenis) {
			$.ajax({
				url:'action.php',
				data:{
					'mode':'comboharga',
					'jenis':jenis
				},type:'post',
				dataType:'json',
				beforeSend:function () {
					$('.pageLoader').removeAttr('style');
				},success:function(ret){
					setTimeout(function(){
						$('.pageLoader').attr('style','display:none');

						var opt='';
						if(ret.total==0) opt+='<option>-data kosong-</option>';
						else{
							opt+='<option value="">-- Pilih --</option>';
							$.each(ret.returns.data, function  (id,val) {
								opt+='<option value="'+val.harga_angka+'">'+val.harga_rp+'</option>';
							});
						}$('#hargacombo').html(opt);
					}, 700);
				}, error : function (xhr, status, errorThrown) {
					$('.pageLoader').attr('style','display:none');
			        alertinfo('danger','error : ['+xhr.status+'] '+errorThrown);
			    }
			});
		}

		function saveform(){
      var urlx ='&mode=create';
      $.ajax({
          url:'action.php',
          cache:false,
          type:'post',
          dataType:'json',
          data:$('form').serialize()+urlx,
					beforeSend:function () {
					$('.pageLoader').removeAttr('style');
				},success:function(dt){
					setTimeout(function(){
		            	console.log(dt.returns.success);
						$('.pageLoader').attr('style','display:none');
		                if(dt.returns.success==false){
		                	alertinfo('danger','<strong>Gagal !</strong>  menyimpan data');
		                }else{
		                    resetform();
		                	alertinfo('success','<strong>Berhasil !</strong>  menyimpan data');
		                }
		            },700);
	            }
	        });
	    }

	    function alertinfo(clr,msg) {
	    	$('#alert-div').removeAttr('style');
            $('#alert-msg').html(msg);
            $('#alert-div').addClass('alert-'+clr);
    	}

	    function resetform() {
	    	$('#nama').val('');
	    	$('#no_tlp').val('');
	    	$('#jeniscombo').val('');
	    	$('#hargacombo').val('');
	    }
// ----------------
			$('#confirmModal').on('show.bs.modal', function (e) {
				 $message = $(e.relatedTarget).attr('data-message');
				 $(this).find('.modal-body p').text($message);
				 $title = $(e.relatedTarget).attr('data-title');
				 $(this).find('.modal-title').text($title);
			 });

			 function ambilBarang(id) {
			 	$('#confirm').on('click',function(){
			 		$.ajax({
			 			url:'dipinjamiProses.php',
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
