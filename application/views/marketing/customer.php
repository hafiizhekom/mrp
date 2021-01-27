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
            <h5 style="font-weight: bold;">Customers</h5>
        </div>
        <div class="body">
            <div class="col-md-3 col-md-offset-9" style="text-align:right;">
                <a href="<?php echo base_url() ?>marketing/customer/create"><button class="btn btn-success"><i class="fa fa-plus"></i> Add New Customer</button></a>
            </div>
            <div class="col-md-12">
                <table class="table table-striped table-bordered" id="table_1" width="100%">
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>Code</td>
                            <td>Name</td>
                            <td>Phone</td>
                            <td>Fax</td>
                            <td>Email</td>
                            <td>NPWP</td>
                            <td>TKIP</td>
                            <td>Contacts</td>
                            <td>Remark</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($table as $key => $value) {?>
                           <tr>
                               <td><?php echo $value->id ?></td>
                               <td><?php echo $value->code ?></td>
                               <td><?php echo $value->name ?></td>
                               <td><?php echo $value->phone ?></td>
                               <td><?php echo $value->fax ?></td>
                               <td><?php echo $value->email ?></td>
                               <td><?php echo $value->npwp ?></td>
                               <td><?php echo $value->tkip ?></td>
                               <td><ul><?php foreach ($contact as $key2 => $value2) {
                                   if($value->id==$value2->customer_id){
                                    echo "<li>".$value2->name."</li>";
                                   }
                               } ?></ul></td>
                               <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>"><i class="fa fa-edit"></i> Edit</button><button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button></center></td>
                           </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<form action="<?php echo base_url() ?>marketing/customer/delete" id="remove_form" method="POST">
    <input type="hidden" id="id_delete" name="id" value=""/>
</form>
<form action="<?php echo base_url() ?>marketing/customer/edit" id="edit_form" method="POST">
    <input type="hidden" id="id_edit" name="id" value=""/>
</form>
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
        $("#id_edit").val(data1);
        $("#edit_form").submit();
     });
</script>
</body>
</html>