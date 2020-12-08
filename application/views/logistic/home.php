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
<?php $this->load->view('logistic/header'); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Master Consumable
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/consumable">Master Consumable</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Inventory
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/inventory">Stock Consumable</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/consumable/input">Penerimaan Consumable</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/consumable/output">Pengambilan Consumable</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/consumable/history">Transaction Records</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Project
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/joborder">Job Orders</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>ppc/dkm">DKM</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Stock Opname
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/opname">Stock Opname Lists</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/opname/create">Add New Stock Opname</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Request Consumable
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/request">Request Consumable List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/request/create">Add New Request Consumable</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Reports
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/report/monthly/input">Penerimaan Consumable</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/report/monthly/output">Pengeluaran Consumable</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/report/project">Per Project</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>logistic/report/monthly/stock">Stock Opname</a></li>
                            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>


<?php $this->load->view('template/footer'); ?>
</body>
</html>