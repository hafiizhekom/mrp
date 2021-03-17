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
<?php $this->load->view('admin/header'); ?>

    <div class="container-fluid">
        <div class="header">
            <h5 style="font-weight: bold">Permission</h5>
        </div>
        <div class="body">
            <div class="col-md-12">
                <form method="post" action="<?php echo base_url() ?>admin/permission_change" >
                  <input type="hidden" name="id" value="<?php echo $id??''; ?>" />
    <table class="table table-striped table-condensed table-hover table-bordered datatable">
        <thead>
        <tr>
            <th style="vertical-align: middle;">No.</th>
            <th style="vertical-align: middle;">
                <select class="form-control input-sm" name="module">
                  <option selected value="all">All Module</option>
                    <?php foreach ($select1 as $key => $value) {?>
                      <option value="<?php echo $value->module; ?>"><?php echo $value->module; ?></option>
                    <?php } ?>
                </select>
            </th>
            <th style="vertical-align: middle;">
                <select class="form-control input-sm" name="menu">
                  <option selected value="all">All Menu</option>
                    <?php foreach ($select2 as $key => $value) {?>
                      <option value="<?php echo $value->menu; ?>"><?php echo $value->menu; ?></option>
                    <?php } ?>
                </select>
            </th>
            <th style="vertical-align: middle;">
                <select class="form-control input-sm" name="sub_menu">
                  <option selected value="all">All Sub Menu</option>
                   <?php foreach ($table as $key => $value) {?>
                      <option value="<?php echo $value->sub_menu; ?>"><?php echo $value->sub_menu; ?></option>
                    <?php } ?>
                </select>
            </th>
            <th style="text-align: center;">
                Allow Access
                <input type="checkbox" name="allow_all">
            </th>
            <th style="text-align: center;">
                Approval
            </th>
        </tr>
        </thead>
        <tbody>
      <?php $i=1; foreach ($table as $key => $value) {?>
        <tr>
          <td><span class="numbering"><?php echo $i; ?></span></td>
          <td class="module"><?php echo $value->module??''; ?></td>
          <td class="menu"><?php echo $value->menu??''; ?></td>
          <td class="sub_menu"><?php echo $value->sub_menu??''; ?></td>
          <td style="width: 210px;">

            <?php if($value->create=="1"){?>
                <span>
                  <input type="checkbox" <?php foreach ($access as $key3 => $value3) {
                if($value3->sub_menu_id==$value->id && $value3->create=="1"){?> checked="checked" <?php } } ?> value="<?php echo $value->id??'' ?>" name="create[]"> Create
                </span>
            <?php } ?>
            <?php if($value->view=="1"){?>
              <span>
                  <input type="checkbox" <?php foreach ($access as $key3 => $value3) {
                if($value3->sub_menu_id==$value->id && $value3->view=="1"){?> checked="checked" <?php } } ?> value="<?php echo $value->id??'' ?>" name="view[]"> View
              </span>
            <?php } ?>
            <?php if($value->edit=="1"){?>
              <span>
                  <input type="checkbox" <?php foreach ($access as $key3 => $value3) {
                if($value3->sub_menu_id==$value->id && $value3->edit=="1"){?> checked="checked" <?php } } ?> value="<?php echo $value->id??'' ?>" name="edit[]"> Edit
              </span>
            <?php } ?>
            <?php if($value->delete=="1"){?>
              
              <span>
                  <input type="checkbox" <?php foreach ($access as $key3 => $value3) {
                if($value3->sub_menu_id==$value->id && $value3->delete=="1"){?> checked="checked" <?php } } ?> value="<?php echo $value->id??'' ?>" name="delete[]"> Delete
              </span>
            <?php } ?>
            <?php if($value->commercial_sheet=="1"){?>
              
              <span>
                  <input type="checkbox" <?php foreach ($access as $key3 => $value3) {
                if($value3->sub_menu_id==$value->id && $value3->commercial_sheet=="1"){?> checked="checked" <?php } } ?> value="<?php echo $value->id??'' ?>" name="commercial_sheet[]"> Commercial Sheet
              </span>
            <?php } ?>
            
          </td>
          <td>
            <?php if($value->approve=="1"){?>
              <span>
                  <input type="checkbox" <?php foreach ($access as $key3 => $value3) {
                if($value3->sub_menu_id==$value->id && $value3->approve=="1"){?> checked="checked" <?php } } ?> value="<?php echo $value->id??'' ?>" name="approve[]"> Approval
              </span>
            <?php } ?>
          </td>
        </tr>
      <?php $i++; } ?>
        
        </tbody>
    </table>
    <br>
    <button type="submit" class="btn btn-info btn-xs">Save</button>
</form><!--v-component-->
            </div>
        </div>
    </div>
<?php $this->load->view('template/footer'); ?>
<script type="text/javascript">
  
   
  $(document).on("change","input[name='allow_all']",function(){
    if($(this).is(":checked")){
      $("input[type='checkbox']").attr("checked",true);
    }else{
      $("input[type='checkbox']").attr("checked",false);
    }
  });
  $(document).on("change","select[name='module']",function(){
    var data=$(this).val();
    var number=1;
    
    if(data=="all"){
      $(".module").eq(i).parent().show();
      $(".numbering").eq(i).text(number);
      number+=1;
    }else{
      for (var i = 0; i < ($(".module").length); i++) {
        if($(".module").eq(i).text()==data){
          $(".module").eq(i).parent().show();
          $(".numbering").eq(i).text(number);
          number+=1;
        }else{
          $(".module").eq(i).parent().hide();
        }
      }
    }
    

  });

  $(document).on("change","select[name='menu']",function(){
    var data=$(this).val();
    var number=1;
    
    if(data=="all"){
      for (var i = 0; i < ($(".menu").length); i++) {
        $(".menu").eq(i).parent().show();
        $(".numbering").eq(i).text(number);
        number+=1;
      }
    }else{
      for (var i = 0; i < ($(".menu").length); i++) {
        if($(".menu").eq(i).text()==data){
          $(".menu").eq(i).parent().show();
          $(".numbering").eq(i).text(number);
          number+=1;
        }else{
          $(".menu").eq(i).parent().hide();
        }
      }
    }

    
  });

  $(document).on("change","select[name='sub_menu']",function(){
    var data=$(this).val();
    var number=1;
    
    if(data=="all"){
      for (var i = 0; i < ($(".sub_menu").length); i++) {
          $(".sub_menu").eq(i).parent().show();
          $(".numbering").eq(i).text(number);
          number+=1;
      }
    }else{
      for (var i = 0; i < ($(".sub_menu").length); i++) {
        if($(".sub_menu").eq(i).text()==data){
          $(".sub_menu").eq(i).parent().show();
          $(".numbering").eq(i).text(number);
          number+=1;
        }else{
          $(".sub_menu").eq(i).parent().hide();
        }
      }
    }

    
  });
</script>
</body></html>