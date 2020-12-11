<html lang="en"><head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MRP </title>
    <?php $this->load->view('template/header_link'); ?>
<style type="text/css">/* line 2, stdin */
ul.suggestion {
  list-style: none;
  padding-left: 10px;
  position: absolute;
  background-color: #EDEDED;
  padding-right: 10px;
  z-index: 1; }
  /* line 9, stdin */
  ul.suggestion li {
    cursor: pointer; }
    /* line 12, stdin */
    ul.suggestion li :hover,
    ul.suggestion li :focus {
      color: #337ab7;
      background-color: white; }
</style><style type="text/css">/*.table-responsive {*/
/* line 6, stdin */
.table .div-thead {
  display: table-header-group; }
  /* line 11, stdin */
  .table .div-thead .div-tr .div-th {
    font-weight: bold;
    vertical-align: bottom;
    border-bottom: 2px solid #ddd; }

/* line 19, stdin */
.table .div-tbody {
  display: table-row-group; }

/* line 25, stdin */
.table .div-thead .div-tr, .table .div-tbody .div-tr {
  display: table-row; }
  /* line 28, stdin */
  .table .div-thead .div-tr .div-th, .table .div-thead .div-tr .div-td, .table .div-tbody .div-tr .div-th, .table .div-tbody .div-tr .div-td {
    line-height: 1.428571429;
    vertical-align: top;
    border-top: 1px solid #ddd;
    display: table-cell; }

/*}*/
</style><style type="text/css">* {
  box-sizing: border-box;
}
.datepicker {
  position: relative;
}
.calendar {
  position: absolute;
  z-index: 100;
  background: #fff;
  width: 300px;
  border: 1px solid #ccc;
}
.calendar header {
  display: block;
  line-height: 40px;
}
.calendar header span {
  display: inline-block;
  text-align: center;
  width: 71.42857142857143%;
  float: left;
}
.calendar header .prev,
.calendar header .next {
  width: 14.285714285714286%;
  float: left;
  text-indent: -10000px;
  position: relative;
}
.calendar header .prev:after,
.calendar header .next:after {
  content: '';
  position: absolute;
  left: 50%;
  top: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
  border: 6px solid transparent;
}
.calendar header .prev:after {
  border-right: 10px solid #000;
  margin-left: -5px;
}
.calendar header .prev.disabled:after {
  border-right: 10px solid #ddd;
}
.calendar header .next:after {
  border-left: 10px solid #000;
  margin-left: 5px;
}
.calendar header .next.disabled:after {
  border-left: 10px solid #ddd;
}
.calendar header .prev:not(.disabled),
.calendar header .next:not(.disabled),
.calendar header .up:not(.disabled) {
  cursor: pointer;
}
.calendar header .prev:not(.disabled):hover,
.calendar header .next:not(.disabled):hover,
.calendar header .up:not(.disabled):hover {
  background: #eee;
}
.calendar .disabled {
  color: #ddd;
  cursor: default;
}
.calendar .cell {
  display: inline-block;
  padding: 0 5px;
  width: 14.285714285714286%;
  height: 40px;
  line-height: 40px;
  text-align: center;
  vertical-align: middle;
  border: 1px solid transparent;
}
.calendar .cell:not(.blank):not(.disabled).day,
.calendar .cell:not(.blank):not(.disabled).month,
.calendar .cell:not(.blank):not(.disabled).year {
  cursor: pointer;
}
.calendar .cell:not(.blank):not(.disabled).day:hover,
.calendar .cell:not(.blank):not(.disabled).month:hover,
.calendar .cell:not(.blank):not(.disabled).year:hover {
  border: 1px solid #4bd;
}
.calendar .cell.selected {
  background: #4bd;
}
.calendar .cell.selected:hover {
  background: #4bd;
}
.calendar .cell.grey {
  color: #888;
}
.calendar .cell.grey:hover {
  background: inherit;
}
.calendar .cell.day-header {
  font-size: 75%;
  cursor: inherit;
}
.calendar .cell.day-header:hover {
  background: inherit;
}
.calendar .month,
.calendar .year {
  width: 33.333%;
}
</style><style type="text/css">
tr.mpk-detail > td {
    vertical-align: middle !important;
}
</style><style type="text/css">
.global-table-transition {
    -webkit-transition: all .2s cubic-bezier(0.4, 0.0, 0.6, 1);
    -moz-transition: all .2s cubic-bezier(0.4, 0.0, 0.6, 1);
    -ms-transition: all .2s cubic-bezier(0.4, 0.0, 0.6, 1);
    -o-transition: all .2s cubic-bezier(0.4, 0.0, 0.6, 1);
    transition: all .2s cubic-bezier(0.4, 0.0, 0.6, 1);

    opacity: 1;
}

.global-table-enter, .global-table-leave {
    opacity: 0;
}
</style><style type="text/css">
.v-select {
	position: relative;
}

.v-select .open-indicator {
	position: absolute;
	bottom: 6px;
	right: 10px;
	display: inline-block;
	cursor: pointer;
	pointer-events: all;
	-webkit-transition: all 150ms cubic-bezier(1.000, -0.115, 0.975, 0.855);
	transition: all 150ms cubic-bezier(1.000, -0.115, 0.975, 0.855);
	-webkit-transition-timing-function: cubic-bezier(1.000, -0.115, 0.975, 0.855);
	        transition-timing-function: cubic-bezier(1.000, -0.115, 0.975, 0.855);
	opacity: 1;
	-webkit-transition: opacity .1s;
	transition: opacity .1s;
}

.v-select.loading .open-indicator {
	opacity: 0;
}

.v-select .open-indicator:before {
	border-color: rgba(60, 60, 60, .5);
	border-style: solid;
	border-width: 0.25em 0.25em 0 0;
	content: '';
	display: inline-block;
	height: 10px;
	width: 10px;
	vertical-align: top;
	-webkit-transform: rotate(133deg);
	        transform: rotate(133deg);
	-webkit-transition: all 150ms cubic-bezier(1.000, -0.115, 0.975, 0.855);
	transition: all 150ms cubic-bezier(1.000, -0.115, 0.975, 0.855);
	-webkit-transition-timing-function: cubic-bezier(1.000, -0.115, 0.975, 0.855);
	        transition-timing-function: cubic-bezier(1.000, -0.115, 0.975, 0.855);
}

.v-select.open .open-indicator {
	bottom: 1px;
}

.v-select.open .open-indicator:before {
	-webkit-transform: rotate(315deg);
	        transform: rotate(315deg);
}

.v-select .dropdown-toggle {
	display: block;
	padding: 0;
	background: white;
	border: 1px solid rgba(60, 60, 60, .26);
	border-radius: 4px;
	white-space: normal;
}

.v-select.searchable .dropdown-toggle {
	cursor: text;
}

.v-select.open .dropdown-toggle {
	border-bottom: none;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

.v-select > .dropdown-menu {
	margin: 0;
	width: 100%;
	overflow-y: scroll;
	border-top: none;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.v-select .selected-tag {
	color: #333;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	border-radius: 4px;
	height: 26px;
	margin: 4px 1px 0px 3px;
	padding: 0 0.25em;
	float: left;
	line-height: 1.7em;
}

.v-select .selected-tag .close {
	float: none;
	margin-right: 0;
	font-size: 20px;
}

.v-select input[type=search],
.v-select input[type=search]:focus {
	display: inline-block;
	border: none;
	outline: none;
	margin: 0;
	padding: 0 .5em;
	width: 10em;
	max-width: 100%;
	background: none;
	position: relative;
	box-shadow: none;
	float: left;
	clear: none;
}

.v-select input[type=search]:disabled {
	cursor: pointer;
}

.v-select li a {
	cursor: pointer;
}

.v-select .active a {
	background: rgba(50, 50, 50, .1);
	color: #333;
}

.v-select .highlight a,
.v-select li:hover > a {
	background: #f0f0f0;
	color: #333;
}

.v-select .spinner {
	opacity: 0;
	position: absolute;
	top: 5px;
	right: 10px;
	font-size: 5px;
	text-indent: -9999em;
	overflow: hidden;
	border-top: .9em solid rgba(100, 100, 100, .1);
	border-right: .9em solid rgba(100, 100, 100, .1);
	border-bottom: .9em solid rgba(100, 100, 100, .1);
	border-left: .9em solid rgba(60, 60, 60, .45);
	-webkit-transform: translateZ(0);
	        transform: translateZ(0);
	-webkit-animation: vSelectSpinner 1.1s infinite linear;
	        animation: vSelectSpinner 1.1s infinite linear;
	-webkit-transition: opacity .1s;
	transition: opacity .1s;
}

.v-select.loading .spinner {
	opacity: 1;
}

.v-select .spinner,
.v-select .spinner:after {
	border-radius: 50%;
	width: 5em;
	height: 5em;
}

@-webkit-keyframes vSelectSpinner {
	0% {
		-webkit-transform: rotate(0deg);
		        transform: rotate(0deg);
	}
	100% {
		-webkit-transform: rotate(360deg);
		        transform: rotate(360deg);
	}
}

@keyframes vSelectSpinner {
	0% {
		-webkit-transform: rotate(0deg);
		        transform: rotate(0deg);
	}
	100% {
		-webkit-transform: rotate(360deg);
		        transform: rotate(360deg);
	}
}
</style><style type="text/css">/* line 4, stdin */
.box-body label {
  text-align: left !important; }
</style><style type="text/css">
.required {
    color: red;
}
</style><style type="text/css">
.input-width-75px {
    width: 75px;
}
</style></head>
<body style="padding-bottom: 30px;">
<?php $this->load->view('ppic/header'); ?>

    <div class="container-fluid" style="min-height: 77.5vh">
        <div class="header">
            <h5 style="font-weight: bold">
                Create New DKM
            </h5>
        </div>
        <div class="body">
            <div class="col-md-12">
                <form method="post" class="form form-horizontal" action="<?php echo base_url() ?>ppc/dkm_add">
    <input type="hidden" value="<?php echo $header->id??'' ?>" name="id">
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5>Main</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Bill of Quantity No</label>
                            <div class="col-md-7">
                            	<select class="form-control selectpicker" name="boq_number" required>
		                        <option selected disabled>Please Choose</option>
		                        <?php foreach ($boq as $key => $value) {?>
		                          <option value="<?php echo $value->bill_no; ?>"><?php echo $value->bill_no; ?></option>
		                        <?php } ?>
		                      </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Customer</label>
                            <div class="col-md-7">
                                <input type="text" readonly="" class="form-control input-size-md" name="customer">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Project Name</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-size-sm" name="project_name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Quotation</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-size-sm" name="quotation">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Job Order No</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-size-sm" name="joborder_no">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
						    <label class="control-label col-md-3" style="color: red">DKM Number.</label>
						    <div class="col-md-9">
						        <input type="text" class="form-control input-sm input-size-md" readonly="" name="dkm_number" value="<?php if(empty($header)){ echo $dkm_no->pattern;}else{ echo $header->dkm_number??'';} ?>">
						        <input type="checkbox" checked> <i style="font-size: 12px;">auto-generate</i>
						        <!--<button type="button" @click="generateNumber('Quotation', 'active.no')" class="btn btn-info btn-xs">Generate</button>-->
						    </div>
						</div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Date</label>
                            <div class="col-md-5">
                                <input  placeholder="Select Date" type="date" value="<?php echo $header->date??'' ?>" name="date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Revision No#</label>
                            <div class="col-md-6">
                                <input type="text" readonly="" class="form-control input-sm input-size-xs" name="rev_no">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Revision Date</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-sm input-size-xs" name="rev_date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Note</label>
                            <div class="col-md-9">
                                <textarea type="text" class="form-control input-sm input-size-lg" rows="2" name="note"><?php echo $header->note??'' ?></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5>Detail</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table-striped table-hover table-bordered table-condensed datatable">
                            <thead>
                            <tr>
                                <th rowspan="2" style="width: 30px;text-align: center">No.</th>
                                <th rowspan="2" style="width: 65px;">Material</th>
                                <th rowspan="2" style="text-align: center">Description</th>
                                <th colspan="2" style="text-align: center">Quantity</th>
                                <th rowspan="2" style="text-align: center">Weight</th>
                                <th rowspan="2" style="text-align: center">Planning</th>
                                <th colspan="2" style="text-align: center">Actual</th>
                                <th rowspan="2" style="width: 150px;text-align: center">Remark</th>
                            </tr>
                            <tr><th style="width: 90px; text-align: center">Pcs</th>
                            <th style="width: 90px; text-align: center">Unit</th>
                            <th style="width: 90px; text-align: center">Input</th>
                            <th style="width: 90px; text-align: center">Output</th>
                            </tr></thead>
                            <tbody class="tbody-detail">
                            	<?php if(empty($detail)){?>
                            		<tr>
									    <td style="text-align: center;"><span class="numbering">1</span>
									        <input type="hidden" value="">
									    </td>
									    <td>
									        <select class="form-control selectpicker" name="detail_material[]" data-live-search="true">
					                        <option selected disabled>Please Choose</option>
					                        <?php foreach ($material as $key => $value) {?>
					                          <option value="<?php echo $value->material_id; ?>" desc="<?php echo $value->product_name; ?>" unit="<?php echo $value->unit_measures; ?>" weight="<?php echo $value->weight; ?>"><?php echo $value->material_id; ?></option>
					                        <?php } ?>
					                      </select>
									    </td>
									    <td>
									        <input type="text" class="form-control" name="detail_desc[]">
									    </td>
									    <td>
									        <input type="text" class="form-control" name="detail_pcs[]">
									    </td>
									    <td>
									        <input type="text" class="form-control" readonly="" name="detail_unit[]">
									    </td>
									    <td>
									        <input type="text" class="form-control" readonly="" name="detail_weight[]">
									    </td>
									    <td>
									        <input type="date" class="form-control" name="detail_planing[]"/>
									    </td>
									    <td>
									        <input type="date" class="form-control" name="detail_input[]" />
									    </td>
									    <td>
									       <input type="date" class="form-control" name="detail_output[]" />
									    </td>
									    <td>
									    	<center>
									        <button type="button" class="btn btn-info btn-xs add_button">
					                          <i class="fa fa-plus"></i>
					                     	</button>
					                      	<button type="button" class="btn btn-danger btn-xs remove_button">
					                          <i class="fa fa-minus"></i>
					                      	</button>
					                      	</center>
									    </td>
									</tr>
                            	<?php }else{ $i=1; foreach ($detail as $key2 => $value2) {?>
                            		<tr>
									    <td style="text-align: center;"><span class="numbering"><?php echo $i; ?></span>
									        <input type="hidden" value="">
									    </td>
									    <td>
									        <select class="form-control selectpicker" name="detail_material[]" data-live-search="true">
					                        <!-- <option selected disabled>Please Choose</option> -->
					                        <?php foreach ($material as $key => $value) {
					                        	if($value2->material==$value->material_id){?>
					                        		<option value="<?php echo $value->material_id; ?>" desc="<?php echo $value->product_name; ?>" unit="<?php echo $value->unit_measures; ?>" weight="<?php echo $value->weight; ?>" selected><?php echo $value->material_id; ?></option>
					                        	<?php }else{?>
					                        		<option value="<?php echo $value->material_id; ?>" desc="<?php echo $value->product_name; ?>" unit="<?php echo $value->unit_measures; ?>" weight="<?php echo $value->weight; ?>"><?php echo $value->material_id; ?></option>
					                        	<?php }?>
					                          
					                        <?php } ?>
					                      </select>
									    </td>
									    <td>
									        <input type="text" class="form-control" name="detail_desc[]" value="<?php echo $value2->desc??'' ?>">
									    </td>
									    <td>
									        <input type="text" class="form-control" name="detail_pcs[]" value="<?php echo $value2->pcs??'' ?>">
									    </td>
									    <td>
									        <input type="text" class="form-control" readonly="" name="detail_unit[]" value="<?php echo $value2->unit??'' ?>">
									    </td>
									    <td>
									        <input type="text" class="form-control" readonly="" name="detail_weight[]" value="<?php echo $value2->weight??'' ?>">
									    </td>
									    <td>
									        <input type="date" class="form-control" name="detail_planing[]" value="<?php echo $value2->planning??'' ?>"/>
									    </td>
									    <td>
									        <input type="date" class="form-control" name="detail_input[]" value="<?php echo $value2->input??'' ?>"/>
									    </td>
									    <td>
									       <input type="date" class="form-control" name="detail_output[]" value="<?php echo $value2->output??'' ?>" />
									    </td>
									    <td>
									    	<center>
									        <button type="button" class="btn btn-info btn-xs add_button">
					                          <i class="fa fa-plus"></i>
					                     	</button>
					                      	<button type="button" class="btn btn-danger btn-xs remove_button">
					                          <i class="fa fa-minus"></i>
					                      	</button>
					                      	</center>
									    </td>
									</tr>
                            	<?php $i+=1; } } ?>
	                            
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="5">Total</th>
                                <th><input type="text" class="form-control" readonly="" name="detail_total_weight"></th>
                                <th colspan="4"></th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-info btn-xs">Save</button>
            <!--v-if-->
            <div class="clearfix"></div>
        </div>
    </div>
</form><!--v-component-->
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
<script>
	$(document).ready(function(){
		var data1="<?php echo $header->bill_quotation_id??'' ?>";
		$('select[name="boq_number"]').val(data1);
		$('select[name="boq_number"]').selectpicker("refresh");
		console.log(data1);
		$.ajax({
            url: '<?php echo base_url() ?>ppc/dkm_select',
            type: 'POST',
            data: {id: data1},
        })
        .done(function(res) {
            // console.log(res);
            var plainText = "";
            var date=new Date();
            var salt = "salted";
            var iv = '1111111111111111';
            var iterations = 999;
            var passphrase = "<?php echo $this->session->userdata('token'); ?>";
            function getKey(passphrase, salt){
                var key = CryptoJS.PBKDF2(passphrase, salt, {
                    hasher: CryptoJS.algo.SHA256,
                    keySize: 64 / 8,
                    iterations: iterations
                });
                return key;
            }
            function userJSEncrypt(passphrase, plainText){
                var key = getKey(passphrase, salt);
                var encrypted = CryptoJS.AES.encrypt(plainText, key, {
                    iv: CryptoJS.enc.Utf8.parse(iv)
                });
                return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
            }
            function userJSDecrypt(passphrase, encryptedText){
                var key = getKey(passphrase, salt);
                var decrypted = CryptoJS.AES.decrypt(encryptedText, key, {
                    iv: CryptoJS.enc.Utf8.parse(iv)
                });
                return decrypted.toString(CryptoJS.enc.Utf8);
            }
            res=userJSDecrypt(passphrase, res);
            res=JSON.parse(res);
            console.log(res);
            $("input[name='customer']").val(res.customer_name);
            $("input[name='project_name']").val(res.project_name);
            $("input[name='quotation']").val(res.qn_number);
            $("input[name='joborder_no']").val(res.job_number);
            $("input[name='rev_date']").val(res.rev_date);
            $("input[name='rev_no']").val(res.rev_no);
            $("textarea[name='note']").text(res.note);
          });
	});

	$(document).on('change','select[name="boq_number"]',function(){
		var data1=$(this).val();
		$.ajax({
            url: '<?php echo base_url() ?>ppc/dkm_select',
            type: 'POST',
            data: {id: data1},
        })
        .done(function(res) {
            // console.log(res);
            var plainText = "";
            var date=new Date();
            var salt = "salted";
            var iv = '1111111111111111';
            var iterations = 999;
            var passphrase = "<?php echo $this->session->userdata('token'); ?>";
            function getKey(passphrase, salt){
                var key = CryptoJS.PBKDF2(passphrase, salt, {
                    hasher: CryptoJS.algo.SHA256,
                    keySize: 64 / 8,
                    iterations: iterations
                });
                return key;
            }
            function userJSEncrypt(passphrase, plainText){
                var key = getKey(passphrase, salt);
                var encrypted = CryptoJS.AES.encrypt(plainText, key, {
                    iv: CryptoJS.enc.Utf8.parse(iv)
                });
                return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
            }
            function userJSDecrypt(passphrase, encryptedText){
                var key = getKey(passphrase, salt);
                var decrypted = CryptoJS.AES.decrypt(encryptedText, key, {
                    iv: CryptoJS.enc.Utf8.parse(iv)
                });
                return decrypted.toString(CryptoJS.enc.Utf8);
            }
            res=userJSDecrypt(passphrase, res);
            res=JSON.parse(res);
            console.log(res);
            $("input[name='customer']").val(res.customer_name);
            $("input[name='project_name']").val(res.project_name);
            $("input[name='quotation']").val(res.qn_number);
            $("input[name='joborder_no']").val(res.job_number);
            $("input[name='rev_date']").val(res.rev_date);
            $("input[name='rev_no']").val(res.rev_no);
            $("textarea[name='note']").text(res.note);
          });
	});

	$(document).on("change","select[name='detail_material[]']",function(){
		var weight=$('option:selected', this).attr('weight');
		var unit=$('option:selected', this).attr('unit');
		var desc=$('option:selected', this).attr('desc');

		console.log(desc)
		$(this).parent().parent().siblings("td").children("input[name='detail_desc[]']").val(desc);
		$(this).parent().parent().siblings("td").children("input[name='detail_unit[]']").val(unit);
		$(this).parent().parent().siblings("td").children("input[name='detail_weight[]']").val(weight);
		$(this).parent().parent().siblings("td").children("input[name='detail_weight[]']").attr("weight",weight);
	});

	$(document).on("click",".add_button",function(){
		var data1=null;
		$.ajax({
            url: '<?php echo base_url() ?>ppc/dkm_select2',
            type: 'POST',
            data: {id: data1},
        })
        .done(function(res) {
            // console.log(res);
            var plainText = "";
            var date=new Date();
            var salt = "salted";
            var iv = '1111111111111111';
            var iterations = 999;
            var passphrase = "<?php echo $this->session->userdata('token'); ?>";
            function getKey(passphrase, salt){
                var key = CryptoJS.PBKDF2(passphrase, salt, {
                    hasher: CryptoJS.algo.SHA256,
                    keySize: 64 / 8,
                    iterations: iterations
                });
                return key;
            }
            function userJSEncrypt(passphrase, plainText){
                var key = getKey(passphrase, salt);
                var encrypted = CryptoJS.AES.encrypt(plainText, key, {
                    iv: CryptoJS.enc.Utf8.parse(iv)
                });
                return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
            }
            function userJSDecrypt(passphrase, encryptedText){
                var key = getKey(passphrase, salt);
                var decrypted = CryptoJS.AES.decrypt(encryptedText, key, {
                    iv: CryptoJS.enc.Utf8.parse(iv)
                });
                return decrypted.toString(CryptoJS.enc.Utf8);
            }
            res=userJSDecrypt(passphrase, res);
            res=JSON.parse(res);
            // console.log(res);
            str="";
            str='<tr><td style="text-align: center;"><span class="numbering">1</span> <input type="hidden" value=""></td><td> <select class="form-control selectpicker" name="detail_material[]" data-live-search="true"><option selected disabled>Please Choose</option>';
            for (var i = 0; i < res.length; i++) {
            	str+='<option value="'+res[i].material_id+'" desc="'+res[i].product_name+'" unit="'+res[i].unit_measures+'" weight="'+res[i].weight+'">'+res[i].material_id+'</option>';
            }
            
            str+='</select></td><td> <input type="text" class="form-control" name="detail_desc[]"></td><td> <input type="text" class="form-control" name="detail_pcs[]"></td><td> <input type="text" class="form-control" readonly="" name="detail_unit[]"></td><td> <input type="text" class="form-control" readonly="" name="detail_weight[]"></td><td> <input type="date" class="form-control" name="detail_planing[]"/></td><td> <input type="date" class="form-control" name="detail_input[]" /></td><td> <input type="date" class="form-control" name="detail_output[]" /></td><td><center> <button type="button" class="btn btn-info btn-xs add_button"> <i class="fa fa-plus"></i> </button> <button type="button" class="btn btn-danger btn-xs remove_button"> <i class="fa fa-minus"></i> </button></center></td></tr>';
             
            $(".tbody-detail").append(str);
            for (var i = 0; i <= $(".numbering").length; i++) {
	          	$(".numbering").eq(i).text(i+1);
	      	}
	      	$("select[name='detail_material[]']").selectpicker("refresh");
          });
	});

	$(document).on("click",".remove_button",function(){
		$(this).parent().parent().remove();
      	for (var i = 0; i <= $(".numbering").length; i++) {
          	$(".numbering").eq(i).text(i+1);
      	}
	});

	$(document).on("keyup","input[name='detail_pcs[]']",function(){
		var qty=$(this).val();
		var weight=$(this).parent().siblings("td").children("input[name='detail_weight[]']").attr("weight");
		$(this).parent().siblings("td").children("input[name='detail_weight[]']").val(qty*weight);
	});
</script>	
</body></html>