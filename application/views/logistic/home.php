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
<?php $this->load->view('logistic/header',$data); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
             <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Master Consumable"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Master Consumable
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Master Consumable"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Inventory"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Inventory
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Inventory"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
            foreach ($sub_menu as $key => $value) {
                if($value->menu=="Project"){
                    $header=true;
                }
            }
            if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Project
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Project"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
            foreach ($sub_menu as $key => $value) {
                if($value->menu=="Stock Opname"){
                    $header=true;
                }
            }
            if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Stock Opname
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Stock Opname"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
            foreach ($sub_menu as $key => $value) {
                if($value->menu=="Request Consumable"){
                    $header=true;
                }
            }
            if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Request Consumable
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Request Consumable"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
            foreach ($sub_menu as $key => $value) {
                if($value->menu=="Reports"){
                    $header=true;
                }
            }
            if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Reports
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Reports"){?>
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