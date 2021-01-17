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
<?php $this->load->view('admin/header',$data); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                <div class="Menu">
            <?php $header_user=false; 
            foreach ($sub_menu as $key => $value) {
            if($value->sub_menu=="User Group"||$value->sub_menu=="User Account"){ 
                $header_user=true;
            } } 

            if($header_user==true){?>
            <h4 class="Menu-name">
            User
            </h4>
            <?php }?>
            <ul class="Menu-content">
                <?php foreach ($sub_menu as $key => $value) {
                    if($value->sub_menu=="User Group"){ ?>
                        <li class="Menu-submenu"><a href="<?php echo base_url() ?>admin/role">User Group</a></li>
                <?php } } ?>
                <?php foreach ($sub_menu as $key => $value) {
                    if($value->sub_menu=="User Account"){ ?>
                        <li class="Menu-submenu"><a href="<?php echo base_url() ?>admin/user">User Account</a></li>
                <?php } } ?>
                
            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <?php foreach ($sub_menu as $key => $value) {
                if($value->sub_menu=="Import Data"){ ?>
                    <h4 class="Menu-name">
                        Database
                    </h4>
                    <ul class="Menu-content">
                        <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/import">Import Data</a></li>
                    </ul>
            <?php } } ?>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <?php $header_user=false; 
            foreach ($sub_menu as $key => $value) {
            if($value->sub_menu=="General Setting"||$value->sub_menu=="Currency"||$value->sub_menu=="Part types"||$value->sub_menu=="Unit of Measurements"||$value->sub_menu=="Document Numbering"||$value->sub_menu=="PIC"||$value->sub_menu=="Product"||$value->sub_menu=="Destination"||$value->sub_menu=="Document Type"||$value->sub_menu=="Warehouse Location"){ 
                $header_user=true;
            } } 

            if($header_user==true){?>
            <h4 class="Menu-name">
            Master Data
            </h4>
            <?php }?>
            <ul class="Menu-content">
                <?php foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Master Data"){?>
                        <li class="Menu-submenu"><a href="<?php echo base_url()?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                    <?php }
                } ?>
               
            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>

</body>
</html>