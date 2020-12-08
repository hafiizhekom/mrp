<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MRP </title>
    <link href="<?php echo base_url() ?>css/app.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo base_url() ?>plugin/fontawesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>plugin/datatable/datatables.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>plugin/selectpicker/css/bootstrap-select.css"/>
</head>
<body style="padding-bottom: 30px;">
<?php $this->load->view('admin/header'); ?>

    <div class="container-fluid" style="min-height: 76.6vh;">
        <div class="header">
            <h5 style="font-weight: bold;">UNIT OF MEASUREMENT</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-12">
                    <div class="wrapper">
                        <form action="<?php echo base_url() ?>admin/uom_add" method="POST" >
                            <input type="hidden" name="id" value="" />
                        <div class="box">
                            <!-- <div class="box-header">
                                <h5>User Information</h5>
                            </div> -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Code</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="code" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Description</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="desc">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-info btn-xs">Save</button>
                            <button type="reset" class="btn btn-warning btn-xs">Reset</button>
                        </div>
                    </form>
                    </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped table-bordered" id="table_1" width="100%">
                        <thead>
                            <tr>
                                <td>No</td>
                                <td>Code</td>
                                <td>Description</td>
                                <td>Remark</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($table as $key => $value) {?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td><?php echo $value->code; ?></td>
                                    <td><?php echo $value->desc; ?></td>
                                    <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>" code="<?php echo $value->code; ?>" desc="<?php echo $value->desc; ?>"><i class="fa fa-edit"></i> Edit</button><button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button></center></td>
                                </tr>
                            <?php $i+=1; } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<?php $this->load->view('template/footer'); ?>
<script type="text/javascript">
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
            $("input[name='id']").val(data1);
            $("input[name='code']").val($(this).attr("code"));
            $("input[name='desc']").val($(this).attr("desc"));
            
        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("input[name='id']").val(data1);
        $("form").submit();
     });
</script>
</body>
</html>