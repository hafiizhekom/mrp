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

<?php $this->load->view('purchasing/header'); ?>

    <div class="container-fluid" style="min-height: 77.5vh">
        <div class="header">
            <h5 style="font-weight: bold">
              <?php if(empty($master_part->id)){ ?>
                Create New Master Data
              <?php }else{?>
                Edit Master Data
              <?php } ?>
            </h5>
        </div>
        <div class="body">
            <div class="col-md-12">
                <form class="form form-horizontal"method="POST" action="<?php echo base_url() ?>purchasing/material/create_add">
    <input type="hidden" name="id" value="<?php echo $master_part->id??''; ?>">
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5>MATERIAL MAIN INFORMATION</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Material ID</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="material_id" value="<?php echo $master_part->material_id??''; ?>" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Part Code</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="part_code" value="<?php echo $master_part->part_code??''; ?>" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Product Code</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="product_code" value="<?php echo $master_part->product_code??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Product Name</label>
                            <div class="col-md-9">
                                <textarea type="text" class="form-control input-sm" name="product_name" ><?php echo $master_part->product_name??''; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Product Category</label>
                            <div class="col-md-9">
                                <select class="form-control input-sm" name="product">
                                    <option selected disabled></option>
                                    <?php foreach ($product as $key => $value) {?>
                                      <option value="<?php echo $value->code; ?>"><?php echo $value->code; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5>TECHNICAL ASPECTS</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Unit of Measures</label>
                            <div class="col-md-9">
                                <select class="form-control input-sm" name="unit">
                                    <option value="BTG">
                                        BTG
                                    </option><option value="CAN">
                                        CAN
                                    </option><option value="GR">
                                        GR
                                    </option><option value="KG">
                                        KG
                                    </option><option value="LMB">
                                        LMB
                                    </option><option value="LTR">
                                        LTR
                                    </option><option value="M">
                                        M
                                    </option><option value="PCS">
                                        PCS
                                    </option><option value="SET">
                                        SET
                                    </option><option value="EA">
                                        EA
                                    </option><option value="Unit">
                                        Unit
                                    </option><option value="LS">
                                        LS
                                    </option><option value="LOT">
                                        LOT
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Dimension Type</label>
                            <div class="col-md-9">
                                <select class="form-control input-sm" name="dimension_type">
                                    <option value="Length">Length</option>
                                    <option value="Area">Area</option>
                                    <option value="Volume">Volume</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Material Group</label>
                            <div class="col-md-9">
                                <select class="form-control input-sm" name="material_group">
                                    <!--v-for-start--><option value="AS">
                                        AS
                                    </option><option value="ASSB">
                                        ASSB
                                    </option><option value="CIVIL">
                                        CIVIL
                                    </option><option value="CKPLATE">
                                        CKPLATE
                                    </option><option value="CNP">
                                        CNP
                                    </option><option value="HB">
                                        HB
                                    </option><option value="L">
                                        L
                                    </option><option value="PIPE">
                                        PIPE
                                    </option><option value="PLATE">
                                        PLATE
                                    </option><option value="RING">
                                        RING
                                    </option><option value="ST">
                                        ST
                                    </option><option value="TRAP">
                                        TRAP
                                    </option><option value="TRIANGLE">
                                        TRIANGLE
                                    </option><option value="UNP">
                                        UNP
                                    </option><option value="WF">
                                        WF
                                    </option><!--v-for-end-->
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Material Type</label>
                            <div class="col-md-9">
                                <select class="form-control input-sm" name="material_type">
                                    <option value="1">SS-304</option>
                                    <option value="2">MS</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Material Density</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="material_density" value="<?php echo $master_part->material_density??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Weight Factor</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="weight_factor" value="<?php echo $master_part->weight_factor??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Surface Area</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="surface_area" value="<?php echo $master_part->surface_area??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">HS Number</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="hs_number" value="<?php echo $master_part->hs_number??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Paint Factor</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="paint_factor" value="<?php echo $master_part->point_facter??''; ?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">Length (mm)</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="length" value="<?php echo $master_part->length??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Width (mm)</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="width" value="<?php echo $master_part->width??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Thick (mm)</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="thick" value="<?php echo $master_part->thick??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Weight (KG)</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="weight" value="<?php echo $master_part->weight??''; ?>" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Welding Type</label>
                            <div class="col-md-9">
                                <select class="form-control input-sm" name="wielding_type">
                                    <option value="NSN-308">NSN-308</option>
                                    <option value="LB-52">LB-52</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Drawing</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="drawing_number" value="<?php echo $master_part->drawing_number??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Volume Formula
                                <p><i>You may input "length", "thick", "width", to count the volume</i></p>
                            </label>
                            <div class="col-md-9">
                                <textarea type="text" class="form-control input-sm" name="volume_formula"><?php echo $master_part->volume_formula??''; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Area Formula
                                <p><i>You may input "length", "width", to count the area</i></p>
                            </label>
                            <div class="col-md-9">
                                <textarea type="text" class="form-control input-sm" name="area_formula"><?php echo $master_part->area_formula??''; ?></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5>COMMERCIAL & SUPPLY</h5>
            </div>
            <div class="box-body">
                <div class="row">
                  <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">Minimum Order Qty</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="minimum_qty">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Minimum Stock</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="stock">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Proses Cost</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="cost">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color:red;">Supplier Name</label>
                            <div class="col-md-9">
                               <select class="form-control" name="supplier">
                                <option selected disabled>Please Choose</option>
                                 <?php foreach ($vendor as $key => $value) {?>
                                   <option value="<?php echo $value->id??'' ?>"><?php echo $value->supplier_name??'' ?></option>
                                 <?php } ?>
                               </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Supply Lead Time</label>
                            <div class="col-md-9">
                                <textarea type="text" class="form-control input-sm" rows="3" name="lead_time"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Currency</label>
                            <div class="col-md-9">
                                <select class="form-control input-sm" name="currency">
                                    <option value="IDR">
                                        IDR
                                    </option>
                                    <option value="USD">
                                        USD
                                    </option>
                                    <option value="¥en">
                                        ¥en
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" id="check_form" disabled class="btn btn-info btn-xs">Save</button>
        </div>
    </div>
</form><!--v-component-->
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
<script type="text/javascript">
  $(document).ready(function(){
    $("select[name='product']").val("<?php echo $master_part->product_category??''; ?>");
    $("select[name='warehouse']").val("<?php echo $master_part->warehouse_location??''; ?>");
    $("select[name='unit']").val("<?php echo $master_part->unit_measures??''; ?>");
    $("select[name='dimension_type']").val("<?php echo $master_part->dimension_type??''; ?>");
    $("select[name='material_group']").val("<?php echo $master_part->material_group??''; ?>");
    $("select[name='material_type']").val("<?php echo $master_part->material_type??''; ?>");
    $("select[name='wielding_type']").val("<?php echo $master_part->wielding_type??''; ?>");
    if($("input[name='id']").val()!=""){
      $("#check_form").attr("disabled",false);
    }
  });
  $(document).on("focusout","input[name='material_id']",function(){
    var data=$(this).val();
    $.ajax({
        url: '<?php echo base_url() ?>purchasing/material_check',
        type: 'POST',
        dataType: 'json',
        data: {id: data},
      })
      .done(function(res) {
        console.log(res);
        if(res==""){
          $("#check_form").attr("disabled",false);
        }else{
          $("#check_form").attr("disabled",true);
        }
        if($("input[name='id']").val()!=""){
          $("#check_form").attr("disabled",false);
        }
      })
  });
  $(document).on("focusout","textarea[name='volume_formula']",function(){
    var formula=$(this).val();
    console.log(formula);
    var length=$("input[name='length']").val();
    var width=$("input[name='width']").val();
    var thick=$("input[name='thick']").val();
    var density=$("input[name='material_density']").val();
    var factor=$("input[name='weight_factor']").val();
    if(formula.includes("length")==true){
      formula=formula.replace("length", length);
    }
    if(formula.includes("width")==true){
      formula=formula.replace("width", width);
    }
    if(formula.includes("thick")==true){
      formula=formula.replace("thick", thick);
    }
    var weight_total = eval(formula);
    console.log(weight_total);
    weight_total=weight_total*density*factor;
    weight_total=weight_total/1000000;
    console.log(weight_total);
    $("input[name='weight']").val(weight_total);
  });
</script>
</body></html>