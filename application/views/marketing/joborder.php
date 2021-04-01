<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MRP </title>
    <?php $this->load->view('template/header_link'); ?>
</head>
<body style="padding-bottom: 30px;">
<?php $this->load->view('marketing/header'); ?>

    <div class="container-fluid" style="min-height: 76.6vh;">
        <div class="header">
            <h5 style="font-weight: bold;">Job Order List</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-3 col-md-offset-9" style="text-align:right;">
                    <a href="<?php echo base_url() ?>marketing/joborder/create"><button class="btn btn-success"><i class="fa fa-plus"></i> Add New Job Order</button></a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped table-bordered" id="table_1" width="100%">
                        <thead>
                            <tr>
                                <td>JO No</td>
                                <td>Customer</td>
                                <td>Project</td>
                                <td>JO Date</td>
                                <td>Quotation Reff</td>
                                <td>JO Type</td>
                                <td>Due Date</td>
                                <td>Status</td>
                                <td>Progress</td>
                                <td>Marketing</td>
                                <td>Remark</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($table as $key => $value) {?>
                                <tr>
                                    <td><?php echo $value->job_number; ?></td>
                                    <td><?php echo $value->customer_name; ?></td>
                                    <td><?php echo $value->project_name; ?></td>
                                    <td><?php echo $value->delivery_date; ?></td>
                                    <td><?php echo $value->qn_number; ?></td>
                                    <td><?php echo $value->order_type; ?></td>
                                    <td><?php echo $value->due_date; ?></td>
                                    <td><?php echo $value->status; ?></td>
                                    <td><?php echo $value->progress; ?></td>
                                    <td><?php echo $value->marketing; ?></td>
                                    <td style='white-space: nowrap'>
                                      <center>
                                        <button class="btn btn-warning print_button" data="<?php echo $value->id; ?>" ><i class="fa fa-print"></i> Print</button>&nbsp;
                                        <?php if($sub_menu_access->edit=="1") {?>
                                        <button class="btn btn-info edit_button" data="<?php echo $value->id; ?>" ><i class="fa fa-edit"></i> Edit</button>
                                        &nbsp;<?php } ?>
                                        <?php if($sub_menu_access->delete=="1") {?>
                                        <button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button>&nbsp;
                                        <?php } ?>
                                        <?php if($sub_menu_access->approve=="1"){ ?><button class="btn btn-success status_button" data-toggle="modal" data-target="#status_modal" data="<?php echo $value->id; ?>" status-data="<?php echo $value->status; ?>"><i class="fa fa-compass"></i> Status</button><?php } ?>
                                        <button class="btn btn-primary log_button" data-toggle="modal" data-target="#log_modal" data="<?php echo $value->job_number; ?>"><i class="fas fa-scroll"></i> Log</button>
                                      </center>
                                    </td>
                                </tr>
                            <?php $i+=1; } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <form action="<?php echo base_url() ?>marketing/joborder/create" method="POST" id="form_edit">
      <input type="hidden" name="id"  />
    </form>
    <form action="<?php echo base_url() ?>marketing/joborder/delete" method="POST" id="form_delete">
      <input type="hidden" name="id"  />
    </form>
    <form action="<?php echo base_url() ?>marketing/joborder/print" target = '_blank' method="POST" id="form_print">
      <input type="hidden" name="id"  />
    </form>
<div class="modal fade" id="status_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="<?php echo base_url() ?>marketing/joborder/status_update" method="POST">
      <div class="modal-body">
        <div class="container">
          <input type="hidden" id="status_id" name="id" />
          <div class="row">
            <div class="form-group">
              <div class="col-md-3">
                Change Status
              </div>
              <div class="col-md-9">
                <div class="col-md-3">
                  <select class="form-control" name="status">
                    <option></option>
                    <option value="Waiting for Approval">Waiting for Approval</option>
                    <option value="on progress">on progress</option>
                    <option value="finished">finished</option>
                    <option value="canceled">canceled</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </form>
    </div>
  </div>
</div>
<div class="modal fade" id="log_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Log Activity</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="tempatlog">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<?php $this->load->view('template/footer'); ?>
<script type="text/javascript">
    var response="<?php echo $_GET['res']??''; ?>";
  if(response=="success"){
    $.toast({
          heading: 'Success',
          text: 'Job Order Created',
          showHideTransition: 'slide',
          icon: 'success',
          position : 'top-right'
      })
  }else if(response=="failed"){
    $.toast({
          heading: 'Error',
          text: 'Job Order Failed to Create',
          showHideTransition: 'slide',
          icon: 'error',
          position : 'top-right'
      })
  }
     $("#table_1").DataTable( {
        "scrollX": true
        });
      $(document).on('click',".print_button",function(){
        var data1=$(this).attr("data");
        $("input[name='id']").val(data1);
        $("#form_print").submit();
     });
     $(document).on('click',".edit_button",function(){
            var data1=$(this).attr("data");
            $("input[name='id']").val(data1);
            $("#form_edit").submit();
        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("input[name='id']").val(data1);
        $("#form_delete").submit();
     });
     $(document).on("click",".status_button",function(){
        var data1=$(this).attr("data");
        var data2=$(this).attr("status-data");
        $("#status_id").val(data1);
        $("select[name='status']").val(data2);
        // $("#status_modal").toggle();
     });
     $(document).on("click",".log_button",function(){
       var data1=$(this).attr("data");
        $.ajax({
            url: '<?php echo base_url() ?>marketing/job_log',
            type: 'POST',
            data: {data1: data1},
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
            var text="";
              text+="<table class='table-bordered table-striped table'><thead><tr><td>User</td><td>Activity</td><td>Date and Time</td></thead><tbody>";
            for (var i = 0; i < res.data.length; i++) {
              text+="<tr>";
              text+="<td>";
              text+=res.data[i].username;
              text+="</td>";
              text+="<td>";
              text+=res.data[i].desc;
              text+="</td>";
              text+="<td>";
              text+=res.data[i].date;
              text+="</td>";
              text+"</tr>";
            }
            text+="</tbody></table>";
            $("#tempatlog").html(text);
        });
      });
</script>
</body>
</html>