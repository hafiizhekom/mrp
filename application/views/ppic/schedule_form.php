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
                <?php if(!empty($header->id)){ echo "Edit";}else{ echo "Create";} ?> Schedule
            </h5>
        </div>
        <div class="body">
            <div class="col-md-12">
              <form method="post" class="form form-horizontal" action="<?php echo base_url() ?>ppc/schedule/add">
    <input type="hidden" name="id" value="">
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5>Main</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Job Order No</label>
                            <div class="col-md-9">
                               <select class="selectpicker form-control" name="job_no" required>
                                  <option selected disabled>Please Choose</option>
                                  <?php foreach ($job as $key => $value) {?>
                                    <option value="<?php echo $value->job_number??'' ?>"><?php echo $value->job_number??'' ?></option>
                                  <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Customer</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control input-sm" name="customer" readonly="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Project Name</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm" name="project" readonly="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red;">Date</label>
                            <div class="col-md-9">
                              <input type="date" value="<?php echo date('Y-m-d'); ?>" name="date"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red;">Period Start</label>
                            <div class="col-md-9">
                              <input type="date" name="start_date" value="<?php echo $header->period_start??'' ?>" nomorindex="1" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3" style="color: red;">Period End</label>
                            <div class="col-md-9">
                              <input type="date" name="end_date" value="<?php echo $header->period_end??'' ?>" nomorindex="1" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3">Revision</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control input-sm input-size-xs" name="revision" value="<?php echo $header->revision??'' ?>" readonly="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-control col-md-3">Revision Date</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-xs" name="revision_date" value="<?php echo $header->rev_date??'' ?>" readonly="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-class col-md-3">Revision MS</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control input-sm input-size-xs" name="revision_ms" value="<?php echo $header->rev_ms??'' ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-class col-md-3">Current Phase</label>
                            <div class="col-md-5">
                                <select class="form-control input-sm input-size-sm" name="current_phase">
                                    <option value="PRE">Preparation</option>
                                    <option value="FAB">Fabrication</option>
                                    <option value="FIN">Finishing</option>
                                    <option value="PAC">Packing</option>
                                    <option value="DEL">Delivery</option>
                                    <option value="ERC">Erection</option>
                                </select>
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
            <?php if(empty($detail)){ ?>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table-striped table-hover table-condensed table-bordered datatable">
                            <thead>
                            <tr>
                                <th rowspan="2" style="width: 30px;text-align: center">No.</th>
                                <th colspan="2" style="width: 125px;text-align: center;">Description Process</th>
                                <th rowspan="2" style="width: 140px;text-align: center; color:red;">Department</th>
                                <th rowspan="2" style="width: 50px;text-align: center; color: red;">Weight %</th>
                                <th colspan="2" style="text-align: center">Duration In</th>
                                <th rowspan="2" style="width: 170px;text-align: center; color: red;">Start Date</th>
                                <th rowspan="2" style="width: 170px;text-align: center; color: red;">End Date</th>
                                <th rowspan="2" style="text-align: center">Remark</th>
                                <th rowspan="2" style="width: 55px; text-align: center">Action</th>
                            </tr>
                            <tr>
                                <th style="width: 140px; text-align: center; color: red;">Process</th>
                                <th style="width: 180px; text-align: center">Sub Process</th>
                                <th style="width: 45px; text-align: center">Days</th>
                                <th style="width: 45px; text-align: center">Weeks</th>
                            </tr>
                            </thead>
                            <tbody class="detail_body">
                              <tr>
                                <td style="text-align: center;">1
                                    <input type="hidden" value="0" name="detail_id[]">
                                </td>
                                <td>
                                    <input type="hidden" value="0" name="detail_sub_id[]">
                                    <select class="form-control" name="detail_process[]">
                                        <option value="MOM">MOM</option>
                                        <option value="preparation Work">Preparation Work</option>
                                        <option value="fabrication">Fabrication</option>
                                        <option value="finishing">Finishing</option>
                                        <option value="packing">Packing</option>
                                        <option value="delivery">Delivery</option>
                                        <option value="installation">Installation</option>
                                    </select>
                                    
                                </td>
                                <td>
                                    <select class="form-control" name="detail_subprocess[]">
                                        <option value="MOM">MOM</option>
                                        <option value="Bending">Bending</option>
                                        <option value="Machining">Machining</option>
                                        <option value="Rolling">Rolling</option>
                                        <option value="Schedule">Schedule</option>
                                        <option value="Drawing">Drawing</option>
                                        <option value="DKM">DKM</option>
                                        <option value="Material">Material</option>
                                        <option value="Inspect Material">Inspect Material</option>
                                        <option value="Inspection">Inspection</option>
                                        <option value="Marking">Marking</option>
                                        <option value="Cutting">Cutting</option>
                                        <option value="Setting">Setting</option>
                                        <option value="Drilling">Drilling</option>
                                        <option value="Welding">Welding</option>
                                        <option value="Pre Assembly &amp; Levelling">Pre Assembly &amp; Levelling</option>
                                        <option value="Pre Assembly">Pre Assembly</option>
                                        <option value="Leveling">Leveling</option>
                                        <option value="Sandblasting">Sandblasting</option>
                                        <option value="Painting">Painting</option>
                                        <option value="Cleaning">Cleaning</option>
                                        <option value="Galvanize">Galvanize</option>
                                    </select>
                                    
                                </td>
                                <td>
                                    <select class="form-control" name="detail_department[]">
                                        <option value="Marketing">MARKETING</option>
                                        <option value="Engineering">ENGINEERING</option>
                                        <option value="PPIC">PPIC</option>
                                        <option value="Purchasing">PURCHASING</option>
                                        <option value="Production">PRODUCTION</option>
                                        <option value="Logistic">LOGISTIC</option>
                                        <option value="QC">QC</option>
                                        <option value="Maintenance">MAINTENANCE</option>
                                    </select>
                                    
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_weight[]">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_day[]" readonly>
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_week[]" readonly>
                                </td>
                                <td>
                                    <input type="date" class="form-control" name="detail_startdate[]" nomorindex="1"  />
                                </td>
                                <td>
                                    <input type="date" class="form-control" name="detail_enddate[]" nomorindex="1"  />
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_remark[]">
                                </td>
                                <td style="width: 57px;">
                                    <button type="button" class="btn btn-info btn-xs add_button">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs remove_button">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="4">Total (PPIC + Production)</th>
                                <th><input type="text" class="form-control" readonly="" name="total_weight"></th>
                                <th colspan="6"></th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
          <?php }else{ ?>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table-striped table-hover table-condensed table-bordered datatable">
                            <thead>
                            <tr>
                                <th rowspan="2" style="width: 30px;text-align: center">No.</th>
                                <th colspan="2" style="width: 125px;text-align: center;">Description Process</th>
                                <th rowspan="2" style="width: 140px;text-align: center; color:red;">Department</th>
                                <th rowspan="2" style="width: 50px;text-align: center; color: red;">Weight %</th>
                                <th colspan="2" style="text-align: center">Duration In</th>
                                <th rowspan="2" style="width: 170px;text-align: center; color: red;">Start Date</th>
                                <th rowspan="2" style="width: 170px;text-align: center; color: red;">End Date</th>
                                <th rowspan="2" style="text-align: center">Remark</th>
                                <th rowspan="2" style="width: 55px; text-align: center">Action</th>
                            </tr>
                            <tr>
                                <th style="width: 140px; text-align: center; color: red;">Process</th>
                                <th style="width: 180px; text-align: center">Sub Process</th>
                                <th style="width: 45px; text-align: center">Days</th>
                                <th style="width: 45px; text-align: center">Weeks</th>
                            </tr>
                            </thead>
                            <tbody class="detail_body">
                              <?php $weight_total=0; 
                              foreach ($detail as $key => $value) {
                                $weight_total+=$value->weight;?>
                              <tr>
                                <td style="text-align: center;">1
                                    <input type="hidden" name="detail_id[]" value="<?php echo $value->id??'' ?>">
                                </td>
                                <td>
                                    <input type="hidden" name="detail_sub_id[]" value="<?php echo $value->schedule_id??'' ?>">
                                    <select class="form-control" name="detail_process[]">
                                        <?php if(!empty($value->process)){ ?>
                                            <option value="<?php echo $value->process??'' ?>"><?php echo $value->process??'' ?></option>
                                        <?php } ?>
                                        <option value="MOM">MOM</option>
                                        <option value="preparation Work">Preparation Work</option>
                                        <option value="fabrication">Fabrication</option>
                                        <option value="finishing">Finishing</option>
                                        <option value="packing">Packing</option>
                                        <option value="delivery">Delivery</option>
                                        <option value="installation">Installation</option>
                                    </select>
                                    
                                </td>
                                <td>
                                    <select class="form-control" name="detail_subprocess[]">
                                      <?php if(!empty($value->sub_process)){ ?>
                                            <option value="<?php echo $value->sub_process??'' ?>"><?php echo $value->sub_process??'' ?></option>
                                        <?php } ?>
                                        <option value="MOM">MOM</option>
                                        <option value="Bending">Bending</option>
                                        <option value="Machining">Machining</option>
                                        <option value="Rolling">Rolling</option>
                                        <option value="Schedule">Schedule</option>
                                        <option value="Drawing">Drawing</option>
                                        <option value="DKM">DKM</option>
                                        <option value="Material">Material</option>
                                        <option value="Inspect Material">Inspect Material</option>
                                        <option value="Inspection">Inspection</option>
                                        <option value="Marking">Marking</option>
                                        <option value="Cutting">Cutting</option>
                                        <option value="Setting">Setting</option>
                                        <option value="Drilling">Drilling</option>
                                        <option value="Welding">Welding</option>
                                        <option value="Pre Assembly &amp; Levelling">Pre Assembly &amp; Levelling</option>
                                        <option value="Pre Assembly">Pre Assembly</option>
                                        <option value="Leveling">Leveling</option>
                                        <option value="Sandblasting">Sandblasting</option>
                                        <option value="Painting">Painting</option>
                                        <option value="Cleaning">Cleaning</option>
                                        <option value="Galvanize">Galvanize</option>
                                    </select>
                                    
                                </td>
                                <td>
                                    <select class="form-control" name="detail_department[]">
                                      <?php if(!empty($value->department)){ ?>
                                            <option value="<?php echo $value->department??'' ?>"><?php echo strtoupper($value->department??''); ?></option>
                                        <?php } ?>
                                        <option value="Marketing">MARKETING</option>
                                        <option value="Engineering">ENGINEERING</option>
                                        <option value="PPIC">PPIC</option>
                                        <option value="Purchasing">PURCHASING</option>
                                        <option value="Production">PRODUCTION</option>
                                        <option value="Logistic">LOGISTIC</option>
                                        <option value="QC">QC</option>
                                        <option value="Maintenance">MAINTENANCE</option>
                                    </select>
                                    
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_weight[]" value="<?php echo $value->weight??'' ?>">
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_day[]" value="<?php echo $value->days??'' ?>" readonly>
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_week[]" value="<?php echo $value->weeks??'' ?>" readonly>
                                </td>
                                <td>
                                    <input type="date" class="form-control" name="detail_startdate[]" value="<?php echo $value->start_date??'' ?>" nomorindex="1"  />
                                </td>
                                <td>
                                    <input type="date" class="form-control" name="detail_enddate[]" value="<?php echo $value->end_date??'' ?>" nomorindex="1"  />
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="detail_remark[]" value="<?php echo $value->remarks??'' ?>">
                                </td>
                                <td style="width: 57px;">
                                    <button type="button" class="btn btn-info btn-xs add_button">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs remove_button">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </td>
                            </tr>
                          <?php } ?>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="4">Total (PPIC + Production)</th>
                                <th><input type="text" class="form-control" readonly="" name="total_weight" value="<?php echo $weight_total; ?>"></th>
                                <th colspan="6"></th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
          <?php } ?>
        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-info btn-xs">Save</button>
            <!-- <div class="btn-group btn-group-sm pull-right">
                <a class="btn btn-default btn-sm" target="_blank" href="<?php echo base_url() ?>ppc/schedule/undefined/report/print">Print</a>
                <a class="btn btn-default btn-sm" target="_blank" href="<?php echo base_url() ?>ppc/schedule/undefined/report/download">Download</a>
                <a class="btn btn-default btn-sm " href="<?php echo base_url() ?>ppc/schedule/undefined/progress">Edit Progress</a>
                <a class="btn btn-default btn-sm " href="<?php echo base_url() ?>ppc/schedule">Back To
                    Schedule List</a>
            </div> -->
            <div class="clearfix"></div>
        </div>
    </div>
</form>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
</body>
<script>
  $(document).ready(function(){
    var header="<?php echo $header->job_id??''; ?>";
    var current_phase="<?php echo $header->current_phase??''; ?>";

    if(current_phase!=""){
      $("select[name='current_phase']").val(current_phase);

    }
    $("select[name='job_no']").val(header);
    $("select[name='job_no']").selectpicker("refresh");
    $.ajax({
      url: '<?php echo base_url() ?>ppc/schedule_select',
      type: 'POST',
      data: {
        job_no: header,
      },
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

      $("input[name='customer']").val(res.header.customer_name);
      $("input[name='project']").val(res.header.project_name);
  });
});
$(document).on("change","select[name='job_no']",function(){
  var data1=$(this).val();
  $.ajax({
      url: '<?php echo base_url() ?>ppc/schedule_select',
      type: 'POST',
      data: {
        job_no: data1,
      },
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

      $("input[name='customer']").val(res.header.customer_name);
      $("input[name='project']").val(res.header.project_name);
  });

});
var number=2;
$(document).on("click",".add_button",function(){
  $(".detail_body").append('<tr class="row_number_'+number+'"> <td style="text-align: center;">'+number+' <input type="hidden" value="0" name="detail_id[]"> </td><td> <input type="hidden" value="0" name="detail_sub_id[]"> <select class="form-control" name="detail_process[]"> <option value="MOM">MOM</option> <option value="preparation Work">Preparation Work</option> <option value="fabrication">Fabrication</option> <option value="finishing">Finishing</option> <option value="packing">Packing</option> <option value="delivery">Delivery</option> <option value="installation">Installation</option> </select> </td><td> <select class="form-control" name="detail_subprocess[]"> <option value="MOM">MOM</option> <option value="Bending">Bending</option> <option value="Machining">Machining</option> <option value="Rolling">Rolling</option> <option value="Schedule">Schedule</option> <option value="Drawing">Drawing</option> <option value="DKM">DKM</option> <option value="Material">Material</option> <option value="Inspect Material">Inspect Material</option> <option value="Inspection">Inspection</option> <option value="Marking">Marking</option> <option value="Cutting">Cutting</option> <option value="Setting">Setting</option> <option value="Drilling">Drilling</option> <option value="Welding">Welding</option> <option value="Pre Assembly &amp; Levelling">Pre Assembly &amp; Levelling</option> <option value="Pre Assembly">Pre Assembly</option> <option value="Leveling">Leveling</option> <option value="Sandblasting">Sandblasting</option> <option value="Painting">Painting</option> <option value="Cleaning">Cleaning</option> <option value="Galvanize">Galvanize</option> </select> </td><td> <select class="form-control" name="detail_department[]"> <option value="Marketing">MARKETING</option> <option value="Engineering">ENGINEERING</option> <option value="PPIC">PPIC</option> <option value="Purchasing">PURCHASING</option> <option value="Production">PRODUCTION</option> <option value="Logistic">LOGISTIC</option> <option value="QC">QC</option> <option value="Maintenance">MAINTENANCE</option> </select> </td><td> <input type="text" class="form-control" name="detail_weight[]"> </td><td> <input type="text" class="form-control" name="detail_day[]" readonly /> </td><td> <input type="text" class="form-control" name="detail_week[]" readonly /> </td><td> <input type="date" class="form-control" name="detail_startdate[]" nomorindex="'+number+'"  /> </td><td> <input type="date" class="form-control" name="detail_enddate[]" nomorindex="'+number+'" /> </td><td> <input type="text" class="form-control" name="detail_remark[]"> </td><td style="width: 57px;"> <button type="button" class="btn btn-info btn-xs add_button"> <i class="fa fa-plus"></i> </button> <button type="button" class="btn btn-danger btn-xs remove_button" code="'+number+'"> <i class="fa fa-minus"></i> </button> </td></tr>');
   number+=1;
});
$(document).on("click",".remove_button",function(){
  var data_delete=$(this).attr("code");
  $(".row_number_"+data_delete).remove();
});

$(document).on("keyup","input[name='detail_weight[]']",function(){
  // alert($("input[name='detail_weight[]']").length);
  var total=0;
  for (var i = 0; i < $("input[name='detail_weight[]']").length; i++) {
    if(parseFloat($("input[name='detail_weight[]']").eq(i).val())>=0){
      total+=parseFloat($("input[name='detail_weight[]']").eq(i).val());
    }
  }
  $("input[name='total_weight']").val(total);
});

$(document).on("change","input[name='detail_startdate[]']",function(){
  var nomor=$(this).attr("nomorindex")-1;
  var date1=Date.parse($(this).val());
  var date2=Date.parse($("input[name='detail_enddate']").eq(nomor).val());
  var difference=date2-date1;
  var days = Math.ceil(difference / (1000 * 3600 * 24));
  var weeks = days/7;
  $("input[name='detail_day[]']").eq(nomor).val(days);
  $("input[name='detail_week[]']").eq(nomor).val(parseInt(weeks));
  // console.log(days);
});

$(document).on("change","input[name='detail_enddate[]']",function(){
  var nomor=$(this).attr("nomorindex")-1;
  // console.log(nomor);
  var date1=Date.parse($("input[name='detail_startdate[]']").eq(nomor).val());
  console.log(date1+"date1");
  var date2=Date.parse($(this).val());
  console.log(date2+"date2");
  var difference=date2-date1;
  console.log(difference);
  var days = Math.ceil(difference / (1000 * 3600 * 24));
  var weeks = days/7;
  $("input[name='detail_day[]']").eq(nomor).val(days);
  $("input[name='detail_week[]']").eq(nomor).val(parseInt(weeks));
  // console.log(days);
});

</script>
</html>