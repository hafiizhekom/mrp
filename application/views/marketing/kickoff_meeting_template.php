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
<?php $this->load->view('admin/header'); ?>

    <div class="container-fluid" style="min-height: 76.6vh;">
        <div class="header">
            <h5 style="font-weight: bold;">Kick Off Meeting Template</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-12">
                    <div class="wrapper">
                        <form action="<?php echo base_url() ?>marketing/kom/add" method="POST" >
                            <input type="hidden" name="id" value="" />
                        <div class="box">
                            <!-- <div class="box-header">
                                <h5>User Information</h5>
                            </div> -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Group</label>
                                            <div class="col-md-9">
                                                <select class="selectpicker form-control" data-live-search="true" name="group" >
                                                    <option selected></option>
                                                    <?php foreach ($group as $key => $value) {?>
                                                        <option value="<?php echo $value->name; ?>"><?php echo $value->name; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Parent Item</label>
                                            <div class="col-md-9">
                                                <select class="selectpicker form-control" data-live-search="true" name="parent" >
                                                    <option selected></option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Item</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="item">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Order</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="item">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Header</label>
                                            <div class="col-md-1">
                                                <input type="checkbox" value="1" name="header">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Published</label>
                                            <div class="col-md-1">
                                                <input type="checkbox" value="1" name="published">
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
                <div class="col-md-12">
                    <table class="table table-striped table-bordered" id="table_1" width="100%">
                        <thead>
                            <tr>
                                <td>No</td>
                                <td>Item</td>
                                <td>Group</td>
                                <td>Header</td>
                                <td>Menu level</td>
                                <td>Order</td>
                                <td>Published</td>
                                <td>Re-order</td>
                                <td>Parent Menu</td>
                                <td>Remark</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($table as $key => $value) {?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td><?php echo $value->item; ?></td>
                                    <td><?php echo $value->group_id; ?></td>
                                    <td><?php echo $value->header; ?></td>
                                    <td>menu level</td>
                                    <td><?php echo $value->order; ?></td>
                                    <td><?php echo $value->published; ?></td>
                                    <td>reoder</td>
                                    <td><?php echo $value->parent_item; ?></td>
                                    <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>" po="<?php echo $value->po_type; ?>" desc="<?php echo $value->desc; ?>"><i class="fa fa-edit"></i> Edit</button><button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button></center></td>
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
            $("input[name='po']").val($(this).attr("po"));
            $("input[name='desc']").val($(this).attr("desc"));
            
        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("input[name='id']").val(data1);
        $("form").attr("action","<?php echo base_url() ?>marketing/sot/delete");
        $("form").submit();
     });
</script>
</body>
</html>