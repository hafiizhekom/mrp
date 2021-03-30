<html>
<head>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>plugin/bootstrap/css/bootstrap-grid.css"/>
	
	<style>
		body{
			font-size:10px;
		}

		table{
			font-size:10px;
		}

		td:empty::after{
			content: "\00a0";
		}

		.info-oneline{
			width:100%;
			margin:0;
			margin-bottom:2px;
			padding:0;
			float:left;
		}

		.info-oneline label{
			display: inline-block;
			width:80px;
			margin-right:2px;
		}

		.info-oneline .value-oneline{
			overflow-wrap: break-word;
			word-wrap: break-word;
			hyphens: auto;
			display: inline-block;
			width:150px;
		}

		.info-oneline-table{
			width:100%;
			margin:0;
			padding:0;
			float:left;
		}

		.info-oneline-table label{
			display: inline-block;
			width:70px;
			margin-right:2px;
			vertical-align: text-bottom;
		}

		.info-oneline-table .value-oneline-table{
			overflow-wrap: break-word;
			word-wrap: break-word;
			hyphens: auto;
			display: inline-block;
			width:50px;
		}


	</style>

</head>
<body class="A5">
<?php
	foreach($customer as $keyCustomer => $valueCustomer){
?>
<section class="sheet padding-10mm">
	<!-- Write HTML just like a web page -->

	<article>
		<div class="container-fluid" style="margin-bottom:20px;">
			<div class="row">
				<div class="col-2" style="margin:0;padding:0;">
					<img alt="Brand" src="<?php echo base_url() ?>images/logo_bmm.png" width="100%">
				</div>
				<div class="col">
					<p style="margin:0;padding:0;margin-top:10px;"><b>PT. BUANA MASA METALINDO</b></p>
					<p style="margin:0;padding:0;">Steel Fabrication and Contractor</p>
				</div>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col" style="margin:0;padding:0;">
					<p class="info-oneline"><label>Kepada Yth</label> : <span class="value-oneline">PT. ABCDEFGHI</span></p>
					<p class="info-oneline"><label>Attn.</label>: <span class="value-oneline"><?php echo $valueCustomer->name;?></span></p>
					<p class="info-oneline"><label>Faks</label>: <span class="value-oneline"><?php echo $valueCustomer->fax;?></span></p>
					<p class="info-oneline"><label>HP</label>: <span class="value-oneline"><?php echo $valueCustomer->phone;?></span></p>
					<p class="info-oneline"><label>Email</label>: <span class="value-oneline"><?php echo $valueCustomer->email;?></span></p>
				</div>

				<div class="col" style="margin:0;padding:0;">
					<p class="info-oneline"><label>Tanggal</label> : <span class="value-oneline"><?php echo $header->qn_date;?></span></p>
					<p class="info-oneline"><label>Nomor</label>: <span class="value-oneline"><?php echo $header->qn_number;?></span></p>
					<p class="info-oneline"><label>Revisi</label>: <span class="value-oneline">0</span></p>
					<p class="info-oneline"><label>Perihal</label>: <span class="value-oneline">Quotation</span></p>
					<p class="info-oneline"><label>Proyek</label>: <span class="value-oneline"><?php echo $header->project->name;?></span></p>
					<p class="info-oneline"><label>Lampiran</label>: <span class="value-oneline"></span></p>
				</div>
			</div>
		</div>

		
		<div class="row">
			<div class="col">
				<p>
					Dengan Hormat,<br>
					Sehubungan dengan adanya permintaan dari Bapak/Ibu, bersama ini kami mengajukan penawaram harga dengan perincian sebagai berikut:
				</p>
				<table border="1" cellspacing="0" cellpadding="1">
					<thead>
						<tr>
							<th width="10px">NO</th>
							<th width="150px">URAIAN PENAWARAN</th>
							<th width="10px">JUMLAH</th>
							<th width="60px">HARGA SATUAN (IDR)</th>
							<th width="60px">JUMLAH HARGA (IDR)</th>
							<th width="10px">SKOPE PEKERJAAN</th>
						</tr>
					</thead>
					<tbody>

						<?php 
							foreach ($detail as $keyDetail => $valueDetail){
						?>
						<tr>
							<td><?php echo $keyDetail+1 ?></td>
							<td><?php echo $valueDetail->description ?></td>
							<td><?php echo $valueDetail->qty ?> Ls</td>
							<td><?php echo $valueDetail->price ?></td>
							<td><?php echo $valueDetail->total_price ?></td>

							<?php

								if($keyDetail==0){
							?>
								<td rowspan="<?php echo count($detail)+1?>">
									<p class="info-oneline-table"><label>FABRICATION</label> : <span class="value-oneline-table"><?php echo $header->fabrication; ?></span></p>
									<p class="info-oneline-table"><label>ERECTION</label> : <span class="value-oneline-table"><?php echo $header->fabrication; ?></span></p>
									<p class="info-oneline-table"><label>MATERIAL</label> : <span class="value-oneline-table"><?php echo $header->material; ?></span></p>
									<p class="info-oneline-table"><label>PAINTING</label> : <span class="value-oneline-table"><?php echo $header->painting; ?></span></p>
									<p class="info-oneline-table"><label>DELIVERY</label> : <span class="value-oneline-table"><?php echo $header->delivery; ?></span></p>
								</td>
							<?php
								}

							?>
							
						</tr>
						<?php
							}
						?>

						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td colspan="4">Grand Summary</td>
							<td><?php echo $detail_calc->grand_summary?></td>
							<th>JANGKA DAN KONDISI</th>
						</tr>
						<tr>
							<td colspan="4">Ppn 10%</td>
							<td><?php echo (intval($detail_calc->grand_summary)*10/100)?></td>
							<td rowspan="2">
								<p class="info-oneline-table"><label>Pembayaran</label> : <span class="value-oneline-table">100% COD</span></p>
								<p class="info-oneline-table"><label>Jangka Waktu</label> : <span class="value-oneline-table">2 Minggu</span></p>
								<p class="info-oneline-table"><label>Masa Berlaku</label> : <span class="value-oneline-table">14 hari</span></p>
							</td>
						</tr>
						<tr>
							<td colspan="4">Grand Total</td>
							<td><?php echo $detail_calc->grand_total?></td>
						</tr>
					</tbody>
				</table>

				<p>
					Demikian penawaran harga dari kami, kami menunggu konfirmasi lebih lanjut. Atas perhatian dan kerjasamanya kami mengucapkan terima kasih.
				</p>
			</div>
		</div>

		<p style="margin:0;padding:0;">Hormat Kami,</p>
		<p style="margin:0;margin-bottom:60px;"><b>PT. Buana Masa Metalindo</b></p>
		<p style="margin:0;"><b>Wiwi Liyanto</b></p>
		<p style="margin:0; margin-bottom:20px;">GM Marketing</p>

		<p>Contact Person:</p>


	</article>
</section>
<?php
	}
?>

</body>
</html>
