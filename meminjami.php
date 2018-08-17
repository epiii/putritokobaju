<?php 
require_once 'lib/koneksi.php'; 
require_once 'lib/lib.php'; 
?>
<html>
<head>
	<title>Parameter Data</title>
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
					<h2>DATA</h2>
					<p>Data Parameter.</p>
					
					<br />
					
					<!-- <div id="alertinfo" class="alert alert-success alert-dismissible"> -->
					<div style="display:none;" id="alert-div" class="alert alert-dismissible">
					  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					  <span id="alert-msg">
					  		<!-- message text here -->
					  </span>
					</div>

					<form method="post" onsubmit="saveform();return false;">
						<div class="form-group row">
							<label for="nama" class="col-sm-2 col-form-label">Nama</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="nama" name="nama" placeholder="Nama" required/>
							</div>
						</div>
						<div class="form-group row">
							<label for="nama" class="col-sm-2 col-form-label">No Telpon</label>
							<div class="col-sm-10">
								<!-- <input type="text"  class="form-control" id="no_tlp" name="no_tlp" placeholder="No Telpon" required/> -->
								<input type="number" min="1" xmax="13" class="form-control" id="no_tlp" name="no_tlp" placeholder="No Telpon" required/>
							</div>
						</div>

						<?php
							$sql  = 'SELECT param2, nama FROM parameter WHERE param1 = "type"';
							$exe  = mysqli_query($con,$sql);
						?>
						<div class="form-group row">
							<label for="harga" class="col-sm-2 col-form-label">Jenis</label>
							<div class="col-sm-10">
								<select required onchange="hargacb(this.value);" class="form-control" id="jeniscombo" name="jeniscombo">
									<option value="" selected> -- Pilih --</option>
									<?php
										while ($res=mysqli_fetch_assoc($exe)){
											echo '<option value="'.$res['param2'].'">'.$res['nama'].'</option>';
										}
									?>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="harga" class="col-sm-2 col-form-label">Harga</label>
							<div class="col-sm-10">
							<select required  class="form-control" id="hargacombo" name="hargacombo">
								<option value="" selected> -- Pilih Jenis dahulu --</option>
							</select>
							</div>
						</div>
						<div class="form-group row">
	    	        		<div class="offset-sm-2 col-sm-10">
            					<input type="submit" id="submit" value="Simpan" class="btn btn-info" />
            					
            				</div>
	            		</div>
					</form>
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
	</script>
	
</html>