<html lang="en"><head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MRP </title>
    <link href="<?php echo base_url() ?>css/app.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugin/fontawesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>plugin/datatable/datatables.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>plugin/selectpicker/css/bootstrap-select.css"/>
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
<?php $this->load->view('admin/header'); ?>

    <div class="container-fluid" style="min-height: 76.6vh;">
        <div class="header">
            <h5 style="font-weight: bold;">Master Currency</h5>
        </div>
        <div class="body">
            <!--v-start--><div class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" slot="header">Edit Monthly Rate
        <button type="button" class="close"><span aria-hidden="true">×</span></button>
    </h4>
            </div>
            <div class="modal-body">
                <table slot="body" class="table datatable table-bordered table-condensed table-hover table-striped">
        <thead>
        <tr>
            <th>Year</th>
            <th>Jan</th>
            <th>Feb</th>
            <th>Mar</th>
            <th>Apr</th>
            <th>May</th>
            <th>Jun</th>
            <th>Jul</th>
            <th>Aug</th>
            <th>Sep</th>
            <th>Oct</th>
            <th>Nov</th>
            <th>Dec</th>
            <th>Remark</th>
        </tr>
        </thead>
        <tbody>
        <!--v-for-start--><tr>
            <td>2020</td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td><input class="form-control input-sm" type="text"></td>
            <td>
                <button class="btn btn-info btn-xs">Save</button>
            </td>
        </tr><!--v-for-end-->
        <!--v-if-->
        </tbody>
    </table>
            </div>
            <div class="modal-footer">
                <div class="modal-footer" slot="footer">
        <div class="form-group">
            <label class="control-label col-md-3">Add New Year</label>
            <div class="col-md-7">
                <input type="text">
                <button class="btn btn-info btn-xs">Add</button>
            </div>
        </div>
    </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div><!--v-component-->
<form method="post" id="former" class="form form-horizontal" action="<?php echo base_url() ?>admin/currency_add">
  <input type="hidden" name="id" value=""/>
    <div class="wrapper">
        <div class="box">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label class="control-label col-md-2" style="color: red;">Currency Code</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control input-sm" name="code" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">Description</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control input-sm" name="desc">
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
<div class="col-md-12">
    <table class="table datatable table-bordered table-condensed table-hover table-striped">
        <thead>
        <tr>
            <th>No.</th>
            <th>
                Currency Code
                <span class="fa fa-caret-down"></span>
            </th>
            <th>Description</th>
            <th>Edit Monthly Rate</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <!--v-for-start-->
        <?php $i=1; foreach ($currencies as $key => $value) {?>
        <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $value->currency_code; ?></td>
            <td><?php echo $value->desc; ?>h</td>
            <td>
                <button class="btn btn-info btn-xs">Edit Monthly Rate</button>
            </td>
            <td>
                <button class="btn btn-info btn-xs edit_button" data="<?php echo $value->id; ?>" code="<?php echo $value->currency_code; ?>" desc="<?php echo $value->desc; ?>">Edit</button>
                <button type="button" class="btn btn-danger btn-xs remove_button" data="<?php echo $value->id; ?>">
                    Delete
                </button>
            </td>
        </tr>
      <?php $i+=1; } ?>
        </tbody>
    </table>
    <ul class="pagination pagination-sm pull-right">
        <li class="disable">
            <a role="button">
                &lt;&lt;
            </a>
        </li>
        <!--v-for-start--><li class="active">
            <a role="button">
                1
            </a>
        </li><!--v-for-end-->
        <li class="disable">
            <a role="button">
                &gt;&gt;
            </a>
        </li>
    </ul>
</div><!--v-end--><!--v-component-->
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
<script>
  $(document).ready(function(){
    $(document).on('click',".edit_button",function(){
      var data1=$(this).attr("data");
      $("input[name='id']").val(data1);
      $("input[name='code']").val($(this).attr("code"));
      $("input[name='desc']").val($(this).attr("desc"));
    });
    $(document).on('click',".remove_button",function(){
      var data1=$(this).attr("data");
      $("input[name='id']").val(data1);
      $("#former").submit();
    });
  })
</script>

</body></html>