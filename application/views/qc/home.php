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
<?php $data = array('sub_menu' => $sub_menu); ?>
<?php $this->load->view('qc/header',$data); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <?php $header=false;
                    foreach ($sub_menu as $key => $value) {
                        if($value->menu=="Inspection and Testplan"){
                            $header=true;
                        }
                    }
                    if($header==true){?>
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Inspection and Test Plan
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Inspection and Testplan"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                <?php } ?>
                </div>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>

</body>
</html>