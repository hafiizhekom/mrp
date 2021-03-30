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
            <h5 style="font-weight: bold;">Delivery List</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-3 col-md-offset-9" style="text-align:right;">
                    <a href="<?php echo base_url() ?>marketing/delivery/create"><button class="btn btn-success"><i class="fa fa-plus"></i> Add New Delivery</button></a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped table-bordered" id="table_1" width="100%">
                        <thead>
                            <tr>
                                <td>#</td>
                                <td>Customer</td>
                                <td>JO No</td>
                                <td>Delivery List No</td>
                                <td>Date</td>
                                <td>Project</td>
                                <td>Customer PO No</td>
                                <td>Delivery List No</td>
                                <td>Packing No</td>
                                <td>Date</td>
                                <td>Action</td>
                            </tr>
                        </thead>
                        <tbody>
                            
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
</script>
</body>
</html>