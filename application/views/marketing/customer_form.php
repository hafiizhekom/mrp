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
            <h5 style="font-weight: bold;">
              <?php if(empty($table)){ ?>New Customer<?php }else{ echo "Edit Customer"; }?>
            </h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-12">
                <form class="form form-horizontal" method="POST" action="<?php echo base_url() ?>marketing/customer/add">
                  <input type="hidden" name="id_header" value="<?php echo $table->id??'';?>"/>
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5 style="font-weight: bold;">Customer Information</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Customer Code</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-xs" name="code" value="<?php echo $table->code??''; ?>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3" style="color: red;">Customer Name</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-md" name="name" value="<?php echo $table->name??''; ?>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Address</label>
                            <div class="col-md-9">
                            <textarea rows="3" class="form-control input-sm input-size-lg" name="address"><?php echo $table->address??''; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">City</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-md" name="city" value="<?php echo $table->city??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Postal Code</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-md" name="postal" value="<?php echo $table->postal_code??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Country</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-md" name="country" value="<?php echo $table->country??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Phone Number</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-xs" name="phone" value="<?php echo $table->phone??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Fax Number</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-xs" name="fax" value="<?php echo $table->fax??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Email Address</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-sm" name="email" value="<?php echo $table->email??''; ?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">Bank Account</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-sm" name="bank" value="<?php echo $table->bank_account??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">NPWP</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-sm" name="npwp" value="<?php echo $table->npwp??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">NPPKP</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-sm" name="nppkp" value="<?php echo $table->nppkp??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">TKIP</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-sm" name="tkip" value="<?php echo $table->tkip??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Credit Limit ( Rp. )</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-xs" name="credit_limit" value="<?php echo $table->credit_limit??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Payment Term</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control input-sm input-size-xs" style="display: inline-block;" name="payment_term" value="<?php echo $table->payment_term??''; ?>">
                                <span>day(s)</span>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Attention</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-md" name="attention" value="<?php echo $table->attention??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Code for SO</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-sm input-size-md" name="code_for_so" value="<?php echo $table->code_for_so??''; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Note</label>
                            <div class="col-md-9">
                            <textarea rows="3" class="form-control input-sm input-size-lg" name="note"><?php echo $table->note??''; ?></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-header">
                <h5>Contact Person</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-8">
                        <div>
    <div id="example" class="table table-bordered table-condensed table-striped" style="display:table;">
        <div class="div-thead">
            <div class="div-tr" slot="head">
                                <div class="div-th">No.</div>
                                <div class="div-th">Name</div>
                                <div class="div-th">Phone</div>
                                <div class="div-th">Handphone</div>
                                <div class="div-th">Email</div>
                                <div class="div-th">Position</div>
                                <div class="div-th">Remove</div>
                            </div>
        </div>
        <div class="div-tbody">
          <?php if(empty($contact)){?>
              <div class="div-tr" slot="body">
                                <div class="div-td numbering">
                                    <span class="numbering">1</span>
                                    <input type="hidden" name="contact_id[]" >
                                </div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_name[]" ></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_phone[]" ></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_handphone[]" ></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_email[]" ></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_position[]" ></div>
                                <div class="div-td">
                                    <button type="button" class="btn btn-info btn-xs add_button">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs remove_button">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
          <?php }else{ $g=1; foreach ($contact as $key => $value) {?>
            <!--v-for-start--><div class="div-tr" slot="body">
                                <div class="div-td numbering">
                                    <span class="numbering"><?php echo $g; ?></span>
                                    <input type="hidden" name="contact_id[]" value="<?php echo $value->id??'';?>">
                                </div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_name[]" value="<?php echo $value->name??'';?>"></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_phone[]" value="<?php echo $value->phone??'';?>"></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_handphone[]" value="<?php echo $value->handphone??'';?>"></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_email[]" value="<?php echo $value->email??'';?>"></div>
                                <div class="div-td"><input type="text" class="form-control input-sm" name="contact_position[]" value="<?php echo $value->position??'';?>"></div>
                                <div class="div-td">
                                    <button type="button" class="btn btn-info btn-xs add_button">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger btn-xs remove_button">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div><!--v-for-end-->
                          <?php $g++;} } ?>
            
        </div>
    </div>
</div><!--v-component-->
                    </div>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" id="check_form" class="btn btn-info btn-xs" disabled>Save</button>
            <button type="reset" class="btn btn-warning btn-xs">Reset</button>
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
        $(document).on("click",".add_button",function(){
            $(".div-tbody").append('<div class="div-tr" slot="body"><div class="div-td "><span class="numbering">1</span> <input type="hidden" name="contact_id[]" value=""></div><div class="div-td"><input type="text" class="form-control input-sm" name="contact_name[]"></div><div class="div-td"><input type="text" class="form-control input-sm" name="contact_phone[]"></div><div class="div-td"><input type="text" class="form-control input-sm" name="contact_handphone[]"></div><div class="div-td"><input type="text" class="form-control input-sm" name="contact_email[]"></div><div class="div-td"><input type="text" class="form-control input-sm" name="contact_position[]"></div><div class="div-td"><button type="button" class="btn btn-info btn-xs add_button"><i class="fa fa-plus"></i></button>&nbsp;<button type="button" class="btn btn-danger btn-xs remove_button"><i class="fa fa-minus"></i></button></div></div>');

            // alert($(".numbering").length);
            for (var i = 0; i <= $(".numbering").length; i++) {
                $(".numbering").eq(i).text(i+1);
            }
        });
        $(document).on("click",".remove_button",function(){
            $(this).parent().parent().remove();
            for (var i = 0; i <= $(".numbering").length; i++) {
                $(".numbering").eq(i).text(i+1);
            }
        });
        if($("input[name='id_header']").val()!=""){
          $("#check_form").attr("disabled",false);
        }
    });
    $(document).on("focusout","input[name='code']",function(){
      var data=$(this).val();
      $.ajax({
        url: '<?php echo base_url() ?>marketing/customer_check',
        type: 'POST',
        dataType: 'json',
        data: {id: data},
      })
      .done(function(res) {
        console.log(res);
        if(res==""){
          $("#check_form").attr("disabled",false);
        }else{
          $("#check_form").attr("disabled",true);
        }

        if($("input[name='id_header']").val()!=""){
          $("#check_form").attr("disabled",false);
        }
      })
      
    })
</script>
</body>
</html>