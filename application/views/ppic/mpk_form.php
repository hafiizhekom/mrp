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
                Create New MPK
            </h5>
        </div>
        <div class="body">
            <div class="col-md-12">
                <form method="post" class="form form-horizontal" action="<?php echo base_url()?>ppc/mpk/add">
    <input type="hidden" name="id" value="0">
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5>Main</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red">Bill of Quotation No</label>
                            <div class="col-md-7">
                                <select class="selectpicker form-control" name="boq_no" required>
                                  <option selected disabled>Please Choose</option>
                                  <?php foreach ($boq as $key => $value) {?>
                                    <option value="<?php echo $value->bill_no??'' ?>"><?php echo $value->bill_no??'' ?></option>
                                  <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red">Customer</label>
                            <div class="col-md-7">
                                <input type="text" readonly="" class="form-control input-size-md" name="customer">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red">Project</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-size-md" name="project">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red">Job Order</label>
                            <div class="col-md-7">
                                <input type="text" readonly="" class="form-control input-size-md" name="joborder">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Quotation</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-size-md" name="quotation">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">MPK No</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-md" readonly="" name="mpk_no" value="<?php echo $mpk_no->pattern??'' ?>">
                                <input type="checkbox" checked> <i style="font-size: 12px;">auto-generate</i>
                                <!--<button type="button" @click="generateNumber('Quotation', 'active.no')" class="btn btn-info btn-xs">Generate</button>-->
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red">Date</label>
                            <div class="col-md-7">
                                <input type="date" name="date" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3">Revision No</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-xs input-size-sm" name="rev_no">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3">Revision Date</label>
                            <div class="col-md-9">
                                <input type="text" readonly="" class="form-control input-xs input-size-sm" name="rev_date">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5>Details</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-hover table-striped table-bordered table-condensed datatable">
                                <thead>
                                <tr>
                                    <th rowspan="2" style="width: 30px;text-align: center">No</th>
                                    <th rowspan="2" style="width: 100px;text-align: center">Assembly Mark</th>
                                    <th rowspan="2" style="text-align: center">Description</th>
                                    <th colspan="3" style="text-align: center">Total</th>
                                    <th rowspan="2" style="text-align: center; width: 65px">Load</th>
                                    <!--v-for-start--><th colspan="2" style="width: 50px;">
                                        Material
                                    </th><th colspan="2" style="width: 50px;">
                                        Marking
                                    </th><th colspan="2" style="width: 50px;">
                                        Cutting
                                    </th><th colspan="2" style="width: 50px;">
                                        Rolling
                                    </th><th colspan="2" style="width: 50px;">
                                        Bending
                                    </th><th colspan="2" style="width: 50px;">
                                        Drilling
                                    </th><th colspan="2" style="width: 50px;">
                                        Machining
                                    </th><th colspan="2" style="width: 50px;">
                                        Setting
                                    </th><th colspan="2" style="width: 50px;">
                                        Welding
                                    </th><th colspan="2" style="width: 50px;">
                                        Assembly
                                    </th><th colspan="2" style="width: 50px;">
                                        Sandblasting
                                    </th><th colspan="2" style="width: 50px;">
                                        Galvanize
                                    </th><th colspan="2" style="width: 50px;">
                                        Painting
                                    </th><th colspan="2" style="width: 50px;">
                                        Packing
                                    </th><th colspan="2" style="width: 50px;">
                                        Delivery
                                    </th><!--v-for-end-->
                                    <th rowspan="2" style="width: 65px; text-align: center">Total</th>
                                    <th rowspan="2" style="width: 100px;text-align: center">Remark</th>
                                </tr>
                                <tr>
                                    <th style="text-align: center">Quantity</th>
                                    <th style="text-align: center">Area</th>
                                    <th style="text-align: center">Weight</th>
                                    <th colspan="2">
                                        <input type="text" class="form-control input-sm" name="material_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="marking_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="cutting_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="rolling_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="bending_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="drilling_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="machining_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="setting_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="welding_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="assembly_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="sandblasting_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="galvanize_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="painting_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="packing_load">
                                    </th><th colspan="2">
                                        <input type="text" class="form-control input-sm" name="delivery_load">
                                    </th>

                                </tr>
                                <!--<tr>-->
                                <!--<template v-for="(key, value) in active.percentage">-->
                                <!--<th style="width: 45px; text-align: center;">Qty</th>-->
                                <!--<th style="width: 55px; text-align: center">%</th>-->
                                <!--</template>-->
                                <!--</tr>-->
                                </thead>
                                <tbody>
                                <!--v-for-start--><!--fragment-start--><tr class="mpk-detail">
    <td style="text-align: center;">1
        <input type="hidden" value="">
    </td>
    <td></td>
    <td></td>
    <td>0</td>
    <td>0</td>
    <td>0</td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="material_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="marking_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="cutting_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="rolling_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="bending_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="drilling_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="machining_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="setting_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="welding_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="assembly_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="sandblasting_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="galvanize_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="painting_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="packing_actual[]"></td>
    <td>0%</td>
    <td><input type="text" class="form-control" style="min-width: 40px;" name="delivery_actual[]"></td>
    <td>0%</td>    
    <td>0%</td>
    <td>
        <input type="text" class="form-control" name="remark[]">
    </td>
</tr><!--v-component--><!--fragment-end--><!--v-for-end-->
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th colspan="3">Total</th>
                                    <th>0</th>
                                    <th>0</th>
                                    <th>0</th>
                                    <th>0%</th>
                                    <!--v-for-start--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--fragment-start--><th>0</th>
                                        <th>0%</th><!--fragment-end--><!--v-for-end-->
                                    <th>0%</th>
                                    <th></th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
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
</body></html>