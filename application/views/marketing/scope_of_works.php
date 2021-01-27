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
            <h5 style="font-weight: bold;">Scope of Works</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-12">
                    <div class="wrapper">
                        <form action="<?php echo base_url() ?>marketing/sow/add" method="POST" >
                            <input type="hidden" name="id" value="" />
                        <div class="box">
                            <!-- <div class="box-header">
                                <h5>User Information</h5>
                            </div> -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Scope of Works Type</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="type" required>
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
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Kick of Meeting Linked To</label>
                                            <div class="col-md-9">
                                                <select class="selectpicker form-control" data-live-search="true" name="kom" >
                                                    <option selected disabled>Please Select</option>
                                                    <option value="MOM">MOM</option>
                                                    <option value="DKM">DKM</option>
                                                    <option value="Drawing">Drawing</option>
                                                    <option value="Fabrication Finish">Fabrication Finish</option>
                                                    <option value="Install Finish">Install Finish</option>
                                                    <option value="Delivery/Packing">Delivery/Packing</option>
                                                    <option value="Tehnical Specification">Tehnical Specification</option>
                                                    <option value="Request for Quotation">Request for Quotation</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Order</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="order">
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
                                <td>Scope of Works</td>
                                <td>Description</td>
                                <td>Linked to Kom</td>
                                <td>Order</td>
                                <td>Remark</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($table as $key => $value) {?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td><?php echo $value->type; ?></td>
                                    <td><?php echo $value->desc; ?></td>
                                    <td><?php echo $value->kickoff_meeting; ?></td>
                                    <td><?php echo $value->order; ?></td>
                                    <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>" data-type="<?php echo $value->type; ?>" desc="<?php echo $value->desc; ?>" kom="<?php echo $value->kickoff_meeting; ?>" order="<?php echo $value->order; ?>"><i class="fa fa-edit"></i> Edit</button><button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button></center></td>
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
            $("input[name='type']").val($(this).attr("data-type"));
            $("select[name='kom']").val($(this).attr("kom"));
            $("select[name='kom']").selectpicker("refresh");
            $("input[name='desc']").val($(this).attr("desc"));
            $("input[name='order']").val($(this).attr("order"));
            
        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("input[name='id']").val(data1);
        $("form").attr("action","<?php echo base_url() ?>marketing/sow/delete");
        $("form").submit();
     });
</script>
</body>
</html>