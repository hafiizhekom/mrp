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
<?php $this->load->view('admin/header'); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                User
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>admin/role">User Group</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>admin/user">User Account</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Database
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/import">Import Data</a></li>
                            </ul>
        </div>
    </div>
    <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Master Data
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/general">General Setting</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/currency">Currency</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/part">Part Types</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/uom">Unit of Measurements</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/numbering">Document Numbering</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/pic">PIC</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/product">Product</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/destination">Destination</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>admin/document">Document Type</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url()?>admin/warehouse">Warehouse Location</a></li>
                            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>

</body>
</html>