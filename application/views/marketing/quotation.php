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
            <h5 style="font-weight: bold;">Quotation List</h5>
        </div>
        <div class="body">
            <div class="row">
                <div class="col-md-3 col-md-offset-9" style="text-align:right;">
                    <a href="<?php echo base_url() ?>marketing/quotation/create"><button class="btn btn-success"><i class="fa fa-plus"></i> Add New Quotation</button></a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped table-bordered" id="table_1" width="100%">
                        <thead>
                            <tr>
                                <td>#</td>
                                <td>Quo. No</td>
                                <td>Customer</td>
                                <td>Project</td>
                                <td>Date</td>
                                <td>Revision Date</td>
                                <td>Order Type</td>
                                <td>Value(Before VAT)</td>
                                <td>Due Date</td>
                                <td>Status</td>
                                <td>Marketing</td>
                                <td>Remark</td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($table as $key => $value) {?>
                                <tr>
                                    <td><?php echo $i; ?></td>
                                    <td><?php echo $value->qn_number; ?></td>
                                    <td><?php echo $value->customer_name; ?></td>
                                    <td><?php echo $value->project_name; ?></td>
                                    <td><?php echo $value->qn_date; ?></td>
                                    <td><?php echo $value->rev_date; ?></td>
                                    <td><?php echo $value->order_type; ?></td>
                                    <td><?php echo $value->before_vat; ?></td>
                                    <td><?php echo $value->due_date; ?></td>
                                    <td><?php echo $value->status; ?></td>
                                    <td><?php echo $value->marketing; ?></td>
                                    <td style='white-space: nowrap'><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>" ><i class="fa fa-edit"></i> Edit</button>&nbsp;<button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button></center></td>
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
    var response="<?php echo $_GET['res']??''; ?>";
  if(response=="success"){
    $.toast({
          heading: 'Success',
          text: 'Quotation Created',
          showHideTransition: 'slide',
          icon: 'success',
          position : 'top-right'
      })
  }else if(response=="failed"){
    $.toast({
          heading: 'Error',
          text: 'Quotation Failed to Create',
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