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
<?php $this->load->view('engineering/header'); ?>

    <div class="container-fluid" style="min-height: 77.5vh">
        <div class="header">
            <h5 style="font-weight: bold">
                Create New Bill of Quantity
            </h5>
        </div>
        <div class="body">
            <div class="col-md-12">
                <form class="form form-horizontal" method="POST" action="<?php echo base_url() ?>engineering/boq_add">
    <input type="hidden" name="id" value="" id="job_id">
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5>BOQ INFORMATION</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Joborder No</label>
                            <div class="col-md-9">
                              <select class="form-control selectpicker" name="job_number" required>
                                <option selected disabled>Please Choose</option>
                                <?php foreach ($joborder as $key => $value) {?>
                                  <option value="<?php echo $value->job_number; ?>"><?php echo $value->job_number; ?></option>
                                <?php } ?>
                              </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Customer</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-size-md" name="customer">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Project Name</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-size-auto" name="project">
                            </div>
                        </div>
                        <div class="form-group">
    <label class="control-label col-md-3" style="color: red">Bill Of Quantity No</label>
    <div class="col-md-9">
        <input type="text" class="form-control input-sm input-size-md" readonly="" value="<?php echo $boq_no->pattern; ?>" name="boq_no">
        <input type="checkbox" checked> <i style="font-size: 12px;">auto-generate</i>
        <!--<button type="button" @click="generateNumber('Quotation', 'active.no')" class="btn btn-info btn-xs">Generate</button>-->
    </div>
</div><!--v-component-->
                        <div class="form-group">
                            <label class="control-label col-md-3">Date</label>
                            <div class="col-md-9">
                              <input placeholder="Select Date" type="date" name="date" value="<?php echo $header->date??'' ?>" required />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                       
                        <div class="form-group">
                            <label class="control-label col-md-3">Revision No#</label>
                            <div class="col-md-9">
                                <input readonly="" type="text" class="form-control input-sm  input-size-xs" name="rev_no">
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
                                <textarea rows="3" class="form-control input-sm  input-size-lg" name="note"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5>Assembly Detail</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table-bordered table-condensed table-striped table-hover datatable">
                            <thead>
                            <tr>
                                <th style="width: 30px;">No.</th>
                                <th style="width: 150px;">Assembly Mark</th>
                                <th>Description</th>
                                <th style="width: 60px;">Quantity (Set)</th>
                                <th>Total Area (m2)</th>
                                <th style="width: 72px;">Total Weight (kg)</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody class="body-assembly">
                              <?php if(empty($assembly_detail)){?>
                            <tr>
                                  <td><span class="numbering_assembly">1</span></td>
                                  <td><input type="hidden" name="assembly_id[]" /><input type="text" class="form-control input-sm" name="assembly_mark[]"></td>
                                  <td><input type="text" class="form-control input-sm" name="assembly_desc[]"></td>
                                  <td><input type="text" class="form-control input-sm" name="assembly_qty[]" style="width: 100px;">
                                  </td>
                                  <td><input type="text" class="form-control input-sm" name="assembly_totalarea[]" readonly="">
                                  </td>
                                  <td><input type="text" name="assembly_totalweight[]" class="form-control input-sm" style="width: 100px;" readonly=""></td>
                                  <td style="width: 57px;">
                                      <button type="button" class="btn btn-info btn-xs add_button_assembly">
                                          <i class="fa fa-plus"></i>
                                      </button>
                                      <button type="button" class="btn btn-danger btn-xs remove_button_assembly">
                                          <i class="fa fa-minus"></i>
                                      </button>
                                  </td>
                              </tr>
                            <?php }else{ $d=1; foreach($assembly_detail as $key => $value) {?>
                              <tr>
                                  <td><span class="numbering_assembly"><?php echo $d; ?></span></td>
                                  <td><input type="hidden" name="assembly_id[]" value="<?php echo $value->id??'' ?>" />
                                    <input type="text" class="form-control input-sm" name="assembly_mark[]" value="<?php echo $value->assembly_mark??''; ?>"></td>
                                  <td><input type="text" class="form-control input-sm" name="assembly_desc[]" value="<?php echo $value->desc??''; ?>"></td>
                                  <td><input type="text" class="form-control input-sm" name="assembly_qty[]" style="width: 100px;" value="<?php echo $value->qty??''; ?>">
                                  </td>
                                  <td><input type="text" class="form-control input-sm" name="assembly_totalarea[]" value="<?php echo $value->total_area??''; ?>" readonly="">
                                  </td>
                                  <td><input type="text" name="assembly_totalweight[]" class="form-control input-sm" style="width: 100px;" value="<?php echo $value->total_weight??''; ?>" readonly=""></td>
                                  <td style="width: 57px;">
                                      <button type="button" class="btn btn-info btn-xs add_button_assembly">
                                          <i class="fa fa-plus"></i>
                                      </button>
                                      <button type="button" class="btn btn-danger btn-xs remove_button_assembly">
                                          <i class="fa fa-minus"></i>
                                      </button>
                                  </td>
                              </tr>
                            <?php $d+=1; } } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5>Material Detail</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table-bordered table-condensed table-striped table-hover datatable">
                            <thead>
                            <tr>
                                <th rowspan="2" style="width: 30px;">No.</th>
                                <th rowspan="2" style="width: 65px;">Material</th>
                                <th rowspan="2" style="width: 150px;">Assembly Mark</th>
                                <th rowspan="2" style="width: 70px;">Part Mark</th>
                                <th rowspan="2">Description</th>
                                <th rowspan="2" style="width: 60px;">Quantity</th>
                                <th colspan="3">Dimension (mm)</th>
                                <th colspan="2">Area(m2)</th>
                                <th colspan="2" style="width: 72px;">Weight(kg)</th>
                                <th rowspan="2" style="width: 150px;">Note</th>
                                <th rowspan="2">Action</th>
                            </tr>
                            <tr>
                                <th style="width: 60px;">Length</th>
                                <th style="width: 60px;">Width</th>
                                <th style="width: 60px;">Thick</th>
                                <th style="width: 50px;">Unit</th>
                                <th style="width: 50px;">Total</th>
                                <th style="width: 72px;">Unit</th>
                                <th style="width: 72px;">Total</th>
                            </tr>
                            </thead>
                            <tbody class="body-material">
                              <?php if(empty($material_detail)){ ?>
                              <tr>
                                <td style="text-align: center;"><span class="numbering_material">1</span>
                                    <input type="hidden" value="" name="material_idhidden[]">
                                </td>
                                <td>
                                    <select class="form-control selectpicker" name="material_id[]" key="0">
                                      <option selected disabled>Please Choose</option>
                                      <?php foreach ($material as $key => $value) {?>
                                          <option value="<?php echo $value->material_id; ?>"><?php echo $value->material_id; ?></option>
                                      <?php } ?>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control input-sm" name="material_assemblymark[]">
                                        <option value=""></option>
                                    </select>
                                    <!--<input type="text" class="form-control" v-model="assembly_mark">-->
                                    <!--<v-select :value.sync="assembly_mark" :options="assemblies" label="assembly_mark"></v-select>-->
                                </td>
                                <td><input type="text" class="form-control" name="material_part[]" required></td>
                                <td>
                                    <input type="text" class="form-control" name="material_desc[]" readonly="">
                                    <!--v-if-->
                                </td>
                                <td><input type="text" class="form-control" name="material_qty[]"></td>
                                <td><input type="text" class="form-control" name="material_length[]"></td>
                                <td><input type="text" class="form-control" name="material_width[]"></td>
                                <td><input type="text" class="form-control" name="material_thick[]"></td>
                                <td><input type="text" class="form-control" name="material_areaunit[]" readonly=""></td>
                                <td><input type="text" class="form-control" name="material_areatotal[]" readonly=""></td>
                                <td><input type="text" class="form-control" name="material_weightunit[]" readonly=""></td>
                                <td><input type="text" class="form-control" name="material_total[]" readonly=""></td>
                                <td><input type="text" class="form-control" name="material_note[]"></td>
                                <td style="width: 57px;">
                                    <button type="button" class="btn btn-info btn-xs add_button_material">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs remove_button_material">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </td>
                            </tr>
                          <?php }else{ $d=1; foreach($material_detail as $key2 => $value2) {?>
                            <tr>
                                <td style="text-align: center;"><span class="numbering_material"><?php echo $d; ?></span>
                                    <input type="hidden" name="material_idhidden[]" value="<?php echo $value2->id; ?>" />
                                </td>
                                <td>
                                    <select class="form-control selectpicker" name="material_id[]" key="<?php echo $d-1; ?>">
                                      <?php foreach ($material as $key => $value) {
                                        if($value->material_id==$value2->material){?>
                                          <option value="<?php echo $value->material_id; ?>" selected><?php echo $value->material_id; ?></option>
                                      <?php }else{?>
                                          <option value="<?php echo $value->material_id; ?>"><?php echo $value->material_id; ?></option>
                                      <?php }} ?>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control input-sm" name="material_assemblymark[]">
                                        <?php foreach ($assembly_detail as $key => $value) {
                                          if($value2->assembly_id==$value->assembly_mark){?>
                                          <option value="<?php echo $value->assembly_mark??''; ?>" selected><?php echo $value->assembly_mark??''; ?></option>
                                        <?php }else{ ?>
                                          <option value="<?php echo $value->assembly_mark??''; ?>"><?php echo $value->assembly_mark??''; ?></option>
                                        <?php } } ?>
                                    </select>
                                </td>
                                <td><input type="text" class="form-control" name="material_part[]" value="<?php echo $value2->part_mark??''; ?>" required></td>
                                <td>
                                    <input type="text" class="form-control" name="material_desc[]" value="<?php echo $value2->desc??''; ?>" readonly="">
                                    <!--v-if-->
                                </td>
                                <td><input type="text" class="form-control" name="material_qty[]" value="<?php echo $value2->qty??''; ?>"></td>
                                <td><input type="text" class="form-control" name="material_length[]" value="<?php echo $value2->length??''; ?>"></td>
                                <td><input type="text" class="form-control" name="material_width[]" value="<?php echo $value2->width??''; ?>"></td>
                                <td><input type="text" class="form-control" name="material_thick[]" value="<?php echo $value2->thick??''; ?>"></td>
                                <td>
                                  <?php foreach ($material as $key => $value) {
                                    if($value->material_id==$value2->material){?>
                                      <input type="text" class="form-control" name="material_areaunit[]" readonly="" formula="<?php echo $value->area_formula??''; ?>" value="<?php echo $value2->pcs_area??''; ?>">
                                    <?php }
                                  } ?>
                                  
                                </td>
                                <td><input type="text" class="form-control" name="material_areatotal[]" readonly="" value="<?php echo $value2->total_area??''; ?>"></td>
                                <td><input type="text" class="form-control" name="material_weightunit[]" readonly="" value="<?php echo $value2->pcs_weight??''; ?>"></td>
                                <td><input type="text" class="form-control" name="material_total[]" readonly="" value="<?php echo $value2->total_weight??''; ?>"></td>
                                <td><input type="text" class="form-control" name="material_note[]" value="<?php echo $value2->note??''; ?>"></td>
                                <td style="width: 57px;">
                                    <button type="button" class="btn btn-info btn-xs add_button_material">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs remove_button_material">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </td>
                            </tr>
                          <?php $d++; } } ?>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="5">Total</th>
                                <th><input type="text" class="form-control" readonly="" name="material_grand_qty"></th>
                                <th colspan="4"></th>
                                <th><input type="text" class="form-control" readonly="" name="material_grand_area"></th>
                                <th></th>
                                <th><input type="text" class="form-control" readonly="" name="material_grand_weight"></th>
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
    var job_number="<?php echo $header->job_id??''; ?>";
    var id_job="<?php echo $header->id??''; ?>";
    // alert(job_number);
    if(job_number!=""){
      $("#job_id").val(id_job);
      $("select[name='job_number']").val(job_number);
      $("select[name='job_number']").selectpicker("refresh");
      var data1=job_number;
      $.ajax({
          url: '<?php echo base_url() ?>engineering/select_boq',
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
          $("input[name='project']").val(res.project_name);
          $("input[name='rev_no']").val(res.rev_no);
          $("input[name='rev_date']").val(res.rev_date);
          check_line();
      });
    }
  });

  $(document).on("change","select[name='job_number']",function(){
    var data1=$(this).val();
    $.ajax({
          url: '<?php echo base_url() ?>engineering/select_boq',
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
          $("input[name='project']").val(res.project_name);
          $("input[name='rev_no']").val(res.rev_no);
          $("input[name='rev_date']").val(res.rev_date);
      });
  });
  $(document).on("click",".add_button_assembly",function(){
    $(".body-assembly").append('<tr> <td><span class="numbering_assembly">1</span></td><td><input type="hidden" name="assembly_id[]" /><input type="text" class="form-control input-sm" name="assembly_mark[]"></td><td><input type="text" class="form-control input-sm" name="assembly_desc[]"></td><td><input type="text" class="form-control input-sm" name="assembly_qty[]" style="width: 100px;"> </td><td><input type="text" class="form-control input-sm" name="assembly_totalarea[]" readonly=""> </td><td><input type="text" name="assembly_totalweight[]" class="form-control input-sm" style="width: 100px;" readonly=""></td><td style="width: 57px;"> <button type="button" class="btn btn-info btn-xs add_button_assembly"> <i class="fa fa-plus"></i> </button> <button type="button" class="btn btn-danger btn-xs remove_button_assembly"> <i class="fa fa-minus"></i> </button> </td></tr>');
    for (var i = 0; i <= $(".numbering_assembly").length; i++) {
        $(".numbering_assembly").eq(i).text(i+1);
    }
  });
  $(document).on("click",".remove_button_assembly",function(){
    $(this).parent().parent().remove();
    for (var i = 0; i <= $(".numbering_assembly").length; i++) {
        $(".numbering_assembly").eq(i).text(i+1);
    }
  });

  $(document).on("click",".add_button_material",function(){
    $.ajax({
          url: '<?php echo base_url() ?>engineering/material_list',
          type: 'POST',
          data: {id: "data"},
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
          // console.log(res[0].material_id);
          str="";
          str+='<tr> <td style="text-align: center;"><span class="numbering_material">1</span> <input type="hidden" value="" name="material_idhidden[]"> </td><td> <select class="form-control selectpicker" name="material_id[]"> <option selected disabled>Please Choose</option>';
          for (var i = 0; i < res.length; i++) {
            str+='<option value="'+res[i].material_id+'">'+res[i].material_id+'</option>';
          }
          str+='</select> </td><td> <select class="form-control input-sm" name="material_assemblymark[]"> <option value=""></option> </select> </td><td><input type="text" class="form-control" name="material_part[]" required></td><td> <input type="text" class="form-control" name="material_desc[]" readonly=""> </td><td><input type="text" class="form-control" name="material_qty[]"></td><td><input type="text" class="form-control" name="material_length[]"></td><td><input type="text" class="form-control" name="material_width[]"></td><td><input type="text" class="form-control" name="material_thick[]"></td><td><input type="text" class="form-control" name="material_areaunit[]" readonly=""></td><td><input type="text" class="form-control" name="material_areatotal[]" readonly=""></td><td><input type="text" class="form-control" name="material_weightunit[]" readonly=""></td><td><input type="text" class="form-control" name="material_total[]" readonly=""></td><td><input type="text" class="form-control" name="material_note[]"></td><td style="width: 57px;"> <button type="button" class="btn btn-info btn-xs add_button_material"> <i class="fa fa-plus"></i> </button> <button type="button" class="btn btn-danger btn-xs remove_button_material"> <i class="fa fa-minus"></i> </button> </td></tr>';
          $(".body-material").append(str);
          $("select[name='material_id[]']").selectpicker("refresh");
          for (var i = 0; i <= $(".numbering_material").length; i++) {
              $(".numbering_material").eq(i).text(i+1);
              $("select[name='material_id[]']").eq(i).attr("key",i);
          }
          var str="";
          for(var i=0;i<($("input[name='assembly_mark[]']").length);i++){
            str+="<option value='"+$("input[name='assembly_mark[]']").eq(i).val()+"'>"+$("input[name='assembly_mark[]']").eq(i).val()+"</option>";
          }
          $("select[name='material_assemblymark[]']").html(str);
      });
    
  });
  $(document).on("click",".remove_button_material",function(){
    $(this).parent().parent().remove();
    for (var i = 0; i <= $(".numbering_material").length; i++) {
        $(".numbering_material").eq(i).text(i+1);
        $("select[name='material_id[]']").eq(i).attr("key",i);
    }
  });
  $(document).on("keyup","input[name='assembly_mark[]']",function(){
    var str="";
    for(var i=0;i<($("input[name='assembly_mark[]']").length);i++){
      str+="<option value='"+$("input[name='assembly_mark[]']").eq(i).val()+"'>"+$("input[name='assembly_mark[]']").eq(i).val()+"</option>";
    }
    $("select[name='material_assemblymark[]']").html(str);
  });
  $(document).on("change","select[name='material_id[]']",function(){
    var data1=$(this).val();
    var data2=$(this).attr("key");
    console.log(data2);
    $.ajax({
          url: '<?php echo base_url() ?>engineering/material_list_full',
          type: 'POST',
          data: {id: data1,index:data2},
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
          $("input[name='material_length[]']").eq(res.index).val(res.res.length);
          $("input[name='material_width[]']").eq(res.index).val(res.res.width);
          $("input[name='material_thick[]']").eq(res.index).val(res.res.thick);
          $("input[name='material_areaunit[]']").eq(res.index).attr("formula",res.res.area_formula);
          $("input[name='material_weightunit[]']").eq(res.index).val(res.res.weight_factor);
          $("input[name='material_desc[]']").eq(res.index).val(res.res.product_name);
        });
  });
  function check_line(){
    var total_grand_qty=0;
    var total_grand_area=0;
    var total_grand_weight=0;
    for(var i=0;i<($("input[name='material_length[]']").length);i++){
      var qty=$("input[name='material_qty[]']").eq(i).val();
      var formula=$("input[name='material_areaunit[]']").eq(i).attr("formula");
      var length=$("input[name='material_length[]']").eq(i).val();
      var width=$("input[name='material_width[]']").eq(i).val();
      var thick=$("input[name='material_thick[]']").eq(i).val();
      var weight=$("input[name='material_weightunit[]']").eq(i).val();
      if(formula.includes("length")==true){
        formula=formula.replace("length", length);
      }
      if(formula.includes("width")==true){
        formula=formula.replace("width", width);
      }
      if(formula.includes("thick")==true){
        formula=formula.replace("thick", thick);
      }
      var total_area = eval(formula);
      total_area = total_area/1000000;
      $("input[name='material_areaunit[]']").eq(i).val(total_area);
      $("input[name='material_areatotal[]']").eq(i).val(total_area*qty);
      $("input[name='material_total[]']").eq(i).val(weight*qty);
      total_grand_qty+=parseInt(qty);
      total_grand_area+=total_area*qty;
      total_grand_weight+=weight*qty;
    }
    $("input[name='material_grand_qty']").val(total_grand_qty);
    $("input[name='material_grand_area']").val(total_grand_area);
    $("input[name='material_grand_weight']").val(total_grand_weight);

    for(var d=0;d<($("input[name='assembly_mark[]']").length);d++){
      var area_assembly=0;
      var weight_assembly=0;
      for(var i=0;i<($("input[name='material_length[]']").length);i++){
        if($("select[name='material_assemblymark[]']").eq(i).val()==$("input[name='assembly_mark[]']").eq(d).val()){
          area_assembly+=parseFloat($("input[name='material_areatotal[]']").eq(i).val());
          weight_assembly+=parseFloat($("input[name='material_total[]']").eq(i).val());
        }

      }
      $("input[name='assembly_totalarea[]']").eq(d).val(area_assembly);
      $("input[name='assembly_totalweight[]']").eq(d).val(weight_assembly);
    }

  }
  $(document).on("keyup","input[name='material_qty[]']",function(){
    check_line();
  });
</script>
</body></html>