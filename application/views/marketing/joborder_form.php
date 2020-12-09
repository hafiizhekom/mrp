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
<?php $this->load->view('marketing/header'); ?>

    <div class="container-fluid" style="min-height: 76.6vh;">
        <div class="header">
            <h5 style="font-weight: bold;">Create New Job Order and Commercial Sheet</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-12">
                                        <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#joborder" role="tab" data-toggle="tab">Job
                                Order</a></li>
                        <li role="presentation"><a href="#commercial_sheet" role="tab" data-toggle="tab">Commercial
                                Sheet</a></li>
                    </ul>
                    <form method="post" class="form form-horizontal" details="" action="<?php echo base_url() ?>marketing/joborder/add">
                      <input type="hidden" name="id" value="<?php echo $header->id??''; ?>"/>
    <div class="wrapper">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="joborder">
                <!--v-start--><div class="box">
    <div class="box-header">
        <h5>Job Order Information</h5>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label col-md-3" style="color: red">Quotation Number</label>
                    <div class="col-md-6">
                      <select class="form-control selectpicker" name="qn_number" required>
                        <option selected disabled>Please Choose</option>
                        <?php foreach ($quotation as $key => $value) {?>
                          <option value="<?php echo $value->qn_number; ?>"><?php echo $value->qn_number; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                </div> 
                <div class="form-group">
                    <label class="control-label col-md-3">Customer</label>
                    <div class="col-md-6">
                        <input type="text" class="form-control input-sm" readonly="" name="customer">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Project</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control input-sm" readonly="" name="project">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">JO Type</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control input-sm" readonly="" name="order_type">
                    </div>
                </div>
                <div class="form-group">
    <label class="control-label col-md-3" style="color: red">JO Number</label>
    <div class="col-md-9">
        <input type="text" class="form-control input-sm input-size-md" value="<?php if(empty($header->job_no)){ echo $job_no->pattern;}else{echo $header->job_no??''} ?>" readonly="" name="job_number">
        <input type="checkbox" checked> <i style="font-size: 12px;">auto-generate</i>
    </div>
</div>
                <div class="form-group">
                    <label class="control-label col-md-3" style="color: red">JO Date</label>
                    <div class="col-md-2">
                      <input placeholder="Select Date" type="date" required name="jo_date" value="<?php echo $header->jo_date??'' ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Customer PO No.</label>
                    <div class="col-md-4">
                        <input type="text" class="form-control input-sm" name="customer_po" >
                    </div>
                </div>
                <!--<div class="form-group">-->
                <!--<label class="control-label col-md-3">Revision No#</label>-->
                <!--<div class="col-md-2">-->
                <!--<input v-model="active.revision_no" type="text" class="form-control input-sm" readonly>-->
                <!--</div>-->
                <!--</div>-->
                <!--<div class="form-group">-->
                <!--<label class="control-label col-md-3">Revision Date</label>-->
                <!--<div class="col-md-2">-->
                <!--<input v-model="active.revision_date" type="text" class="form-control input-sm" readonly>-->
                <!--</div>-->
                <!--</div>-->
                <div class="form-group">
                    <label class="control-label col-md-3">Internal</label>
                    <div class="col-md-9">
                        <input type="checkbox" true-value="1" false-value="0" name="is_internal">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label col-md-3">Delivery Date</label>
                    <div class="col-md-2">
                       <input placeholder="Select Date" type="date" name="delivery_date">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Delivery Destination</label>
                    <div class="col-md-6">
                    <textarea rows="2" class="form-control input-sm" name="delivery_destination"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Currency</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control input-sm" readonly="" value="" name="currency">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">VAT</label>
                    <div class="col-md-3" style="display: inherit;">
                        <input type="text" class="form-control input-sm" readonly value="10" name="vat">
                        <span style="margin-left: 5px; line-height: 2"> %</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Construction Fee</label>
                    <div class="col-md-3" style="display: inherit;">
                        <input type="text" class="form-control input-sm" name="construction_fee">
                        <span style="margin-left: 5px; line-height: 2"> %</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3" style="color: red">Terms and Condition</label>

                    <div class="col-md-6">
                    <textarea rows="2" class="form-control input-sm" name="terms"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Note</label>
                    <div class="col-md-6">
                    <textarea rows="2" class="form-control input-sm" name="note"></textarea>
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
                        <table class="table table-bordered table-condensed table-striped table-hover datatable" style="border-color:#dddddd 1px solid;">
                            <thead>
                            <tr>
                                <th style="width: 35px;">No.</th>
                                <!--<th style="width: 150px;">Model</th>-->
                                <th>Description</th>
                                <th style="width: 50px;">Qty</th>
                                <th style="width: 85px;">Unit</th>
                                <th style="width: 150px;">Price</th>
                                <th style="width: 150px;">Total Price</th>
                                <th style="width: 150px;">Internal Note</th>
                                <th style="width: 65px;">Action</th>
                            </tr>
                            </thead>
                            <tbody class="div-tbody body_detail">
                            </tbody>
                            <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td style="text-align: right;">
                                    Total =
                                </td>
                                <td colspan="2">
                                    <input type="text" class="form-control input-sm" readonly="">
                                </td>
                                <td>
                                    <input type="text" readonly="" class="form-control input-sm" name="summary">
                                </td>
                                <td colspan="2">
                                    Grand Summary
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">

                                </td>
                                <td>
                                    <input type="text" class="form-control input-sm" name="discount">
                                </td>
                                <td colspan="2">
                                    Rounding and Discount
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">

                                </td>
                                <td>
                                    <input type="text" readonly="" class="form-control input-sm" name="construction">
                                </td>
                                <td colspan="2">
                                    Counstruction Fee
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">

                                </td>
                                <td>
                                    <input type="text" readonly="" class="form-control input-sm" name="total_vat">
                                </td>
                                <td colspan="2">
                                    Grand Total with VAT
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
    </div>
</div>
<div class="box">
            <div class="box-header">
                <h5>Works Detail</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">1. Fabrication:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="fabrication"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">2. Material:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="material"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">3. Sandblasting:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="sandblasting"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">4. Painting:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="painting"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">5. As Built Drawing:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="drawing"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">6. Galvanished:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="galvanished"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">7. Erection:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="erection"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">8. Packing:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="packing"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">9. NDT:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="ndt"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">10. Certificate:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="certificate"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">11. Delivery:</label>
                            <div class="col-md-9">
                            <textarea rows="2" class="form-control input-size-lg" name="delivery"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--v-if--><!--v-end--><!--v-component-->
            </div>
            <div role="tabpanel" class="tab-pane" id="commercial_sheet">
                <!--v-start--><div class="box">
    <div class="box-header">
        <h5>Personal Discount</h5>
    </div>
    <div class="container-fluid">
        <div>
    <div class="table table-bordered table-condensed table-striped datatable" style="display:table;">
        <div class="div-thead">
            <div class="div-tr" slot="head">
                <div class="div-th">No.</div>
                <div class="div-th" style="color: red">Name</div>
                <div class="div-th">Position</div>
                <div class="div-th">Discount</div>
                <div class="div-th">Note</div>
                <div class="div-th">Remark</div>
            </div>
        </div>
        <div class="div-tbody body_disc">
          <?php if(empty($detail_discount)){?>
            <div class="div-tr" slot="body">
                <div class="div-td"><span class="disc_numbering">1</span><input type="hidden" value="" name="disc_id[]"></div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_name[]">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_position[]">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_discount[]">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_note[]">
                </div>
                <div class="div-td">
                    <button type="button" class="btn btn-info btn-xs add_button_disc">
                        <i class="fa fa-plus"></i>
                    </button>
                    <button type="button" class="btn btn-danger btn-xs remove_button_disc">
                        <i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>
          <?php }else{ $i=1; foreach ($detail_discount as $key => $value) { ?>
              <div class="div-tr" slot="body">
                <div class="div-td"><span class="disc_numbering"><?php echo $i; ?></span><input type="hidden" value="<?php echo $value->id??''; ?>" name="disc_id[]"></div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_name[]" value="<?php echo $value->name??''; ?>">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_position[]" value="<?php echo $value->position??''; ?>">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_discount[]" value="<?php echo $value->discount??''; ?>">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="disc_note[]" value="<?php echo $value->note??''; ?>">
                </div>
                <div class="div-td">
                    <button type="button" class="btn btn-info btn-xs add_button_disc">
                        <i class="fa fa-plus"></i>
                    </button>
                    <button type="button" class="btn btn-danger btn-xs remove_button_disc">
                        <i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>
          <?php $i++; } } ?>
            
            
        </div>
    </div>
</div><!--v-component-->
    </div>
</div>
<div class="box">
    <div class="box-header">
        <h5>Invoice and Payment</h5>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-md-12">
                <div>
    <div class="table table-bordered table-condensed table-striped datatable" style="display:table;">
        <div class="div-thead">
            <div class="div-tr" slot="head">
                        <div class="div-th">No.</div>
                        <div class="div-th" style="color: red">Invoice Date</div>
                        <div class="div-th" style="color: red">Invoice Number</div>
                        <div class="div-th">Value</div>
                        <div class="div-th">Payment Status &amp; Date</div>
                        <div class="div-th">Note</div>
                        <div class="div-th">Remark</div>
                    </div>
        </div>
        <div class="div-tbody body_inv">
          <?php if(empty($detail_inv)){?>
            <div class="div-tr" slot="body">
                <div class="div-td"><span class="inv_numbering">1</span>
                    <input type="hidden" value="" name="inv_id[]">
                </div>
                <div class="div-td">
                    <input  placeholder="Select Date" type="date" value="" name="inv_date[]">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="inv_number[]">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="inv_value[]">
                </div>
                <div class="div-td" style="display: flex">
                    <input type="checkbox" style="margin-right: 10px" value="1" name="inv_paystatus[]" />
                    <input  placeholder="Select Date" type="date" value="" name="inv_paydate[]">
                </div>
                <div class="div-td">
                    <input type="text" class="form-control input-sm" name="inv_note[]">
                </div>
                <div class="div-td">
                    <button type="button" class="btn btn-info btn-xs add_button_inv">
                        <i class="fa fa-plus"></i>
                    </button>
                    <button type="button" class="btn btn-danger btn-xs remove_button_inv">
                        <i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>
          <?php }else{ $i=1; foreach ($detail_inv as $key => $value) {?>
                <div class="div-tr" slot="body">
                  <div class="div-td"><span class="inv_numbering"><?php echo $i; ?></span>
                      <input type="hidden" value="<?php echo $value->id??'' ?>" name="inv_id[]">
                  </div>
                  <div class="div-td">
                      <input  placeholder="Select Date" type="date" value="<?php echo $value->inv_date??'' ?>" name="inv_date[]">
                  </div>
                  <div class="div-td">
                      <input type="text" class="form-control input-sm" name="inv_number[]" value="<?php echo $value->invoice_number??'' ?>">
                  </div>
                  <div class="div-td">
                      <input type="text" class="form-control input-sm" name="inv_value[]" value="<?php echo $value->value??'' ?>">
                  </div>
                  <div class="div-td" style="display: flex">
                      <input type="checkbox" style="margin-right: 10px" value="1" name="inv_paystatus[]" />
                      <input  placeholder="Select Date" type="date" value="<?php echo $value->payment_date??'' ?>" name="inv_paydate[]">
                  </div>
                  <div class="div-td">
                      <input type="text" class="form-control input-sm" name="inv_note[]" value="<?php echo $value->note??'' ?>">
                  </div>
                  <div class="div-td">
                      <button type="button" class="btn btn-info btn-xs add_button_inv">
                          <i class="fa fa-plus"></i>
                      </button>
                      <button type="button" class="btn btn-danger btn-xs remove_button_inv">
                          <i class="fa fa-minus"></i>
                      </button>
                  </div>
              </div>    
      <?php $i++;}  } ?>
            
            
        </div>
    </div>
</div><!--v-component-->
            </div>
        </div>
    </div>
</div><!--v-end--><!--v-component-->
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
    </div>

<?php $this->load->view('template/footer'); ?>
<script>
  $(document).ready(function(){
    var quotation_id="<?php echo $quotation_header->qn_number??'' ?>";
    if(quotation_id!=""){
      $("select[name='qn_number']").val(quotation_id);
      $("select[name='qn_number']").selectpicker("refresh");
      $.ajax({
            url: '<?php echo base_url() ?>marketing/job_select1',
            type: 'POST',
            data: {qn_number: quotation_id},
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
            $("input[name='customer']").val(res.res.customer_name);
            $("input[name='project']").val(res.res.project_name);
            $("input[name='order_type']").val(res.res.order_type);
            var date = new Date(res.res.delivery_date);
            var day = ("0" + date.getDate()).slice(-2);
            var month = ("0" + (date.getMonth() + 1)).slice(-2);
            var date_delivery=date.getFullYear()+"-"+(month)+"-"+(day);
            // alert(date_delivery);
            $("input[name='delivery_date']").val(date_delivery);
            $("textarea[name='delivery_destination']").text(res.res.delivery_to);
            $("input[name='currency']").val(res.res.currency);
            $("input[name='construction_fee']").val(res.res.construction_fee);
            $("textarea[name='terms']").text(res.res.terms);
            $("textarea[name='note']").text(res.res.note);
            $("textarea[name='fabrication']").text(res.res.fabrication);
            $("textarea[name='material']").text(res.res.material);
            $("textarea[name='sandblasting']").text(res.res.sandblasting);
            $("textarea[name='painting']").text(res.res.painting);
            $("textarea[name='drawing']").text(res.res.asbuiltdrawing);
            $("textarea[name='galvanished']").text(res.res.galvanished);
            $("textarea[name='erection']").text(res.res.erection);
            $("textarea[name='packing']").text(res.res.packing);
            $("textarea[name='ndt']").text(res.res.ndt);
            $("textarea[name='certificate']").text(res.res.certificate);
            $("textarea[name='delivery']").text(res.res.delivery);

            
               
            

            for(var d=0;d<res.detail.length;d++){
                var str='<tr name="material-0"> <td> <input type="hidden" value="" name="detail_id[]"/><span class="numbering">1</span> </td><td><textarea class="form-control input-sm" name="detail_desc[]"></textarea></td><td><input type="text" class="form-control input-sm" name="detail_qty[]"></td><td> <select class="form-control input-size-auto" style="width: 75px" name="detail_unit[]"> ';
                for(var c=0;c<res.unit.length;c++){
                  str+="<option value='"+res.unit[c].code+"'>"+res.unit[c].code+"</option>";
                }
                str+='</select> </td><td><input type="text" class="form-control input-sm" name="detail_price[]"></td><td><input type="text" class="form-control input-sm" name="detail_totalprice[]"></td><td><input type="text" class="form-control input-sm" name="detail_internalnote[]"></td><td style="width: 65px"> <button type="button" class="btn btn-info btn-xs button_add"><i class="fa fa-plus"></i></button> <button type="button" class="btn btn-danger btn-xs button_remove"><i class="fa fa-minus"></i></button> </td></tr>';
                $(".body_detail").append(str);

                $("input[name='detail_id[]']").eq(d).val(res.detail[d].id);
                $("textarea[name='detail_desc[]']").eq(d).val(res.detail[d].description);
                $("input[name='detail_qty[]']").eq(d).val(res.detail[d].qty);
                $("select[name='detail_unit[]']").eq(d).val(res.detail[d].unit);
                $("input[name='detail_price[]']").eq(d).val(res.detail[d].price);
                $("input[name='detail_totalprice[]']").eq(d).val(res.detail[d].total_price);
                $("input[name='detail_internalnote[]']").eq(d).val(res.detail[d].internal_note);
            }

            $("input[name='summary']").val(res.calc.grand_summary);
            $("input[name='construction']").val(res.calc.construction_fee);
            $("input[name='total_vat']").val(res.calc.grand_total_vat);
            $("input[name='discount']").val(res.calc.rounding_discount);

          });
    }
  });
   $(document).on("click",".add_button_inv",function(){
      $(".body_inv").append('<div class="div-tr" slot="body"> <div class="div-td"><span class="inv_numbering">1</span> <input type="hidden" value="" name="inv_id[]"> </div><div class="div-td"> <input placeholder="Select Date" type="date" value="" name="inv_date[]"> </div><div class="div-td"> <input type="text" class="form-control input-sm" name="inv_number[]"> </div><div class="div-td"> <input type="text" class="form-control input-sm" name="inv_value[]"> </div><div class="div-td" style="display: flex"> <input type="checkbox" style="margin-right: 10px" value="1" name="inv_paystatus[]"/> <input placeholder="Select Date" type="date" value="" name="inv_paydate[]"> </div><div class="div-td"> <input type="text" class="form-control input-sm" name="inv_note[]"> </div><div class="div-td"> <button type="button" class="btn btn-info btn-xs add_button_inv"> <i class="fa fa-plus"></i> </button> <button type="button" class="btn btn-danger btn-xs remove_button_inv"> <i class="fa fa-minus"></i> </button> </div></div>');
        for (var i = 0; i <= $(".inv_numbering").length; i++) {
          $(".inv_numbering").eq(i).text(i+1);
        }
   });
   $(document).on("click",".remove_button_inv",function(){
      $(this).parent().parent().remove();
      for (var i = 0; i <= $(".inv_numbering").length; i++) {
          $(".inv_numbering").eq(i).text(i+1);
      }
   });
   $(document).on("click",".add_button_disc",function(){
      $(".body_disc").append('<div class="div-tr" slot="body"> <div class="div-td"><span class="disc_numbering">1</span><input type="hidden" value="" name="disc_id[]"></div><div class="div-td"> <input type="text" class="form-control input-sm" name="disc_name[]"> </div><div class="div-td"> <input type="text" class="form-control input-sm" name="disc_position[]"> </div><div class="div-td"> <input type="text" class="form-control input-sm" name="disc_discount[]"> </div><div class="div-td"> <input type="text" class="form-control input-sm" name="disc_note[]"> </div><div class="div-td"> <button type="button" class="btn btn-info btn-xs add_button_disc"> <i class="fa fa-plus"></i> </button> <button type="button" class="btn btn-danger btn-xs remove_button_disc"> <i class="fa fa-minus"></i> </button> </div></div>');
        for (var i = 0; i <= $(".disc_numbering").length; i++) {
          $(".disc_numbering").eq(i).text(i+1);
        }
   });
   $(document).on("click",".remove_button_disc",function(){
      $(this).parent().parent().remove();
      for (var i = 0; i <= $(".disc_numbering").length; i++) {
          $(".disc_numbering").eq(i).text(i+1);
      }
   });
   $(document).on("change","select[name='qn_number']",function(){
      var data1=$(this).val();
      $.ajax({
            url: '<?php echo base_url() ?>marketing/job_select1',
            type: 'POST',
            data: {qn_number: data1},
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
            $("input[name='customer']").val(res.res.customer_name);
            $("input[name='project']").val(res.res.project_name);
            $("input[name='order_type']").val(res.res.order_type);
            var date = new Date(res.res.delivery_date);
            var day = ("0" + date.getDate()).slice(-2);
            var month = ("0" + (date.getMonth() + 1)).slice(-2);
            var date_delivery=date.getFullYear()+"-"+(month)+"-"+(day);
            // alert(date_delivery);
            $("input[name='delivery_date']").val(date_delivery);
            $("textarea[name='delivery_destination']").text(res.res.delivery_to);
            $("input[name='currency']").val(res.res.currency);
            $("input[name='construction_fee']").val(res.res.construction_fee);
            $("textarea[name='terms']").text(res.res.terms);
            $("textarea[name='note']").text(res.res.note);
            $("textarea[name='fabrication']").text(res.res.fabrication);
            $("textarea[name='material']").text(res.res.material);
            $("textarea[name='sandblasting']").text(res.res.sandblasting);
            $("textarea[name='painting']").text(res.res.painting);
            $("textarea[name='drawing']").text(res.res.asbuiltdrawing);
            $("textarea[name='galvanished']").text(res.res.galvanished);
            $("textarea[name='erection']").text(res.res.erection);
            $("textarea[name='packing']").text(res.res.packing);
            $("textarea[name='ndt']").text(res.res.ndt);
            $("textarea[name='certificate']").text(res.res.certificate);
            $("textarea[name='delivery']").text(res.res.delivery);

            
               
            

            for(var d=0;d<res.detail.length;d++){
                var str='<tr name="material-0"> <td> <input type="hidden" value="" name="detail_id[]"/><span class="numbering">1</span> </td><td><textarea class="form-control input-sm" name="detail_desc[]"></textarea></td><td><input type="text" class="form-control input-sm" name="detail_qty[]"></td><td> <select class="form-control input-size-auto" style="width: 75px" name="detail_unit[]"> ';
                for(var c=0;c<res.unit.length;c++){
                  str+="<option value='"+res.unit[c].code+"'>"+res.unit[c].code+"</option>";
                }
                str+='</select> </td><td><input type="text" class="form-control input-sm" name="detail_price[]"></td><td><input type="text" class="form-control input-sm" name="detail_totalprice[]"></td><td><input type="text" class="form-control input-sm" name="detail_internalnote[]"></td><td style="width: 65px"> <button type="button" class="btn btn-info btn-xs button_add"><i class="fa fa-plus"></i></button> <button type="button" class="btn btn-danger btn-xs button_remove"><i class="fa fa-minus"></i></button> </td></tr>';
                $(".body_detail").append(str);

                $("input[name='detail_id[]']").eq(d).val(res.detail[d].id);
                $("textarea[name='detail_desc[]']").eq(d).val(res.detail[d].description);
                $("input[name='detail_qty[]']").eq(d).val(res.detail[d].qty);
                $("select[name='detail_unit[]']").eq(d).val(res.detail[d].unit);
                $("input[name='detail_price[]']").eq(d).val(res.detail[d].price);
                $("input[name='detail_totalprice[]']").eq(d).val(res.detail[d].total_price);
                $("input[name='detail_internalnote[]']").eq(d).val(res.detail[d].internal_note);
            }

            $("input[name='summary']").val(res.calc.grand_summary);
            $("input[name='construction']").val(res.calc.construction_fee);
            $("input[name='total_vat']").val(res.calc.grand_total_vat);
            $("input[name='discount']").val(res.calc.rounding_discount);

          });
   });

  $(document).on("click",".button_add",function(){

    $.ajax({
            url: '<?php echo base_url() ?>marketing/measure_list',
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
            console.log(res);
            var str='<tr name="material-0"> <td> <input type="hidden" value="" name="detail_id[]"/><span class="numbering">1</span> </td><td><textarea class="form-control input-sm" name="detail_desc[]"></textarea></td><td><input type="text" class="form-control input-sm" name="detail_qty[]"></td><td> <select class="form-control input-size-auto" style="width: 75px" name="detail_unit[]"> ';
            for(var d=0;d<res.length;d++){
              str+="<option value='"+res[d].code+"'>"+res[d].code+"</option>";
            }
            str+='</select> </td><td><input type="text" class="form-control input-sm" name="detail_price[]"></td><td><input type="text" class="form-control input-sm" name="detail_totalprice[]"></td><td><input type="text" class="form-control input-sm" name="detail_internalnote[]"></td><td style="width: 65px"> <button type="button" class="btn btn-info btn-xs button_add"><i class="fa fa-plus"></i></button> <button type="button" class="btn btn-danger btn-xs button_remove"><i class="fa fa-minus"></i></button> </td></tr>';
            $(".body_detail").append(str);
            for (var i = 0; i <= $(".numbering").length; i++) {
                $(".numbering").eq(i).text(i+1);
            }
          });
    
    // $(".div-tbody").append('');
    // $(".material-0").clone().appendTo('.div-tbody');
    // alert($(".numbering").length);
    
});
$(document).on("click",".button_remove",function(){
    $(this).parent().parent().remove();
    for (var i = 0; i <= $(".numbering").length; i++) {
        $(".numbering").eq(i).text(i+1);
    }
});

function count_all(){
  var counter=$("input[name='detail_qty[]']").length;
  var total_price=0;
  for(var c=0;c<counter;c++){
    var qty=0;
    var price=0;
    qty+=$("input[name='detail_qty[]']").eq(c).val();
    price+=$("input[name='detail_price[]']").eq(c).val();
    total_price+=qty*price;
  }
  $("input[name='summary']").val("IDR "+total_price);

  var construction_fee=0;
  if($("input[name='construction_fee']").val()!=""){
    construction_fee=$("input[name='construction_fee']").val();
    construction_fee=construction_fee/100;
    console.log(construction_fee);
  }
  var combined=total_price*construction_fee;
  $("input[name='construction']").val("IDR "+combined);
  if($("input[name='discount']").val()!=""){
    var total_vat=(total_price*0.1)+total_price-$("input[name='discount']").val()+(total_price*construction_fee);
  }else{
    var total_vat=(total_price*0.1)+total_price+(total_price*construction_fee);
  }
  
  $("input[name='total_vat']").val("IDR "+total_vat);
}

$(document).on("keyup","input[name='discount']",function(){
  count_all();
});

$(document).on("keyup","input[name='detail_qty[]']",function(){
  var price_row=$(this).parent().siblings("td").children("input[name='detail_price[]']").val();
  var qty_row=$(this).val();
  $(this).parent().siblings("td").siblings('td').children("input[name='detail_totalprice[]']").val(price_row*qty_row);
  count_all();
});
$(document).on("keyup","input[name='construction_fee']",function(){
  $("input[name='construction']").val($(this).val());
});
$(document).on("keyup","input[name='detail_price[]']",function(){
  var price_row=$(this).val();
  var qty_row=$(this).parent().siblings("td").children("input[name='detail_qty[]']").val();
  $(this).parent().siblings("td").children("input[name='detail_totalprice[]']").val(price_row*qty_row);
  count_all();
});
</script>
</body></html>