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

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                 <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Schedule & Progress"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Schedule &amp; Progress
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Schedule & Progress"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Material Requirement (DKM)"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Material Requirement (DKM)
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Material Requirement (DKM)"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="MPK"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            MPK
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="MPK"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Packing Lists"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Packing Lists
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Packing Lists"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php  } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Monitoring Progress"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Monitoring Progress
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Monitoring Progress"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
</body>
</html>