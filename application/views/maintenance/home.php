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
<?php $this->load->view('maintenance/header'); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Equipments &amp; Inventories
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>maintenance/equipment/type">Equipment Types</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>maintenance/equipment/group">Equipment Group</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>maintenance/equipment">Equipment Lists</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>maintenance/equipment/create">Add New Equipment</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Transactions
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>maintenance/transaction">Transaction Lists</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>maintenance/transaction/create">Add New Transaction</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Reports
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>maintenance/reports">Reports</a></li>
                            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
</body>
</html>