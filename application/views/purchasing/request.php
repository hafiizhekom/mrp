<html lang="en"><head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MRP Purchase Request
</title>
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
            <h5 style="font-weight: bold">Purchase Request</h5>
        </div>
        <div class="body">
            <div class="col-md-12">
                                <div class="wrapper">
    <div class="box">
        <div class="box-header">
            <h5>Filter</h5>
        </div>
        <div class="box-body">
            <div class="row">
                <!--v-for-start--><!--fragment-start--><div class="col-md-6">
    <div class="form-group" style="height: 30px;">
        <label class="control-label col-md-3">Request No#</label>
        <div class="col-md-9">
            <input type="text" class="form-control input-sm input-size-sm"><!--v-if-->
            <!--v-if-->
            <!--v-if-->
        </div>
    </div>
</div><!--v-component--><!--fragment-end--><!--fragment-start--><div class="col-md-6">
    <div class="form-group" style="height: 30px;">
        <label class="control-label col-md-3">Type</label>
        <div class="col-md-9">
            <input type="text" class="form-control input-sm input-size-sm"><!--v-if-->
            <!--v-if-->
            <!--v-if-->
        </div>
    </div>
</div><!--v-component--><!--fragment-end--><!--fragment-start--><div class="col-md-6">
    <div class="form-group" style="height: 30px;">
        <label class="control-label col-md-3">Date</label>
        <div class="col-md-9">
            <!--v-if-->
            <!--v-if-->
            <!--fragment-start--><div class="datepicker" placeholder="Select Date">
  <input {{="" ro="" ?="" 'readonly'="" '}}="" placeholder="Select Date" type="text" value="">

      <!-- Day View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span class="up">Feb 2021</span>
              <span class="next">&gt;</span>
          </header>
          <!--v-for-start--><span class="cell day-header">Sun</span><span class="cell day-header">Mon</span><span class="cell day-header">Tue</span><span class="cell day-header">Wed</span><span class="cell day-header">Thu</span><span class="cell day-header">Fri</span><span class="cell day-header">Sat</span><!--v-for-end-->
          <!--v-for-start--><span class="cell day blank"></span><!--v-for-end--><!--
          --><!--v-for-start--><span class="cell day">1</span><span class="cell day">2</span><span class="cell day">3</span><span class="cell day">4</span><span class="cell day">5</span><span class="cell day">6</span><span class="cell day">7</span><span class="cell day">8</span><span class="cell day">9</span><span class="cell day">10</span><span class="cell day">11</span><span class="cell day">12</span><span class="cell day">13</span><span class="cell day">14</span><span class="cell day">15</span><span class="cell day">16</span><span class="cell day">17</span><span class="cell day">18</span><span class="cell day">19</span><span class="cell day">20</span><span class="cell day">21</span><span class="cell day">22</span><span class="cell day">23</span><span class="cell day">24</span><span class="cell day">25</span><span class="cell day">26</span><span class="cell day">27</span><span class="cell day">28</span><!--v-for-end-->

      </div>

      <!-- Month View -->
      <div class="calendar" style="display: none;">
          <header>
              <span class="prev">&lt;</span>
              <span class="up">2021</span>
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

</div><!--v-component--><!--fragment-end--><!--v-if-->
        </div>
    </div>
</div><!--v-component--><!--fragment-end--><!--fragment-start--><div class="col-md-6">
    <div class="form-group" style="height: 30px;">
        <label class="control-label col-md-3">Status</label>
        <div class="col-md-9">
            <input type="text" class="form-control input-sm input-size-sm"><!--v-if-->
            <!--v-if-->
            <!--v-if-->
        </div>
    </div>
</div><!--v-component--><!--fragment-end--><!--v-for-end-->
                <!--<template v-for="field in fields | filterBy true in 'filterable'">-->
                <!---->
                <!--</template>-->
            </div>
        </div>
    </div>
    <div class="box-footer">
        <button type="button" class="btn btn-info btn-xs">Search</button>
        <button type="button" class="btn btn-warning btn-xs">Reset</button>
    </div><!--v-if-->
</div><!--v-component-->
            </div>
            <div class="col-md-9">
                <div class="table-scrollable">
    <table class="table table-striped table-condensed table-hover table-bordered datatable">
        <thead>
        <!--fragment-start--><!--v-for-start--><!--v-for-end--><!--fragment-end--><!--v-if-->
        <tr>
            <!--v-for-start--><th style="width: 35px; text-align: center;">
                    #
                </th><th style="text-align: center;">
                    Request No#
                </th><th style="text-align: center;">
                    Type
                </th><th>
                    Request Consumable
                </th><th style="text-align: center;">
                    Date
                </th><th style="text-align: center;">
                    Total Material
                </th><th style="text-align: center;">
                    Status
                </th><th style="width: 68px;">
                    Action
                </th><!--v-for-end-->
        </tr>
        </thead>
        <tbody>
        <tr>
            <td style="font-style: italic;" colspan="8">No data found.</td>
        </tr><!--v-if-->
        
        </tbody>
    </table>
    <ul class="pagination pagination-sm">
        <li>
            <a role="button">
                <i class="fa fa-angle-left"></i>
            </a>
        </li>
        <!--v-for-start--><!--v-for-end-->
        <li>
            <a role="button">
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
</div><!--v-component-->
                <template id="action">
                    <div class="dropdown">
                        <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Action
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="action" style="min-width: 80px; font-size: 9pt">
                            <li><a :href="url+'/'+record.id+'/edit'">Edit</a></li>
                            <li><a :href="url+'/'+record.id+'/report/print'" target="_blank">Print</a></li>
                            <li><a :href="url+'/'+record.id+'/report/download'" target="_blank">Download</a></li>
                            <li><a v-on:click="$parent.destroy(record)" role="button">Delete</a></li>
                            <li><a :href="'/purchasing/orders/create?purchase_request='+record.id">Create PO</a></li>
                        </ul>
                    </div>
                </template>
            </div>
        </div>
    </div>

<footer class="navbar-fixed-bottom" style="z-index: 1;">
    <h6 class="pull-left">MRP-LITE
                    | Copyright © PT. DIAN INNOVATIVE SOLUSINDO.
            </h6>
    <div class="clearfix visible-xs"></div>
    <div class="footer-menu">
        <ul>
            <li><a href="http://mrp.codebalt.com/marketing">HOME</a></li>
            <li><a href="#">HELP</a></li>
            <li><a href="http://mrp.codebalt.com/change-password">CHANGE PASSWORD</a></li>
            <li><a href="http://mrp.codebalt.com/logout">LOGOUT</a></li>
        </ul>
    </div>
</footer><script type="text/javascript" src="http://mrp.codebalt.com/js/main.js"></script>
<script>window.user = {"id":2,"modul_id":2,"employee_id":123456789,"name":"Admin","username":"admin","email":"admin@innovative.co.id","company":"1","contact":"081112345678","role_id":3,"active":true,"sales_person":false,"created_at":"2016-05-26 18:04:46","updated_at":"2020-11-26 21:47:13","lang":"id","position":"","module":{"id":2,"name":"Marketing","order":1,"namespace":"Codebalt\\Marketing","description":"Customized for PT. Buana Masa Metalindo","created_at":"2016-06-11 00:00:00","updated_at":null,"route":"marketing:index"},"role":{"id":3,"description":"","name":"Administrator","created_at":"2016-05-31 17:59:44","updated_at":"2019-08-03 03:20:23","code":"ADM","level":"1","active":true,"permissions":[{"id":560,"alias":"admin:role.index","name":"View","created_at":"2016-11-18 07:10:04","updated_at":"2016-11-18 07:10:04","sub_menu_id":1,"pivot":{"role_id":3,"permission_id":560}},{"id":561,"alias":"admin:role.edit","name":"Edit","created_at":"2016-11-18 07:10:04","updated_at":"2016-11-18 07:10:04","sub_menu_id":1,"pivot":{"role_id":3,"permission_id":561}},{"id":562,"alias":"admin:role.destroy","name":"Delete","created_at":"2016-11-18 07:10:04","updated_at":"2016-11-18 07:10:04","sub_menu_id":1,"pivot":{"role_id":3,"permission_id":562}},{"id":616,"alias":"admin:master:general.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":29,"pivot":{"role_id":3,"permission_id":616}},{"id":617,"alias":"admin:master:general.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":29,"pivot":{"role_id":3,"permission_id":617}},{"id":618,"alias":"admin:master:general.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":29,"pivot":{"role_id":3,"permission_id":618}},{"id":623,"alias":"admin:product.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":32,"pivot":{"role_id":3,"permission_id":623}},{"id":624,"alias":"admin:product.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":32,"pivot":{"role_id":3,"permission_id":624}},{"id":625,"alias":"admin:product.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":32,"pivot":{"role_id":3,"permission_id":625}},{"id":626,"alias":"admin:document.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":33,"pivot":{"role_id":3,"permission_id":626}},{"id":627,"alias":"admin:document.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":33,"pivot":{"role_id":3,"permission_id":627}},{"id":628,"alias":"admin:document.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":33,"pivot":{"role_id":3,"permission_id":628}},{"id":632,"alias":"admin:destination.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":35,"pivot":{"role_id":3,"permission_id":632}},{"id":633,"alias":"admin:destination.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":35,"pivot":{"role_id":3,"permission_id":633}},{"id":634,"alias":"admin:destination.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":35,"pivot":{"role_id":3,"permission_id":634}},{"id":563,"alias":"admin:user.index","name":"View","created_at":"2016-11-18 07:10:04","updated_at":"2016-11-18 07:10:04","sub_menu_id":2,"pivot":{"role_id":3,"permission_id":563}},{"id":564,"alias":"admin:user.edit","name":"Edit","created_at":"2016-11-18 07:10:04","updated_at":"2016-11-18 07:10:04","sub_menu_id":2,"pivot":{"role_id":3,"permission_id":564}},{"id":565,"alias":"admin:user.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":2,"pivot":{"role_id":3,"permission_id":565}},{"id":638,"alias":"admin:warehouse.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":37,"pivot":{"role_id":3,"permission_id":638}},{"id":639,"alias":"admin:warehouse.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":37,"pivot":{"role_id":3,"permission_id":639}},{"id":640,"alias":"admin:warehouse.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":37,"pivot":{"role_id":3,"permission_id":640}},{"id":641,"alias":"admin:pic.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":38,"pivot":{"role_id":3,"permission_id":641}},{"id":642,"alias":"admin:pic.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":38,"pivot":{"role_id":3,"permission_id":642}},{"id":643,"alias":"admin:pic.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":38,"pivot":{"role_id":3,"permission_id":643}},{"id":644,"alias":"admin:uom.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":39,"pivot":{"role_id":3,"permission_id":644}},{"id":645,"alias":"admin:uom.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":39,"pivot":{"role_id":3,"permission_id":645}},{"id":646,"alias":"admin:uom.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":39,"pivot":{"role_id":3,"permission_id":646}},{"id":647,"alias":"admin:currency.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":40,"pivot":{"role_id":3,"permission_id":647}},{"id":648,"alias":"admin:currency.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":40,"pivot":{"role_id":3,"permission_id":648}},{"id":649,"alias":"admin:currency.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":40,"pivot":{"role_id":3,"permission_id":649}},{"id":650,"alias":"admin:part.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":41,"pivot":{"role_id":3,"permission_id":650}},{"id":651,"alias":"admin:part.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":41,"pivot":{"role_id":3,"permission_id":651}},{"id":652,"alias":"admin:part.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":41,"pivot":{"role_id":3,"permission_id":652}},{"id":710,"alias":"admin:import.index","name":"View","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":69,"pivot":{"role_id":3,"permission_id":710}},{"id":711,"alias":"admin:import.edit","name":"Edit","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":69,"pivot":{"role_id":3,"permission_id":711}},{"id":712,"alias":"admin:import.destroy","name":"Delete","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":69,"pivot":{"role_id":3,"permission_id":712}},{"id":745,"alias":"admin:master:numbering.index","name":"View","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":86,"pivot":{"role_id":3,"permission_id":745}},{"id":746,"alias":"admin:master:numbering.edit","name":"Edit","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":86,"pivot":{"role_id":3,"permission_id":746}},{"id":747,"alias":"admin:master:numbering.destroy","name":"Delete","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":86,"pivot":{"role_id":3,"permission_id":747}},{"id":566,"alias":"marketing:master:customer.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":3,"pivot":{"role_id":3,"permission_id":566}},{"id":567,"alias":"marketing:master:customer.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":3,"pivot":{"role_id":3,"permission_id":567}},{"id":568,"alias":"marketing:master:customer.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":3,"pivot":{"role_id":3,"permission_id":568}},{"id":569,"alias":"marketing:master:customer.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":4,"pivot":{"role_id":3,"permission_id":569}},{"id":570,"alias":"marketing:quotation.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":5,"pivot":{"role_id":3,"permission_id":570}},{"id":571,"alias":"marketing:quotation.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":5,"pivot":{"role_id":3,"permission_id":571}},{"id":572,"alias":"marketing:quotation.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":5,"pivot":{"role_id":3,"permission_id":572}},{"id":573,"alias":"marketing:quotation.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":6,"pivot":{"role_id":3,"permission_id":573}},{"id":574,"alias":"marketing:project.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":7,"pivot":{"role_id":3,"permission_id":574}},{"id":575,"alias":"marketing:project.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":7,"pivot":{"role_id":3,"permission_id":575}},{"id":576,"alias":"marketing:project.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":7,"pivot":{"role_id":3,"permission_id":576}},{"id":577,"alias":"marketing:project.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":8,"pivot":{"role_id":3,"permission_id":577}},{"id":578,"alias":"marketing:master:sot.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":9,"pivot":{"role_id":3,"permission_id":578}},{"id":579,"alias":"marketing:master:sot.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":9,"pivot":{"role_id":3,"permission_id":579}},{"id":580,"alias":"marketing:master:sot.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":9,"pivot":{"role_id":3,"permission_id":580}},{"id":581,"alias":"marketing:master:sow.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":10,"pivot":{"role_id":3,"permission_id":581}},{"id":582,"alias":"marketing:master:sow.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":10,"pivot":{"role_id":3,"permission_id":582}},{"id":583,"alias":"marketing:master:sow.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":10,"pivot":{"role_id":3,"permission_id":583}},{"id":584,"alias":"marketing:joborder.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":11,"pivot":{"role_id":3,"permission_id":584}},{"id":585,"alias":"marketing:joborder.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":11,"pivot":{"role_id":3,"permission_id":585}},{"id":586,"alias":"marketing:joborder.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":11,"pivot":{"role_id":3,"permission_id":586}},{"id":587,"alias":"marketing:joborder.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":12,"pivot":{"role_id":3,"permission_id":587}},{"id":588,"alias":"marketing:master:kom.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":13,"pivot":{"role_id":3,"permission_id":588}},{"id":589,"alias":"marketing:master:kom.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":13,"pivot":{"role_id":3,"permission_id":589}},{"id":590,"alias":"marketing:master:kom.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":13,"pivot":{"role_id":3,"permission_id":590}},{"id":629,"alias":"engineering:boq.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":34,"pivot":{"role_id":3,"permission_id":629}},{"id":630,"alias":"engineering:boq.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":34,"pivot":{"role_id":3,"permission_id":630}},{"id":631,"alias":"engineering:boq.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":34,"pivot":{"role_id":3,"permission_id":631}},{"id":669,"alias":"marketing:joborder.listIndex","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":50,"pivot":{"role_id":3,"permission_id":669}},{"id":706,"alias":"marketing:kom.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":67,"pivot":{"role_id":3,"permission_id":706}},{"id":707,"alias":"marketing:kom.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":67,"pivot":{"role_id":3,"permission_id":707}},{"id":708,"alias":"marketing:kom.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":67,"pivot":{"role_id":3,"permission_id":708}},{"id":709,"alias":"marketing:kom.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":68,"pivot":{"role_id":3,"permission_id":709}},{"id":721,"alias":"marketing:delivery.index","name":"View","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":74,"pivot":{"role_id":3,"permission_id":721}},{"id":722,"alias":"marketing:delivery.edit","name":"Edit","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":74,"pivot":{"role_id":3,"permission_id":722}},{"id":723,"alias":"marketing:delivery.destroy","name":"Delete","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":74,"pivot":{"role_id":3,"permission_id":723}},{"id":724,"alias":"marketing:delivery.create","name":"Create","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":75,"pivot":{"role_id":3,"permission_id":724}},{"id":737,"alias":"marketing:joborder:report.create","name":"Create","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":82,"pivot":{"role_id":3,"permission_id":737}},{"id":738,"alias":"marketing:joborder:report.index","name":"View","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":83,"pivot":{"role_id":3,"permission_id":738}},{"id":739,"alias":"marketing:joborder:report.edit","name":"Edit","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":83,"pivot":{"role_id":3,"permission_id":739}},{"id":740,"alias":"marketing:joborder:report.destroy","name":"Delete","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":83,"pivot":{"role_id":3,"permission_id":740}},{"id":591,"alias":"purchasing:vendor.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":14,"pivot":{"role_id":3,"permission_id":591}},{"id":592,"alias":"purchasing:vendor.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":14,"pivot":{"role_id":3,"permission_id":592}},{"id":593,"alias":"purchasing:vendor.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":14,"pivot":{"role_id":3,"permission_id":593}},{"id":594,"alias":"purchasing:vendor.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":15,"pivot":{"role_id":3,"permission_id":594}},{"id":595,"alias":"purchasing:material.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":18,"pivot":{"role_id":3,"permission_id":595}},{"id":596,"alias":"purchasing:material.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":18,"pivot":{"role_id":3,"permission_id":596}},{"id":597,"alias":"purchasing:material.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":18,"pivot":{"role_id":3,"permission_id":597}},{"id":598,"alias":"purchasing:PurchaseRequest.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":19,"pivot":{"role_id":3,"permission_id":598}},{"id":599,"alias":"purchasing:PurchaseRequest.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":19,"pivot":{"role_id":3,"permission_id":599}},{"id":600,"alias":"purchasing:PurchaseRequest.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":19,"pivot":{"role_id":3,"permission_id":600}},{"id":601,"alias":"purchasing:PurchaseRequest.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":21,"pivot":{"role_id":3,"permission_id":601}},{"id":602,"alias":"marketing:joborder.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":23,"pivot":{"role_id":3,"permission_id":602}},{"id":603,"alias":"marketing:joborder.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":23,"pivot":{"role_id":3,"permission_id":603}},{"id":604,"alias":"marketing:joborder.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":23,"pivot":{"role_id":3,"permission_id":604}},{"id":605,"alias":"marketing:joborder.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":24,"pivot":{"role_id":3,"permission_id":605}},{"id":606,"alias":"marketing:joborder.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":24,"pivot":{"role_id":3,"permission_id":606}},{"id":607,"alias":"marketing:joborder.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":24,"pivot":{"role_id":3,"permission_id":607}},{"id":608,"alias":"purchasing:PurchaseOrder.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":25,"pivot":{"role_id":3,"permission_id":608}},{"id":609,"alias":"purchasing:PurchaseOrder.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":25,"pivot":{"role_id":3,"permission_id":609}},{"id":610,"alias":"purchasing:PurchaseOrder.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":25,"pivot":{"role_id":3,"permission_id":610}},{"id":611,"alias":"purchasing:PurchaseOrder.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":26,"pivot":{"role_id":3,"permission_id":611}},{"id":661,"alias":"ppc:schedule.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":46,"pivot":{"role_id":3,"permission_id":661}},{"id":662,"alias":"ppc:schedule.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":46,"pivot":{"role_id":3,"permission_id":662}},{"id":663,"alias":"ppc:schedule.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":46,"pivot":{"role_id":3,"permission_id":663}},{"id":664,"alias":"ppc:schedule.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":47,"pivot":{"role_id":3,"permission_id":664}},{"id":665,"alias":"ppc:dkm.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":48,"pivot":{"role_id":3,"permission_id":665}},{"id":666,"alias":"ppc:dkm.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":48,"pivot":{"role_id":3,"permission_id":666}},{"id":667,"alias":"ppc:dkm.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":48,"pivot":{"role_id":3,"permission_id":667}},{"id":668,"alias":"ppc:dkm.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":49,"pivot":{"role_id":3,"permission_id":668}},{"id":673,"alias":"ppc:mpk.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":52,"pivot":{"role_id":3,"permission_id":673}},{"id":674,"alias":"ppc:mpk.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":52,"pivot":{"role_id":3,"permission_id":674}},{"id":675,"alias":"ppc:mpk.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":52,"pivot":{"role_id":3,"permission_id":675}},{"id":676,"alias":"ppc:mpk.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":53,"pivot":{"role_id":3,"permission_id":676}},{"id":713,"alias":"purchasing:spb.index","name":"View","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":70,"pivot":{"role_id":3,"permission_id":713}},{"id":714,"alias":"purchasing:spb.edit","name":"Edit","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":70,"pivot":{"role_id":3,"permission_id":714}},{"id":715,"alias":"purchasing:spb.destroy","name":"Delete","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":70,"pivot":{"role_id":3,"permission_id":715}},{"id":716,"alias":"purchasing:spb.create","name":"Create","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":71,"pivot":{"role_id":3,"permission_id":716}},{"id":717,"alias":"ppc:packing.index","name":"View","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":72,"pivot":{"role_id":3,"permission_id":717}},{"id":718,"alias":"ppc:packing.edit","name":"Edit","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":72,"pivot":{"role_id":3,"permission_id":718}},{"id":719,"alias":"ppc:packing.destroy","name":"Delete","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":72,"pivot":{"role_id":3,"permission_id":719}},{"id":720,"alias":"ppc:packing.create","name":"Create","created_at":"2016-11-18 12:49:54","updated_at":"2016-11-18 12:49:54","sub_menu_id":73,"pivot":{"role_id":3,"permission_id":720}},{"id":725,"alias":"purchasing:report.index","name":"View","created_at":"2016-12-20 18:34:03","updated_at":"2016-12-20 18:34:03","sub_menu_id":76,"pivot":{"role_id":3,"permission_id":725}},{"id":726,"alias":"purchasing:report.edit","name":"Edit","created_at":"2016-12-20 18:34:03","updated_at":"2016-12-20 18:34:03","sub_menu_id":76,"pivot":{"role_id":3,"permission_id":726}},{"id":727,"alias":"purchasing:report.destroy","name":"Delete","created_at":"2016-12-20 18:34:03","updated_at":"2016-12-20 18:34:03","sub_menu_id":76,"pivot":{"role_id":3,"permission_id":727}},{"id":741,"alias":"ppc:schedule:monitoring.index","name":"View","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":84,"pivot":{"role_id":3,"permission_id":741}},{"id":742,"alias":"ppc:schedule:monitoring.edit","name":"Edit","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":84,"pivot":{"role_id":3,"permission_id":742}},{"id":743,"alias":"ppc:schedule:monitoring.destroy","name":"Delete","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":84,"pivot":{"role_id":3,"permission_id":743}},{"id":744,"alias":"purchasing:report.getIndex","name":"View","created_at":"2016-12-29 02:41:24","updated_at":"2016-12-29 02:41:24","sub_menu_id":85,"pivot":{"role_id":3,"permission_id":744}},{"id":612,"alias":"engineering:master.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":27,"pivot":{"role_id":3,"permission_id":612}},{"id":613,"alias":"engineering:master.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":27,"pivot":{"role_id":3,"permission_id":613}},{"id":614,"alias":"engineering:master.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":27,"pivot":{"role_id":3,"permission_id":614}},{"id":615,"alias":"engineering:master.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":28,"pivot":{"role_id":3,"permission_id":615}},{"id":619,"alias":"engineering:boq.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":30,"pivot":{"role_id":3,"permission_id":619}},{"id":620,"alias":"engineering:boq.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":30,"pivot":{"role_id":3,"permission_id":620}},{"id":621,"alias":"engineering:boq.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":30,"pivot":{"role_id":3,"permission_id":621}},{"id":622,"alias":"engineering:boq.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":31,"pivot":{"role_id":3,"permission_id":622}},{"id":696,"alias":"production:schedule.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":63,"pivot":{"role_id":3,"permission_id":696}},{"id":697,"alias":"production:schedule.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":63,"pivot":{"role_id":3,"permission_id":697}},{"id":698,"alias":"production:schedule.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":63,"pivot":{"role_id":3,"permission_id":698}},{"id":699,"alias":"ppc:mpk.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":64,"pivot":{"role_id":3,"permission_id":699}},{"id":700,"alias":"ppc:mpk.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":64,"pivot":{"role_id":3,"permission_id":700}},{"id":701,"alias":"ppc:mpk.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":64,"pivot":{"role_id":3,"permission_id":701}},{"id":702,"alias":"production:bsk.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":65,"pivot":{"role_id":3,"permission_id":702}},{"id":703,"alias":"production:bsk.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":65,"pivot":{"role_id":3,"permission_id":703}},{"id":705,"alias":"production:bsk.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":66,"pivot":{"role_id":3,"permission_id":705}},{"id":677,"alias":"logistic:consumable.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":54,"pivot":{"role_id":3,"permission_id":677}},{"id":678,"alias":"logistic:consumable.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":54,"pivot":{"role_id":3,"permission_id":678}},{"id":679,"alias":"logistic:consumable.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":54,"pivot":{"role_id":3,"permission_id":679}},{"id":680,"alias":"logistic:consumable:input.getInput","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":55,"pivot":{"role_id":3,"permission_id":680}},{"id":681,"alias":"logistic:consumable:output.getOutput","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":56,"pivot":{"role_id":3,"permission_id":681}},{"id":682,"alias":"logistic:inventory.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":57,"pivot":{"role_id":3,"permission_id":682}},{"id":683,"alias":"logistic:inventory.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":57,"pivot":{"role_id":3,"permission_id":683}},{"id":684,"alias":"logistic:inventory.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":57,"pivot":{"role_id":3,"permission_id":684}},{"id":685,"alias":"logistic:consumable.getHistory","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":58,"pivot":{"role_id":3,"permission_id":685}},{"id":690,"alias":"marketing:joborder.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":61,"pivot":{"role_id":3,"permission_id":690}},{"id":691,"alias":"marketing:joborder.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":61,"pivot":{"role_id":3,"permission_id":691}},{"id":692,"alias":"marketing:joborder.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":61,"pivot":{"role_id":3,"permission_id":692}},{"id":693,"alias":"ppc:dkm.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":62,"pivot":{"role_id":3,"permission_id":693}},{"id":694,"alias":"ppc:dkm.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":62,"pivot":{"role_id":3,"permission_id":694}},{"id":695,"alias":"ppc:dkm.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":62,"pivot":{"role_id":3,"permission_id":695}},{"id":728,"alias":"logistic:opname.index","name":"View","created_at":"2016-12-28 15:07:00","updated_at":"2016-12-28 15:07:00","sub_menu_id":77,"pivot":{"role_id":3,"permission_id":728}},{"id":729,"alias":"logistic:opname.edit","name":"Edit","created_at":"2016-12-28 15:07:00","updated_at":"2016-12-28 15:07:00","sub_menu_id":77,"pivot":{"role_id":3,"permission_id":729}},{"id":730,"alias":"logistic:opname.destroy","name":"Delete","created_at":"2016-12-28 15:07:00","updated_at":"2016-12-28 15:07:00","sub_menu_id":77,"pivot":{"role_id":3,"permission_id":730}},{"id":731,"alias":"logistic:opname.create","name":"Create","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":78,"pivot":{"role_id":3,"permission_id":731}},{"id":732,"alias":"logistic:report.getInputMonthly","name":"View","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":79,"pivot":{"role_id":3,"permission_id":732}},{"id":733,"alias":"logistic:report.getOutputMonthly","name":"View","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":80,"pivot":{"role_id":3,"permission_id":733}},{"id":748,"alias":"logistic:report.index","name":"View","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":87,"pivot":{"role_id":3,"permission_id":748}},{"id":749,"alias":"logistic:report.edit","name":"Edit","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":87,"pivot":{"role_id":3,"permission_id":749}},{"id":750,"alias":"logistic:report.destroy","name":"Delete","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":87,"pivot":{"role_id":3,"permission_id":750}},{"id":751,"alias":"logistic:report.getStockMonthly","name":"View","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":88,"pivot":{"role_id":3,"permission_id":751}},{"id":755,"alias":"logistic:request.index","name":"View","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":90,"pivot":{"role_id":3,"permission_id":755}},{"id":756,"alias":"logistic:request.edit","name":"Edit","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":90,"pivot":{"role_id":3,"permission_id":756}},{"id":757,"alias":"logistic:request.destroy","name":"Delete","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":90,"pivot":{"role_id":3,"permission_id":757}},{"id":758,"alias":"logistic:request.create","name":"Create","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":91,"pivot":{"role_id":3,"permission_id":758}},{"id":686,"alias":"qc:inspection.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":59,"pivot":{"role_id":3,"permission_id":686}},{"id":687,"alias":"qc:inspection.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":59,"pivot":{"role_id":3,"permission_id":687}},{"id":688,"alias":"qc:inspection.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":59,"pivot":{"role_id":3,"permission_id":688}},{"id":689,"alias":"qc:inspection.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":60,"pivot":{"role_id":3,"permission_id":689}},{"id":653,"alias":"maintenance:equipment.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":42,"pivot":{"role_id":3,"permission_id":653}},{"id":654,"alias":"maintenance:equipment.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":42,"pivot":{"role_id":3,"permission_id":654}},{"id":655,"alias":"maintenance:equipment.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":42,"pivot":{"role_id":3,"permission_id":655}},{"id":656,"alias":"maintenance:equipment.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":43,"pivot":{"role_id":3,"permission_id":656}},{"id":657,"alias":"maintenance:transaction.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":44,"pivot":{"role_id":3,"permission_id":657}},{"id":658,"alias":"maintenance:transaction.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":44,"pivot":{"role_id":3,"permission_id":658}},{"id":659,"alias":"maintenance:transaction.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":44,"pivot":{"role_id":3,"permission_id":659}},{"id":660,"alias":"maintenance:transaction.create","name":"Create","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":45,"pivot":{"role_id":3,"permission_id":660}},{"id":670,"alias":"maintenance:reports.index","name":"View","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":51,"pivot":{"role_id":3,"permission_id":670}},{"id":671,"alias":"maintenance:reports.edit","name":"Edit","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":51,"pivot":{"role_id":3,"permission_id":671}},{"id":672,"alias":"maintenance:reports.destroy","name":"Delete","created_at":"2016-11-18 07:10:05","updated_at":"2016-11-18 07:10:05","sub_menu_id":51,"pivot":{"role_id":3,"permission_id":672}},{"id":734,"alias":"maintenance:equipment:type.index","name":"View","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":81,"pivot":{"role_id":3,"permission_id":734}},{"id":735,"alias":"maintenance:equipment:type.edit","name":"Edit","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":81,"pivot":{"role_id":3,"permission_id":735}},{"id":736,"alias":"maintenance:equipment:type.destroy","name":"Delete","created_at":"2016-12-28 15:07:01","updated_at":"2016-12-28 15:07:01","sub_menu_id":81,"pivot":{"role_id":3,"permission_id":736}},{"id":752,"alias":"maintenance:equipment:group.index","name":"View","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":89,"pivot":{"role_id":3,"permission_id":752}},{"id":753,"alias":"maintenance:equipment:group.edit","name":"Edit","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":89,"pivot":{"role_id":3,"permission_id":753}},{"id":754,"alias":"maintenance:equipment:group.destroy","name":"Delete","created_at":"2018-12-26 06:21:11","updated_at":"2018-12-26 06:21:11","sub_menu_id":89,"pivot":{"role_id":3,"permission_id":754}}],"documents":[{"id":11,"type":"Drawing","created_at":"2016-11-18 07:22:31","updated_at":"2016-11-18 07:22:31","pivot":{"role_id":3,"document_id":11}},{"id":12,"type":"Bill of Quantity","created_at":"2016-11-18 07:23:11","updated_at":"2016-11-18 07:23:11","pivot":{"role_id":3,"document_id":12}},{"id":14,"type":"Schedule","created_at":"2016-11-18 07:25:01","updated_at":"2016-11-18 07:25:01","pivot":{"role_id":3,"document_id":14}},{"id":15,"type":"MPK","created_at":"2016-11-18 07:25:25","updated_at":"2016-11-18 07:25:25","pivot":{"role_id":3,"document_id":15}},{"id":16,"type":"Inspection Test and Plan","created_at":"2016-11-18 07:27:43","updated_at":"2016-11-18 07:27:43","pivot":{"role_id":3,"document_id":16}},{"id":17,"type":"Quotation","created_at":"2016-11-18 07:30:13","updated_at":"2016-11-18 07:30:13","pivot":{"role_id":3,"document_id":17}},{"id":18,"type":"Packing List","created_at":"2016-11-18 12:39:49","updated_at":"2016-11-18 12:39:49","pivot":{"role_id":3,"document_id":18}},{"id":19,"type":"Delivery Order","created_at":"2016-11-18 12:39:53","updated_at":"2016-11-18 12:39:53","pivot":{"role_id":3,"document_id":19}},{"id":20,"type":"BSK","created_at":"2016-11-18 12:40:27","updated_at":"2016-11-18 12:40:27","pivot":{"role_id":3,"document_id":20}},{"id":13,"type":"Commercial Sheet","created_at":"2016-11-18 07:23:19","updated_at":"2016-11-18 07:23:19","pivot":{"role_id":3,"document_id":13}}]}};window.token = 'B3US4bGWgNmt5nxs6XhvZzIzOIW7LrkJSlTdgToB';window.global_today = '2021-02-27';</script><script>window.url = 'http://mrp.codebalt.com/purchasing/request';window.token = 'B3US4bGWgNmt5nxs6XhvZzIzOIW7LrkJSlTdgToB';</script>    <script type="text/javascript" src="http://mrp.codebalt.com/js/purchasing/purchaseRequest.js"></script>


</body></html>