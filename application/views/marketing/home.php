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
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Master"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Master
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Master"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Quotation"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Quotation
                        </h4>
                        <ul class="Menu-content">
                           <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Quotation"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Job Order"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Job Order
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Job Order"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Projects"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Projects
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Projects"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Kickoff Meeting"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Kickoff Meeting
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Kickoff Meeting"){?>
                                <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                            <?php } } ?>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Delivery Order"){
                        $header=true;
                    }
                }
                if($header==true){?>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Delivery Order
                        </h4>
                        <ul class="Menu-content">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Delivery Order"){?>
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