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
<?php $this->load->view('maintenance/header',$data); ?>

<div class="container-fluid">
    <div class="container">
        <div class="row">
            <?php $menu_name=false;
            foreach ($sub_menu as $key => $value) {
                if($value->menu=="Equipment & Inventories"){
                    $menu_name=true;
                }
            }
            if($menu_name==true){
            ?>
            <div class="col-md-4">
                <div class="Menu">
                    <h4 class="Menu-name">
                        Equipments &amp; Inventories
                    </h4>
                    <ul class="Menu-content">
                        <?php foreach ($sub_menu as $key => $value) {
                            if($value->menu=="Equipment & Inventories"){?>
                            <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                        <?php } } ?>
                    </ul>
                </div>
            </div>
        <?php } ?>
        <?php $menu_name=false;
            foreach ($sub_menu as $key => $value) {
                if($value->menu=="Transactions"){
                    $menu_name=true;
                }
            }
            if($menu_name==true){
            ?>
            <div class="col-md-4">
                <div class="Menu">
                    <h4 class="Menu-name">
                        Transactions
                    </h4>
                    <ul class="Menu-content">
                        <?php foreach ($sub_menu as $key => $value) {
                            if($value->menu=="Transactions"){?>
                            <li class="Menu-submenu"><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                        <?php } } ?>
                    </ul>
                </div>
            </div>
        <?php } ?>
        <?php $menu_name=false;
            foreach ($sub_menu as $key => $value) {
                if($value->menu=="Reports"){
                    $menu_name=true;
                }
            }
            if($menu_name==true){
            ?>
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