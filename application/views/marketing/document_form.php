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
        <div class="col-md-12">
          <div class="form-group">
              <label class="control-label col-md-3">Job Order Number</label>
              <div class="col-md-6">
                <select class="form-control selectpicker" name="job_number" required>
                  <option selected disabled>Please Choose</option>
                </select>
              </div>
          </div> 
        </div>
        <div class="col-md-12">
            <div class="wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <h5 style="margin-top: 5px;">
                            <b>BMM-19-2028 - PT. Fajar Utama Semesta</b>
                        </h5>
                        <div class="col-md-6" style="font-size: 12px; color: dimgray; margin-left: -30px; margin-bottom: 10px;">
                            <div class="col-md-4">
                                <table style="width: 100%;color:dimgray;font-size:12px;">
                                    <tbody><tr>
                                        <th>PO Date</th>
                                        <td>2019-11-20</td>
                                    </tr>
                                    <tr>
                                        <th>Due Date</th>
                                        <td>2019-11-22</td>
                                    </tr>
                                </tbody></table>
                            </div>
                            <div class="col-md-4">
                                <table style="width: 100%;color:dimgray;font-size:12px;">
                                    <tbody><tr>
                                        <th>Type</th>
                                        <td>Supply Only</td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td>New</td>
                                    </tr>
                                </tbody></table>

                            </div>
                            <div class="col-md-4">
                                <table style="width: 100%;color:dimgray;font-size:12px;">
                                    <tbody><tr>
                                        <th>Created By</th>
                                        <td>Admin</td>
                                    </tr>
                                </tbody></table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 body">
            <div class="row">
    <div class="col-md-4">
        <form method="post" enctype="multipart/form-data" class="form form-horizontal" action="<?php echo base_url() ?>document_add">
            <input type="hidden" name="id" />
            <input type="hidden" name="choice_jo"/>
            <div class="wrapper">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-2">Document Title</label>
                                    <div class="col-md-9">
                                        <input name="title" type="text" class="form-control input-sm">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Type</label>
                                    <div class="col-md-9">
                                        <select name="type_id" class="form-control input-sm">
                                            <!--v-for-start--><!--fragment-start--><option value="11">
                                                Drawing
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="12">
                                                Bill of Quantity
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="14">
                                                Schedule
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="15">
                                                MPK
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="16">
                                                Inspection Test and Plan
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="17">
                                                Quotation
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="18">
                                                Packing List
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="19">
                                                Delivery Order
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="20">
                                                BSK
                                            </option><!--v-if--><!--fragment-end--><!--fragment-start--><option value="13">
                                                Commercial Sheet
                                            </option><!--v-if--><!--fragment-end--><!--v-for-end-->
                                            <!--v-if-->
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Upload File(s)</label>
                                    <div class="col-md-9">
                                        <input name="file" type="file" class="form-control input-sm">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Note</label>
                                    <div class="col-md-9">
                                    <textarea name="note" rows="3" class="form-control input-sm"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Valid Date</label>
                                    <div class="col-md-4">
                                        <input type="hidden" name="start">
                                        <div class="datepicker">
  <input {{="" ro="" ?="" 'readonly'="" '}}="" placeholder="Select Date" type="text" class="form-control input-sm">

      <!-- Day View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span class="up">Dec 2020</span>
              <span class="next">&gt;</span>
          </header>
          <!--v-for-start--><span class="cell day-header">Sun</span><span class="cell day-header">Mon</span><span class="cell day-header">Tue</span><span class="cell day-header">Wed</span><span class="cell day-header">Thu</span><span class="cell day-header">Fri</span><span class="cell day-header">Sat</span><!--v-for-end-->
          <!--v-for-start--><span class="cell day blank"></span><span class="cell day blank"></span><!--v-for-end--><!--
          --><!--v-for-start--><span class="cell day">1</span><span class="cell day">2</span><span class="cell day">3</span><span class="cell day">4</span><span class="cell day">5</span><span class="cell day">6</span><span class="cell day">7</span><span class="cell day">8</span><span class="cell day">9</span><span class="cell day">10</span><span class="cell day">11</span><span class="cell day">12</span><span class="cell day">13</span><span class="cell day">14</span><span class="cell day">15</span><span class="cell day">16</span><span class="cell day">17</span><span class="cell day">18</span><span class="cell day">19</span><span class="cell day">20</span><span class="cell day">21</span><span class="cell day">22</span><span class="cell day">23</span><span class="cell day">24</span><span class="cell day">25</span><span class="cell day">26</span><span class="cell day">27</span><span class="cell day">28</span><span class="cell day">29</span><span class="cell day">30</span><span class="cell day">31</span><!--v-for-end-->

      </div>

      <!-- Month View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span class="up">2020</span>
              <span class="next">&gt;</span>
          </header>
          <!--v-for-start--><span class="cell month">January</span><span class="cell month">February</span><span class="cell month">March</span><span class="cell month">April</span><span class="cell month">May</span><span class="cell month">June</span><span class="cell month">July</span><span class="cell month">August</span><span class="cell month">September</span><span class="cell month">October</span><span class="cell month">November</span><span class="cell month">December</span><!--v-for-end-->
      </div>

      <!-- Year View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span>2020's</span>
              <span class="next">&gt;</span>
          </header>
          <!--v-for-start--><span class="cell year">2020</span><span class="cell year">2021</span><span class="cell year">2022</span><span class="cell year">2023</span><span class="cell year">2024</span><span class="cell year">2025</span><span class="cell year">2026</span><span class="cell year">2027</span><span class="cell year">2028</span><span class="cell year">2029</span><!--v-for-end-->
      </div>

</div><!--v-component-->
                                    </div>
                                    -
                                    <div class="col-md-4">
                                        <input type="hidden" name="end">
                                        <div class="datepicker">
  <input {{="" ro="" ?="" 'readonly'="" '}}="" placeholder="Select Date" type="text" class="form-control input-sm">

      <!-- Day View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span class="up">Dec 2020</span>
              <span class="next">&gt;</span>
          </header>
          <!--v-for-start--><span class="cell day-header">Sun</span><span class="cell day-header">Mon</span><span class="cell day-header">Tue</span><span class="cell day-header">Wed</span><span class="cell day-header">Thu</span><span class="cell day-header">Fri</span><span class="cell day-header">Sat</span><!--v-for-end-->
          <!--v-for-start--><span class="cell day blank"></span><span class="cell day blank"></span><!--v-for-end--><!--
          --><!--v-for-start--><span class="cell day">1</span><span class="cell day">2</span><span class="cell day">3</span><span class="cell day">4</span><span class="cell day">5</span><span class="cell day">6</span><span class="cell day">7</span><span class="cell day">8</span><span class="cell day">9</span><span class="cell day">10</span><span class="cell day">11</span><span class="cell day">12</span><span class="cell day">13</span><span class="cell day">14</span><span class="cell day">15</span><span class="cell day">16</span><span class="cell day">17</span><span class="cell day">18</span><span class="cell day">19</span><span class="cell day">20</span><span class="cell day">21</span><span class="cell day">22</span><span class="cell day">23</span><span class="cell day">24</span><span class="cell day">25</span><span class="cell day">26</span><span class="cell day">27</span><span class="cell day">28</span><span class="cell day">29</span><span class="cell day">30</span><span class="cell day">31</span><!--v-for-end-->

      </div>

      <!-- Month View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span class="up">2020</span>
              <span class="next">&gt;</span>
          </header>
          <!--v-for-start--><span class="cell month">January</span><span class="cell month">February</span><span class="cell month">March</span><span class="cell month">April</span><span class="cell month">May</span><span class="cell month">June</span><span class="cell month">July</span><span class="cell month">August</span><span class="cell month">September</span><span class="cell month">October</span><span class="cell month">November</span><span class="cell month">December</span><!--v-for-end-->
      </div>

      <!-- Year View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span>2020's</span>
              <span class="next">&gt;</span>
          </header>
          <!--v-for-start--><span class="cell year">2020</span><span class="cell year">2021</span><span class="cell year">2022</span><span class="cell year">2023</span><span class="cell year">2024</span><span class="cell year">2025</span><span class="cell year">2026</span><span class="cell year">2027</span><span class="cell year">2028</span><span class="cell year">2029</span><!--v-for-end-->
      </div>

</div><!--v-component-->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Reminder</label>
                                    <div class="col-md-4" style="display: inline-flex;">
                                        <input name="reminder" type="text" class="form-control input-sm">
                                        <span style="padding: 3px; margin-left: 5px"> days</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-info btn-xs">Save</button>
                    <div class="clearfix"></div>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-8">
        <div class="table-scrollable" style="margin-top: -10px;">
    <table class="table table-striped table-condensed table-hover table-bordered datatable">
        <thead>
        <!--fragment-start--><!--v-for-start--><!--v-for-end--><!--fragment-end--><!--v-if-->
        <tr>
            <!--v-for-start--><th>
                    #
                </th><th>
                    Document Title
                </th><th>
                    Note
                </th><th>
                    File
                </th><th>
                    Type
                </th><th>
                    Valid From
                </th><th>
                    Valid Until
                </th><th>
                    Reminder
                </th><th>
                    Action
                </th><!--v-for-end-->
        </tr>
        </thead>
        <tbody>
        <!--fragment-start--><!--v-for-start--><tr>
            <!--v-for-start--><!--fragment-start--><td>
                    1.
                </td><!--v-if-->
                <!--v-if-->
                <!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    test<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    a<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    gambar_flow.PNG<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    Schedule<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    2020-11-23<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    2020-11-24<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    0<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <td>
                    <div class="dropdown">
                <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Action
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="action" style="min-width: 80px; font-size: 9pt">
                    <li><a role="button">Edit</a></li>
                    <li><a role="button">Delete</a></li>
                    <li><a target="_blank" href="http://mrp.codebalt.com/marketing/joborder/38/document/9">Download</a></li>
                </ul>
            </div><!--v-component-->
                </td><!--v-if-->
                <!--v-if--><!--fragment-end--><!--v-for-end-->
        </tr><tr>
            <!--v-for-start--><!--fragment-start--><td>
                    2.
                </td><!--v-if-->
                <!--v-if-->
                <!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    asda<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    asdasda<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    index.jpg<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    Drawing<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    2020-11-24<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    2020-11-23<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <!--v-if-->
                <td>
                    0<!--v-html-->
                </td><!--v-if--><!--fragment-end--><!--fragment-start--><!--v-if-->
                <td>
                    <div class="dropdown">
                <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Action
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="action" style="min-width: 80px; font-size: 9pt">
                    <li><a role="button">Edit</a></li>
                    <li><a role="button">Delete</a></li>
                    <li><a target="_blank" href="http://mrp.codebalt.com/marketing/joborder/38/document/8">Download</a></li>
                </ul>
            </div><!--v-component-->
                </td><!--v-if-->
                <!--v-if--><!--fragment-end--><!--v-for-end-->
        </tr><!--v-for-end--><!--fragment-end--><!--v-if-->
        
        </tbody>
    </table>
    <ul class="pagination pagination-sm">
        <li>
            <a role="button">
                <i class="fa fa-angle-left"></i>
            </a>
        </li>
        <!--v-for-start--><li class="active">
            <a role="button">
                1
            </a>
        </li><!--v-for-end-->
        <li>
            <a role="button">
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
</div><!--v-component-->
        <template id="actiontemplate">
            <div class="dropdown">
                <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Action
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="action" style="min-width: 80px; font-size: 9pt">
                    <li><a role="button" @click="$parent.$parent.editRecord(record)">Edit</a></li>
                    <li><a role="button" @click="$parent.$parent.deleteRecord(record, token)">Delete</a></li>
                    <li><a :href="url + '/' + record.id" target="_blank">Download</a></li>
                </ul>
            </div>
        </template>
    </div>
</div><!--v-component-->
        </div>
    </div>
<?php $this->load->view('template/footer'); ?>

</body></html>