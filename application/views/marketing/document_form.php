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
                <?php if(empty($header->job_number)){?>
                  <select class="form-control selectpicker" name="job_number" id="selectdata" required>
                    <option selected disabled>Please Choose</option>
                    <?php foreach ($choice as $key => $value) {?>
                        <option value="<?php echo $value->job_number ?>"><?php echo $value->job_number ?></option>
                      
                    <?php } ?>
                  </select>
                <?php }else{?>
                   <select class="form-control selectpicker" name="job_number" id="selectdata" required>
                  <?php foreach ($choice as $key => $value) {
                      if($header->job_number==$value->job_number){?>
                        <option value="<?php echo $value->job_number ?>" selected><?php echo $value->job_number ?></option>
                      <?php }else{?>
                        <option value="<?php echo $value->job_number ?>"><?php echo $value->job_number ?></option>
                      <?php } }?>
                    </select>
                <?php } ?>
              </div>
          </div> 
        </div>
        <div class="col-md-12">
            <div class="wrapper">
                <div class="row">
                    <div class="col-md-12">
                        <h5 style="margin-top: 5px;">
                            <b><?php echo $header->job_number??'' ?> - <?php echo $header->company_name??'' ?></b>
                        </h5>
                        <div class="col-md-6" style="font-size: 12px; color: dimgray; margin-left: -30px; margin-bottom: 10px;">
                            <div class="col-md-4">
                                <table style="width: 100%;color:dimgray;font-size:12px;">
                                    <tbody><tr>
                                        <th>PO Date</th>
                                        <td><?php echo $header->po_date??'' ?></td>
                                    </tr>
                                    <tr>
                                        <th>Due Date</th>
                                        <td><?php echo $header->due_date??'' ?></td>
                                    </tr>
                                </tbody></table>
                            </div>
                            <div class="col-md-4">
                                <table style="width: 100%;color:dimgray;font-size:12px;">
                                    <tbody><tr>
                                        <th>Type</th>
                                        <td><?php echo $header->order_type??'' ?></td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td><?php echo $header->status??'' ?></td>
                                    </tr>
                                </tbody></table>

                            </div>
                            <div class="col-md-4">
                                <table style="width: 100%;color:dimgray;font-size:12px;">
                                    <tbody><tr>
                                        <th>Created By</th>
                                        <td><?php echo $header->marketing??'' ?></td>
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
        <form method="post" enctype="multipart/form-data" class="form form-horizontal" action="<?php echo base_url() ?>marketing/document">
            <input type="hidden" name="id" />
            <input type="hidden" name="choice_jo"/>
            <input type="hidden" name="job_number" value="<?php echo $header->job_number??'' ?>">
            <div class="wrapper">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label col-md-2" style="color:red">Document Title *</label>
                                    <div class="col-md-9">
                                        <input name="title" type="text" class="form-control input-sm" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Type</label>
                                    <div class="col-md-9">
                                        <select name="type_id" class="form-control input-sm">
                                            <option value="Drawing">
                                                Drawing
                                            </option>
                                            <option value="Bill of Quantity">
                                                Bill of Quantity
                                            </option>
                                            <option value="Schedule">
                                                Schedule
                                            </option>
                                            <option value="MPK">
                                                MPK
                                            </option>
                                            <option value="Inspection Test and Plan">
                                                Inspection Test and Plan
                                            </option>
                                            <option value="Quotation">
                                                Quotation
                                            </option>
                                            <option value="Packing List">
                                                Packing List
                                            </option>
                                            <option value="Delivery Order">
                                                Delivery Order
                                            </option>
                                            <option value="BSK">
                                                BSK
                                            </option>
                                            <option value="Commercial Sheet">
                                                Commercial Sheet
                                            </option><!--v-if--><!--fragment-end--><!--v-for-end-->
                                            <!--v-if-->
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Upload File(s)</label>
                                    <div class="col-md-9">
                                        <input name="file" type="file" class="form-control input-sm" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Note</label>
                                    <div class="col-md-9">
                                    <textarea name="note" rows="3" class="form-control input-sm"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Submit Date</label>
                                    <div class="col-md-8">
                                      <input type="date" name="start_date" value="<?php echo date('Y-m-d'); ?>" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">Validity</label>
                                    <div class="col-md-1" style="display: inline-flex;">
                                        <input name="reminder" type="checkbox" value="1" class="form-control">
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
                <th>
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
                    Validity
                </th><th>
                    Created By 
                </th><th>
                    Action
                </th><!--v-for-end-->
        </tr>
        </thead>
        <tbody>
          <?php if(empty($table)){?>

          <?php }else{ $i=1;?>
            <?php foreach ($table as $key => $value) {?>
                <tr>
                  <td><?php echo $i; ?></td>
                  <td><?php echo $value->title??'' ?></td>
                  <td><?php echo $value->note??'' ?></td>
                  <td><?php echo $value->file_name??'' ?></td>
                  <td><?php echo $value->type_name??'' ?></td>
                  <td><center><?php if($value->reminder??''=="1"){ echo "yes";}else{echo "no";} ?></center></td>
                  <td><?php echo $value->user_created??'' ?></td>
                  <td>
                      <div class="dropdown">
                        <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Action
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="action" style="min-width: 80px; font-size: 9pt">
                            <?php if($sub_menu_access->delete=="1"||$value->user_created==$this->session->userdata('id')){ ?><li><a role="button" class="delete" data="<?php echo $value->id ?>" data-toggle="modal" data-target="#status_modal">Delete</a></li>
                          <?php } ?>
                            <li><a target="_blank" href="<?php echo base_url()?>images/<?php echo $value->file_name?>">Download</a></li>
                        </ul>
                      </div>
                  </td>
                </tr>
            <?php $i++; } ?>
          <?php } ?>
          
        </tbody>
    </table>
    
</div>
    </div>
</div><!--v-component-->
        </div>
    </div>
    <form action="<?php echo base_url()?>marketing/document" method="POST" id="sendafterchange">
      <input type="hidden" name="job_number" id="job_number_send"/>
    </form>
    <form action="<?php echo base_url()?>marketing/document" method="POST" id="sendafterchange2">
      <input type="hidden" name="job_number" id="job_number_send_2"/>
      <input type="hidden" name="id_delete" id="delete_data"/>
    </form>
    <div class="modal fade" id="status_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        Delete Confirmation
      </div>
      <div class="modal-body">
          <center>
            Are You Sure?
          </center>
          <br>
          <center>
            <button class="btn btn-danger" id="remove_button_submit">Remove</button>
            <button class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          </center>
        </div>
    </div>
  </div>
</div>
<?php $this->load->view('template/footer'); ?>
<script type="text/javascript">
  $(document).on("change","#selectdata",function(){
    $("#job_number_send").val($(this).val());
    $("#sendafterchange").submit();
  });
  $(document).on("click",".delete",function(){
    var data1=$(this).attr("data");
    $("#job_number_send_2").val($("#selectdata").val());
    $("#delete_data").val(data1);
    // $("#sendafterchange2").submit();
  })
  $(document).on("click","#remove_button_submit",function(){
    $("#sendafterchange2").submit();
  })
  var response="<?php echo $response??''; ?>";
  if(response=="success"){
    $.toast({
          heading: 'Success',
          text: 'File uploaded Successfully',
          showHideTransition: 'slide',
          icon: 'success',
          position : 'top-right'
      })
  }else if(response=="failed"){
    $.toast({
          heading: 'Error',
          text: 'File not uploaded',
          showHideTransition: 'slide',
          icon: 'error',
          position : 'top-right'
      });
  }else if(response=="success_document"){
    $.toast({
          heading: 'Success',
          text: 'File Deleted Successfully',
          showHideTransition: 'slide',
          icon: 'success',
          position : 'top-right'
      })
  }
</script>
</body></html>