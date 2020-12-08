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
    <style>
        button{
            font-size:9pt!important;
        }
    </style>
</head>
<body style="padding-bottom: 30px;">
<?php $this->load->view('admin/header'); ?>

    <div class="container-fluid" style="min-height: 76.6vh;">
        <div class="header">
            <h5 style="font-weight: bold;">Document Type</h5>
        </div>
        <div class="body">
            <div class="col-md-4">
                <form action="<?php echo base_url() ?>admin/document_add" method="POST">
                    <input type="hidden" name="id" value=""/>
                <div class="wrapper">
                    <div class="box">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">File Type</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="file">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-info btn-xs">Save</button>
                    </div>
                </div>
                </form>
            </div>
            <div class="col-md-8">
                <table class="table table-striped table-bordered" id="table_1" width="100%" style="font-size:9pt;">
                    <thead>
                        <tr>
                            <td>File/Document Type</td>
                            <td>Remark</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($document_table as $key => $value) {?>
                            <tr>
                                <td><?php echo $value->file_type; ?></td>
                                <td><center><button class="btn btn-info edit_button" data="<?php echo $value->id; ?>"><i class="fa fa-edit"></i> Edit</button><button class="btn btn-danger remove_button" data="<?php echo $value->id; ?>"><i class="fa fa-trash"></i> Delete</button></center></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<form id="remove_form" action="<?php echo base_url() ?>admin/document_remove" method="POST">
    <input type="hidden" name="id" value=""/>
</form>
<footer class="navbar-fixed-bottom" style="z-index: 1;">
    <h6 class="pull-left">MRP-LITE
                    | Copyright &copy; PT. DIAN INNOVATIVE SOLUSINDO.
            </h6>
    <div class="clearfix visible-xs"></div>
    <div class="footer-menu">
        <ul>
            <li><a href="http://mrp.codebalt.com/marketing">HOME</a></li>
            <li><a href="#">HELP</a></li>
            <li><a href="http://mrp.codebalt.com/change-password">CHANGE PASSWORD</a></li>
            <li><a href="http://mrp.codebalt.com/logout">LOGOUT</a></li>
        </ul>
    </div>
</footer>
<script src="<?php echo base_url() ?>script/jquery.js" type="text/javascript"></script>
<script src="<?php echo base_url() ?>script/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<?php echo base_url() ?>plugin/datatable/datatables.min.js"></script>
<script type="text/javascript" src="<?php echo base_url() ?>plugin/selectpicker/js/bootstrap-select.js"></script>
<script src="<?php echo base_url() ?>script/crypto.js"></script>
<script type="text/javascript">
     $("#table_1").DataTable( {
        "scrollX": true
        });
     $(document).on('click',".remove_button",function(){
        var data1=$(this).attr("data");
        $("input[name='id']").val(data1);
        $("#remove_form").submit();
     });
     $(document).on('click',".edit_button",function(){
            var data1=$(this).attr("data");
            $.ajax({
                url: '<?php echo base_url() ?>admin/document_select',
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
                $("input[name='id']").val(res.id);
                $("input[name='file']").val(res.file_type);
                
            });
            
        });
</script>
</body>
</html>