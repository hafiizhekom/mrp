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
<?php $this->load->view('ppic/header'); ?>

    <div class="container-fluid" style="min-height: 76.6vh;">
        <div class="header">
            <h5 style="font-weight: bold;">Schedule List</h5>
        </div>
        <div class="body">
            <div class="col-md-3 col-md-offset-9" style="text-align:right;">
                <a href="<?php echo base_url() ?>ppc/schedule/create"><button class="btn btn-success"><i class="fa fa-plus"></i> Add New Schedule</button></a>
            </div>
            <div class="col-md-12">
                <table class="table table-striped table-bordered" id="table_1" width="100%">
                    <thead>
                        <tr>
                            <td>Jo Number</td>
                            <td>Customer</td>
                            <td>Project</td>
                            <td>Period Start</td>
                            <td>Period End</td>
                            <td>Creator</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($table as $key => $value) {?>
                            <tr>
                                <td><?php echo $value->job_number??"" ?></td>
                                <td><?php echo $value->customer??"" ?></td>
                                <td><?php echo $value->project??"" ?></td>
                                <td><?php echo $value->period_start??"" ?></td>
                                <td><?php echo $value->period_end??"" ?></td>
                                <td><?php echo $value->creator??"" ?></td>
                                <td>
                                    <center>
                                    <?php if($sub_menu_access->edit=="1") {?>
                                    <button class="btn btn-info edit_button" data="<?php echo $value->id; ?>" ><i class="fa fa-edit"></i> Edit</button>
                                    &nbsp;<?php } ?>
                                    <?php if($sub_menu_access->delete=="1") {?>
                                    <button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button>&nbsp;
                                    <?php } ?>
                                    </center>
                                </td>
                            </tr>
                        <?php } ?>
                        
                        
                        <!-- <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>"><i class="fa fa-edit"></i> Edit</button>&nbsp;<button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button>&nbsp;<button class="btn btn-success permission_button" data="<?php echo $value->id; ?>"><i class="fa fa-users"></i> Permission</button></center></td> -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<form action="<?php echo base_url() ?>ppc/schedule/delete" id="remove_form" method="POST">
    <input type="hidden" id="id_delete" name="id" value=""/>
</form>
<form action="<?php echo base_url() ?>ppc/schedule/create" id="edit_form" method="POST">
    <input type="hidden" id="id_edit" name="id" value=""/>
</form>
<?php $this->load->view('template/footer'); ?>
<script type="text/javascript">
     var response="<?php echo $_GET['res']??''; ?>";
      if(response=="success"){
        $.toast({
              heading: 'Success',
              text: 'Schedule Created',
              showHideTransition: 'slide',
              icon: 'success',
              position : 'top-right'
          })
      }else if(response=="failed"){
        $.toast({
              heading: 'Error',
              text: 'Schedule Failed to Create',
              showHideTransition: 'slide',
              icon: 'error',
              position : 'top-right'
          })
      }
     $("#table_1").DataTable( {
        "scrollX": true
        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("#id_delete").val(data1);
        $("#remove_form").submit();
     });
     
     $(document).on('click',".edit_button",function(){
        var data1=$(this).attr("data");
        $("#id_edit").val(data1);
        $("#edit_form").submit();
    });
</script>
</body>
</html>