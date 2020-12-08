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

    <div class="container-fluid" id="app-user">
        <div class="header">
            <h5 style="font-weight: bold">USER ACCOUNT</h5>
        </div>
        <div class="body">
            <div class="col-md-3">
                <form class="form form-horizontal" action="<?php echo base_url() ?>admin/user_add" method="POST">
    <input type="hidden" name="id" id="hidden_id" value="">
    <div class="wrapper">
        <div class="box">
            <div class="box-header">
                <h5>User Information</h5>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Employee ID</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-size-md" name="employee_id">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Name</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-size-md" name="name">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Username</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-size-md" name="username">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Position</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-size-md" name="position">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Email</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-size-md" name="email">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Password</label>
                            <div class="col-md-9">
                                <input type="password" class="form-control input-size-md" name="password">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Group</label>
                            <div class="col-md-9">
                                <select  class="selectpicker form-control" data-live-search="true" name="group_id">
                                    <option selected></option>
                                    <?php foreach ($group as $key => $value) {?>
                                        <option value="<?php echo $value->id ?>"><?php echo $value->name; ?></option>
                                    <?php } ?>
                                </select>
                            </div> 
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Contact</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-size-md" name="contact">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Company</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control input-size-md" name="company">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Default Module</label>
                            <div class="col-md-9">
                                <select class="selectpicker form-control" data-live-search="true" name="default">
                                    <option selected></option>
                                    <option value="ADM">Administrator</option>
                                    <option value="MKT">Marketing</option>
                                    <option value="PROD">Production</option>
                                    <option value="ENG">Engineering</option>
                                    <option value="MNT">Maintenance</option>
                                    <option value="PUR">Purchasing</option>
                                    <option value="PPC">PPC</option>
                                    <option value="LOG">Logistic</option>
                                    <option value="QC">Quality Control</option>
                                </select>
                            </div> 
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">Sales Person</label>
                            <div class="col-md-9">
                                <input type="checkbox" value="1" name="sales">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-info btn-xs">Save</button>
        </div>
    </div>
</form><!--v-component-->
            </div>
            <div class="col-md-9 col-lg-9">
                <div class="table-scrollable">
    <table class="table table-striped table-bordered" id="table_1" style=" width : 100% !important">
        <thead>
        <!--fragment-start--><!--v-for-start--><!--v-for-end--><!--fragment-end--><!--v-if-->
        <tr>
            <!--v-for-start--><th>
                    #
                </th><th>
                    Module
                </th><th>
                    Employee ID
                </th><th>
                    Name
                </th><th>
                    Username
                </th><th>
                    Position
                </th><th>
                    Email
                </th><th>
                    Company
                </th><th>
                    Contact
                </th><th>
                    Sales Person
                </th><th>
                    Group
                </th><th>
                    Remark
                </th><!--v-for-end-->
        </tr>
        </thead>
        <tbody>
            <?php $i=1;
            foreach ($table_data as $key => $value) {?>
                
            <tr>
                <td>
                    <?php echo $i; ?>
                </td>
                <td>
                    <?php echo $value->default_module;?>
                </td>
                <td>
                    <?php echo $value->employee_id; ?>
                </td>
                <td>
                    <?php echo $value->name; ?>
                </td>
                <td>
                    <?php echo $value->username; ?>
                </td>
                <td>
                    <?php echo $value->position; ?>
                </td>
                <td>
                    <?php echo $value->email; ?>
                </td>
                <td>
                    <?php echo $value->company; ?>
                </td>
                <td>
                    <?php echo $value->contact; ?>
                </td>
                <td>
                    <?php if($value->sales_person==1){echo "Yes";}else{echo "No";} ?>
                </td>
                <td>
                    <?php echo $value->group; ?>
                </td>
                <td style='white-space: nowrap'>
                    <center>
                        <button class="btn btn-info edit_button" data="<?php echo $value->id; ?>"><i class="fa fa-edit"></i> Edit</button>&nbsp;<button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button>
                    </center>
                </td>
            </tr>
            <?php $i+=1;} ?>
        </tbody>
    </table>
    <form id="remove_action" action="<?php echo base_url() ?>admin/user_remove" method="POST">
        <input type="hidden" id="remove_id" name="id" value="" /> 
    </form>
</div>
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
</footer>
<script src="<?php echo base_url() ?>script/jquery.js" type="text/javascript"></script>
<script src="<?php echo base_url() ?>script/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<?php echo base_url() ?>plugin/datatable/datatables.min.js"></script>
<script type="text/javascript" src="<?php echo base_url() ?>plugin/selectpicker/js/bootstrap-select.js"></script>
<script src="<?php echo base_url() ?>script/crypto.js"></script>
<script>
    $(document).ready(function(){

        $("#table_1").DataTable( {
        "scrollX": true
        });

        $(document).on('click',".edit_button",function(){
            var data1=$(this).attr("data");
            $.ajax({
                url: '<?php echo base_url() ?>admin/user_detail',
                type: 'POST',
                data: {id: data1},
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
                // console.log(res);
                $("#hidden_id").val(res.id);
                $("input[name='employee_id']").val(res.employee_id);
                $("input[name='name']").val(res.name);
                $("input[name='username']").val(res.username);
                $("input[name='email']").val(res.email);
                $("input[name='position']").val(res.position);
                $("input[name='password']").val(res.password);
                $("input[name='contact']").val(res.contact);
                $("input[name='company']").val(res.company);
                $("select[name='group_id']").val(res.group_id);
                $("select[name='default']").val(res.default_module);
                $("select[name='group_id']").selectpicker("refresh");
                $("select[name='default']").selectpicker("refresh");
                if(res.sales_person!=null){
                  $("input[name='sales']").attr("checked",true);
                }else{
                  $("input[name='sales']").attr("checked",false);
                }
            });
            
        });
        $(document).on('click',".remove_button",function(){
            var data1=$(this).attr("data");
            $("#remove_id").val(data1);
            $("#remove_action").submit();
            
        });
    })
</script>

</body></html>