<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MRP </title>
    <?php $this->load->view('template/header_link'); ?>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-6">
                            <img src="<?php echo base_url() ?>images/login.png" alt="" width="200">
                        </div>
                        <div class="col-md-6">
                            <img src="<?php echo base_url() ?>images/logo.png" alt="">
                            <h4>PT Buana Masa Metalindo</h4>

                            <form class="form-horizontal" role="form" method="POST" action="<?php echo base_url() ?>login/check">

                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-sm" placeholder="Username"
                                               name="username" value="">

                                                                            </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="password" class="form-control input-sm" name="password"
                                               placeholder="Password">

                                                                            </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class="fa fa-btn fa-sign-in"></i>Login
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <p style="font-size: 8pt;margin-top: 15px;">Use a valid username and password to gain
                                access, or leave this page immediately if you do not have the privillege.</p>

                            <p style="font-size: 8pt;">In case you lost your access, contact the <a href="#">System
                                    Administrator</a> in charge.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script src="<?php echo base_url() ?>script/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="<?php echo base_url() ?>script/menu.js"></script>
<script src="<?php echo base_url() ?>script/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<?php echo base_url() ?>plugin/datatable/datatables.min.js"></script>
<script type="text/javascript" src="<?php echo base_url() ?>plugin/selectpicker/js/bootstrap-select.js"></script>
<script src="<?php echo base_url() ?>script/crypto.js"></script>
<script type="text/javascript" src="<?php echo base_url() ?>plugin/toast/jquery.toast.min.js"></script>
<script>
var response="<?php echo $_GET['res']??''; ?>";
  if(response=="success"){
    $.toast({
          heading: 'Success',
          text: 'Successfuly Login',
          showHideTransition: 'slide',
          icon: 'success',
          position : 'middle'
      })
  }else if(response=="failed"){
    $.toast({
          heading: 'Error',
          text: 'Password Not Correct',
          showHideTransition: 'slide',
          icon: 'error',
          position : 'top-center'
      })
  }
</script>
</body>
</html>