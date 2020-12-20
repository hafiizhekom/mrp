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
                Create New SPB
            </h5>
        </div>
        <div class="body">
            <div class="col-md-12">
                <form class="form form-horizontal" method="post" action="http://mrp.codebalt.com/purchasing/spb">
    <input type="hidden" value="">
    <input type="hidden" value="MrDImM6k8rRPYxKjJQbypGsZiJHRh10RCe5Ei7WI">
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5 style="font-weight: bold">SPB Information</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
    <label class="control-label col-md-3" style="color: red">SPB No.</label>
    <div class="col-md-9">
        <input type="text" class="form-control input-sm input-size-md" readonly="">
        <input type="checkbox"> <i style="font-size: 12px;">auto-generate</i>
        <!--<button type="button" @click="generateNumber('Quotation', 'active.no')" class="btn btn-info btn-xs">Generate</button>-->
    </div>
</div><!--v-component-->
                        <!--<div class="form-group">-->
                            <!--<label class="control-label col-md-3"-->
                                   <!--style="text-align: left; font-size: 10pt; color: red;">SPB No.</label>-->
                            <!--<div class="col-md-4">-->
                                <!--<input type="text" v-model="active.no" class="form-control">-->
                            <!--</div>-->
                        <!--</div>-->
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red">Date</label>
                            <div class="col-md-9">
                                <div class="datepicker">
  <input {{="" ro="" ?="" 'readonly'="" '}}="" placeholder="Select Date" type="text" value="2020-12-20">

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
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="text-align: left; font-size: 10pt; color: red;">Receiver</label>
                            <div class="col-md-6">
                                <div class="dropdown v-select searchable">
		<div class="dropdown-toggle clearfix" type="button">

        <!--v-for-start--><!--v-for-end-->

			<input type="search" class="form-control input-sm" style="width: 100%;">

			<i role="presentation" class="open-indicator"></i>

			<div class="spinner" style="display: none;">Loading...</div>
		</div>

		<ul class="dropdown-menu expand-transition" style="display: none; max-height: 400px;">
			<!--v-for-start--><li class="highlight">
				<a>
					Developer
				</a>
			</li><li>
				<a>
					Admin
				</a>
			</li><li>
				<a>
					lazuardirr
				</a>
			</li><li>
				<a>
					engineering
				</a>
			</li><li>
				<a>
					Production
				</a>
			</li><li>
				<a>
					Finance
				</a>
			</li><li>
				<a>
					Wiwi 
				</a>
			</li><li>
				<a>
					Verry
				</a>
			</li><li>
				<a>
					Edy
				</a>
			</li><li>
				<a>
					Galih
				</a>
			</li><li>
				<a>
					Wiwilee
				</a>
			</li><li>
				<a>
					Sustiono
				</a>
			</li><li>
				<a>
					Admin Marketing
				</a>
			</li><li>
				<a>
					Toto
				</a>
			</li><li>
				<a>
					Amo
				</a>
			</li><li>
				<a>
					Slamet
				</a>
			</li><li>
				<a>
					Ramina
				</a>
			</li><li>
				<a>
					Lita
				</a>
			</li><li>
				<a>
					Suparman
				</a>
			</li><li>
				<a>
					Untung
				</a>
			</li><li>
				<a>
					Eka
				</a>
			</li><li>
				<a>
					Admin PPC
				</a>
			</li><li>
				<a>
					Test
				</a>
			</li><li>
				<a>
					QCWS1
				</a>
			</li><li>
				<a>
					QCWS2
				</a>
			</li><li>
				<a>
					Admin Purchasing
				</a>
			</li><li>
				<a>
					Admin Maintenance
				</a>
			</li><li>
				<a>
					Henry
				</a>
			</li><!--v-for-end-->
			<!--v-if-->
			<!--v-if-->
		</ul>
	</div><!--v-component-->
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Note</label>
                            <div class="col-md-6">
                    <textarea rows="2" class="form-control input-sm"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5 style="font-weight: bold">Detail</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover table-bordered datatable table-condensed">
                            <thead>
                            <tr>
                                <th rowspan="2">No</th>
                                <th rowspan="2">PO No.</th>
                                <th rowspan="2">Item Code</th>
                                <th colspan="2">Quantity</th>
                                <th rowspan="2">Unit</th>
                                <th rowspan="2">ETA</th>
                                <th rowspan="2">Actual Date</th>
                                <th rowspan="2">Action</th>
                            </tr>
                            <tr>
                                <th style="width: 100px">PO</th>
                                <th style="width: 100px">SPB</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!--v-for-start--><!--fragment-start--><tr>
    <td><input type="hidden" value="">1</td>
    <td>
        <div class="dropdown v-select searchable">
		<div class="dropdown-toggle clearfix" type="button">

        <!--v-for-start--><!--v-for-end-->

			<input type="search" class="form-control input-sm" style="width: 100%;">

			<i role="presentation" class="open-indicator"></i>

			<div class="spinner" style="display: none;">Loading...</div>
		</div>

		<ul class="dropdown-menu expand-transition" style="display: none; max-height: 400px;">
			<!--v-for-start--><!--v-for-end-->
			<li class="divider fade-transition"></li><!--v-if-->
			<li class="text-center fade-transition">
				Sorry, no matching options.
			</li><!--v-if-->
		</ul>
	</div><!--v-component-->
    </td>
    <td>
        <div class="dropdown v-select searchable">
		<div class="dropdown-toggle clearfix" type="button">

        <!--v-for-start--><!--v-for-end-->

			<input type="search" class="form-control input-sm" style="width: 100%;">

			<i role="presentation" class="open-indicator"></i>

			<div class="spinner" style="display: none;">Loading...</div>
		</div>

		<ul class="dropdown-menu expand-transition" style="display: none; max-height: 400px;">
			<!--v-for-start--><!--v-for-end-->
			<li class="divider fade-transition"></li><!--v-if-->
			<li class="text-center fade-transition">
				Sorry, no matching options.
			</li><!--v-if-->
		</ul>
	</div><!--v-component-->
    </td>
    <td><input type="text" class="form-control" readonly=""></td>
    <td><input type="text" class="form-control"></td>
    <td><input type="text" class="form-control"></td>
    <td>
        <div class="datepicker">
  <input {{="" ro="" ?="" 'readonly'="" '}}="" placeholder="Select Date" type="text">

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
    </td>
    <td>
        <div class="datepicker">
  <input {{="" ro="" ?="" 'readonly'="" '}}="" placeholder="Select Date" type="text">

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
    </td>
    <td style="min-width: 65px;">
        <button type="button" class="btn btn-info btn-xs">
            <i class="fa fa-plus"></i>
        </button>
        <button class="btn btn-danger btn-xs">
            <i class="fa fa-minus"></i>
        </button>
    </td>
</tr><!--v-component--><!--fragment-end--><!--v-for-end-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-info btn-xs">Save</button>
            <button type="reset" class="btn btn-warning btn-xs">Reset</button>
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