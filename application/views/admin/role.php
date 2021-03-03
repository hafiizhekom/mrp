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
            <h5 style="font-weight: bold;">Role and Permission</h5>
        </div>
        <div class="body">
            <div class="col-md-3">
                <div class="wrapper">
                    <form action="<?php echo base_url() ?>admin/role_add" method="POST" >
                        <input type="hidden" name="id" value="" />
                    <div class="box">
                        <div class="box-header">
                            <h5>Role and permission Information</h5>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Code</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="code">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Name</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="name">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="box-header">
                            <h5>File and Document Access</h5>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <select class="selectpicker form-control" data-live-search="true" name="file_type[]" multiple>
                                                <option selected></option>
                                                <?php foreach ($document as $key => $value) {?>
                                                    <option value="<?php echo $value->file_type; ?>"><?php echo $value->file_type; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-info btn-xs">Save</button>
                    </div>
                </form>
                </div>
                
            </div>
            <div class="col-md-9">
                <table class="table table-striped table-bordered" id="table_1" width="100%">
                    <thead>
                        <tr>
                            <td>#</td>
                            <td>Role</td>
                            <td>Code</td>
                            <td>Active</td>
                            <td>Documents</td>
                            <td>Remark</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $i=1; foreach ($group_header as $key => $value) {?>
                            <tr>
                                <td><?php echo $i; ?></td>
                                <td><?php echo $value->name; ?></td>
                                <td><?php echo $value->code; ?></td>
                                <td>Active</td>
                                <td><ul><?php foreach ($group_detail as $key2 => $value2) {
                                    if($value->id==$value2->user_group_id){
                                        echo "<li>".$value2->document_access."</li>";
                                    }
                                } ?></ul></td>
                                <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>"><i class="fa fa-edit"></i> Edit</button>&nbsp;<button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button>&nbsp;<button class="btn btn-success permission_button" data="<?php echo $value->id; ?>"><i class="fa fa-users"></i> Permission</button></center></td>
                            </tr>
                        <?php $i+=1; } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<form action="<?php echo base_url() ?>admin/role_delete" id="remove_form" method="POST">
    <input type="hidden" id="id_delete" name="id_delete" value=""/>
</form>
<form action="<?php echo base_url() ?>admin/permission" id="permission_form" method="POST">
    <input type="hidden" id="id_permission" name="id" value=""/>
</form>
<?php $this->load->view('template/footer'); ?>
<script type="text/javascript">
    $(document).ready(function(){
    var response="<?php echo $_GET['res']??''; ?>";
    if(response=="success"){
      $.toast({
            heading: 'Success',
            text: 'Permission Changes Succesfully',
            showHideTransition: 'slide',
            icon: 'success',
            position : 'top-right'
        })
    }else if(response=="failed"){
      $.toast({
            heading: 'Error',
            text: 'Permission Changes Failed',
            showHideTransition: 'slide',
            icon: 'error',
            position : 'top-right'
        })
    }
  })
     $("#table_1").DataTable( {
        "scrollX": true
        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("#id_delete").val(data1);
        $("#remove_form").submit();
     });
     $(document).on('click',".permission_button",function(){
        var data1=$(this).attr("data");
        $("#id_permission").val(data1);
        $("#permission_form").submit();
     });
     $(document).on('click',".edit_button",function(){
            var data1=$(this).attr("data");
            $.ajax({
                url: '<?php echo base_url() ?>admin/role_select',
                type: 'POST',
                data: {id: data1},
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
                console.log(res);
                $("input[name='id']").val(res.group_header.id);
                $("input[name='code']").val(res.group_header.code);
                $("input[name='level']").val(res.group_header.level);
                $("input[name='name']").val(res.group_header.name);
                var kotak=[];
                for (var i = 0; i < res.group_detail.length; i++) {
                    kotak.push(res.group_detail[i].document_access);
                }
                $("select[name='file_type[]']").selectpicker('val', kotak);
                
            });
            
        });
</script>
</body>
</html>