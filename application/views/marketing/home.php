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
                <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Master
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/customer">Customer List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/customer/create">Add New Customer</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/sot">Sales Order Types</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/sow">Scope of Works</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/kom">Kick Off Meeting Template</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Quotation
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/quotation">Quotation List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/quotation/create">Add New Quotation</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/document">BQ and Documents</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Job Order
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/joborder">Job Orders List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/joborder/create">Add New Job Order</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/document">Job Order Documents</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Projects
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/project">Project List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/project/create">Add New Project</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Kickoff Meeting
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/kom">Kickoff Meeting Lists</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/kom/create">Add Kickoff Meeting</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Delivery Order
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/delivery">Delivery Order List</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/delivery/create">Add New Delivery Order</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Reports
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/joborder/report/create">Add Yearly Target</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>marketing/joborder/report">Yearly Report</a></li>
                            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>
</body>
</html>