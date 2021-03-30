<html>
<head>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>plugin/bootstrap/css/bootstrap-grid.css"/>
    <link rel="stylesheet" href="<?php echo base_url() ?>plugin/fontawesome/css/all.css">
	
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

		.label-oneline-table{
			display: inline-block;
			width:120px;
			margin-right:2px;
			vertical-align: text-bottom;
		}

		.value-oneline-table{
			overflow-wrap: break-word;
			word-wrap: break-word;
			hyphens: auto;
			display: inline-block;
			width:80px;
		}

        .inner-content-table{
            margin-bottom:30px;
        }

	</style>

</head>
<body class="A5">

<section class="sheet padding-10mm">
	<!-- Write HTML just like a web page -->

	<article>
    <table border="1" cellspacing="0" cellpadding="1">
        <tr>
            <td colspan="4">
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
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col" style="margin:0;padding:0;">
                            <p class="info-oneline-table"><label class="label-oneline-table">CUSTOMER</label>: <span class="value-oneline-table"><?php echo $customer->name;?></span></p>
                            <p class="info-oneline-table"><label class="label-oneline-table">ADDRESS</label>: <span class="value-oneline-table"><?php echo $customer->address;?></span></p>
                            <p class="info-oneline-table"><label class="label-oneline-table">PURCHASE ORDER NO</label>: <span class="value-oneline-table">5200191997</span></p>
                            <p class="info-oneline-table"><label class="label-oneline-table">DELIVERY POINT</label>: <span class="value-oneline-table"></span></p>
                        </div>

                        <div class="col" style="margin:0;padding:0;">
                            <p class="info-oneline-table"><label class="label-oneline-table">JOB ORDER NO.</label> : <span class="value-oneline-table"><?php echo $job->job_number;?></span></p>
                            <p class="info-oneline-table"><label class="label-oneline-table">ORDER DATE</label>: <span class="value-oneline-table"><?php echo $job->jo_date;?></span></p>
                            <p class="info-oneline-table"><label class="label-oneline-table">DELIVERY DATE</label>: <span class="value-oneline-table"><?php echo $job->delivery_date;?></span></p>
                            <p class="info-oneline-table"><label class="label-oneline-table">NPWP</label>: <span class="value-oneline-table"><?php echo $customer->npwp;?></span></p>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>

            <th width="20">NO</th>
            <th>QTY</th>
            <th width="200">DESCRIPTION</th>
            <th>SCOPE OF WORK</th>

        </tr>
        <tr>
            <td rowspan="3">
                <div class="inner-content-table">1</div>

                <div class="inner-content-table">1</div>
            </td>
            <td rowspan="3">
                <div class="inner-content-table">5 ea</div>

                <div class="inner-content-table">5 ea</div>
            </td>
            <td rowspan="3">
                <div class="inner-content-table">Towing Clip CAT793 MK M-001L, F1001935</div>

                <div class="inner-content-table">Towing Clip CAT793 MK M-001L, F1001935</div>
            </td>
            <td>
                <div class="container">
                    <div class="row">
                        <div class="col" style="margin:0;padding:0;">
                            Engineering
                        </div>
                        <div class="col-1" style="margin:0;padding:0;">
                            :
                        </div>
                        <div class="col" style="margin:0;padding:0;">
                            <div>
                                <span class="fa fa-check-square"></span> FABRICATION<br>
                                <span class="fa fa-check-square"></span> AS DULT DRWAING<br>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col" style="margin:0;padding:0;">
                            PPC
                        </div>
                        <div class="col-1" style="margin:0;padding:0;">
                            :
                        </div>
                        <div class="col" style="margin:0;padding:0;">
                            <div>
                                <span class="fa fa-square"></span> MATERIAL<br>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col" style="margin:0;padding:0;">
                            Production
                        </div>
                        <div class="col-1" style="margin:0;padding:0;">
                            :
                        </div>
                        <div class="col" style="margin:0;padding:0;">
                            <div>
                                <span class="fa fa-square"></span> SANDBLASTING<br>
                                <span class="fa fa-check-square"></span> PAINTING<br>
                                <span class="fa fa-square"></span> GALVANISHED<br>
                                <span class="fa fa-check-square"></span> ERECTION<br>
                                <span class="fa fa-square"></span> PACKAGING<br>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col" style="margin:0;padding:0;">
                            Qualiti Control (QC)
                        </div>
                        <div class="col-1" style="margin:0;padding:0;">
                            :
                        </div>
                        <div class="col" style="margin:0;padding:0;">
                            <div>
                                <span class="fa fa-square"></span> NOT<br>
                                <span class="fa fa-square"></span> CERTIFICATE<br>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col" style="margin:0;padding:0;">
                            Marketing
                        </div>
                        <div class="col-1" style="margin:0;padding:0;">
                            :
                        </div>
                        <div class="col" style="margin:0;padding:0;">
                            <div>
                                <span class="fa fa-square"></span> Delivery<br>
                            </div>
                        </div>
                    </div>
                </div>

                
            </td>
        </tr>
        <tr>
            <th>TERM AND CONDITIONS</th>
        </tr>
        <tr>
            <td>
                <div class="container">
                    <div class="row">
                        <div class="col" style="margin:0;padding:0;">
                            Payment
                        </div>
                        <div class="col-1" style="margin:0;padding:0;">
                            :
                        </div>
                        <div class="col" style="margin:0;padding:0;">
                           30 Days
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <table border="1" cellspacing="0" cellpadding="1" width="100%">
        <tr>
            <th>
                PREPARED BY
            </th>
            <th>
                ACKNOWLEDGE BY
            </th>
            <th>
                APPROVED BY
            </th>
        </tr>

        <tr>
            <th>
                <div style="height:80px"> </div>
            </th>
            <th>
                <div style="height:80px"> </div>
            </th>
            <th>
                <div style="height:80px"> </div>
            </th>
        </tr>

        <tr>
            <th>
                <div style="height:10px"> </div>
            </th>
            <th>
                <div style="height:10px"> </div>
            </th>
            <th>
                <div style="height:10px"> </div>
            </th>
        </tr>

	</table>
		


	</article>
</section>


</body>
</html>
