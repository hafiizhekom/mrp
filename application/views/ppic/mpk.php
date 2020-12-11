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
            <h5 style="font-weight: bold;">MPK List</h5>
        </div>
        <div class="body">
            <div class="col-md-3 col-md-offset-9" style="text-align:right;">
                <a href="<?php echo base_url() ?>ppc/mpk/create"><button class="btn btn-success"><i class="fa fa-plus"></i> Add New MPK</button></a>
            </div>
            <div class="col-md-12">
                <table class="table table-striped table-bordered" id="table_1" width="100%">
                    <thead>
                        <tr>
                            <td>#</td>
                            <td>Customer</td>
                            <td>Project</td>
                            <td>Jo No</td>
                            <td>Boq No</td>
                            <td>MPK No</td>
                            <td>Date</td>
                            <td>DKM No</td>
                            <td>Revision No</td>
                            <td>Revision Date</td>
                            <td>Remark</td>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<form action="<?php echo base_url() ?>ppc/dkm/delete" id="remove_form" method="POST">
    <input type="hidden" id="id_delete" name="id" value=""/>
</form>
<form action="<?php echo base_url() ?>ppc/dkm/create" id="edit_form" method="POST">
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