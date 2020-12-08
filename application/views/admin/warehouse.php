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
            <h5 style="font-weight: bold;">MASTER WAREHOUSE</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-12">
                    <div class="wrapper">
                        <form action="<?php echo base_url() ?>admin/warehouse_add" method="POST" >
                            <input type="hidden" name="id" value="" />
                        <div class="box">
                            <!-- <div class="box-header">
                                <h5>User Information</h5>
                            </div> -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
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
                                                <label class="control-label col-md-2">Name</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Address</label>
                                                <div class="col-md-9">
                                                    <textarea class="form-control" name="address"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Phone</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="phone">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Fax</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="fax" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Email</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="email">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Note</label>
                                                <div class="col-md-9">
                                                    <textarea class="form-control" name="note"></textarea>
                                                </div>
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
                                <td>Name</td>
                                <td>Address</td>
                                <td>Phone</td>
                                <td>Fax</td>
                                <td>Email</td>
                                <td>Note</td>
                                <td>Remark</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($table as $key => $value) {?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td><?php echo $value->code; ?></td>
                                    <td><?php echo $value->name; ?></td>
                                    <td><?php echo $value->address; ?></td>
                                    <td><?php echo $value->phone; ?></td>
                                    <td><?php echo $value->fax; ?></td>
                                    <td><?php echo $value->email; ?></td>
                                    <td><?php echo $value->note; ?></td>
                                    <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>" code="<?php echo $value->code; ?>" name="<?php echo $value->name; ?>" address="<?php echo $value->address; ?>" phone="<?php echo $value->phone; ?>" fax="<?php echo $value->fax; ?>" email="<?php echo $value->email; ?>" note="<?php echo $value->note; ?>"><i class="fa fa-edit"></i> Edit</button><button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button></center></td>
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
     $(document).on('click',".edit_button",function(){
            var data1=$(this).attr("data");
            $("input[name='id']").val(data1);
            $("input[name='code']").val($(this).attr("code"));
            $("input[name='name']").val($(this).attr("name"));
            $("textarea[name='address']").val($(this).attr("address"));
            $("input[name='phone']").val($(this).attr("phone"));
            $("input[name='fax']").val($(this).attr("fax"));
            $("input[name='email']").val($(this).attr("email"));
            $("textarea[name='note']").val($(this).attr("note"));

        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("input[name='id']").val(data1);
        $("form").submit();
     });
</script>
</body>
</html>