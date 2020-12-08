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
<?php $this->load->view('purchasing/header'); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Vendors
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/vendor">Vendor List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/vendor/create">Add New Vendor</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Materials
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/material">Material List</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Purchase Request
            </h4>
            <ul class="Menu-content">
                <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/request">Purchase Request List</a></li>
                <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/request/create">Add New Purchase Request</a></li>
            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Purchase Order
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/orders">Purchase Order List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/orders/create">Add New Purchase Order</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Project
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/joborder">Job Order</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/joborder">DKM</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                SPB
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/spb">SPB List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/spb/create">Add New SPB</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Reports
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/report/monthly">Monthly Report</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>purchasing/report/project">Per Project</a></li>
                            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>


<?php $this->load->view('template/footer'); ?>
</body>
</html>