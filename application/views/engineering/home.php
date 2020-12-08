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
<?php $this->load->view('engineering/header'); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Bill of Quantity
                        </h4>
                        <ul class="Menu-content">
                                <li class="Menu-submenu"><a href="<?php echo base_url(); ?>engineering/boq">Bill of Quantity List</a></li>
                                <li class="Menu-submenu"><a href="<?php echo base_url(); ?>engineering/boq/create">Add New Bill of Quantity</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="Menu">
                        <h4 class="Menu-name">
                            Master Part
                        </h4>
                        <ul class="Menu-content">
                                                <li class="Menu-submenu"><a href="<?php echo base_url() ?>engineering/master">Master Part List</a></li>
                                                <li class="Menu-submenu"><a href="<?php echo base_url() ?>engineering/master/create">Add New Master Part</a></li>
                                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
</body>
</html>