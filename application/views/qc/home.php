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
<?php $this->load->view('qc/header'); ?>

    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
        <div class="Menu">
            <h4 class="Menu-name">
                Inspection and Test Plan
            </h4>
            <ul class="Menu-content">
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>qc/inspection">Inspection &amp; Test Plan Lists</a></li>
                                    <li class="Menu-submenu"><a href="<?php echo base_url() ?>qc/inspection/create">Add New Inspection &amp; Test Plan</a></li>
                            </ul>
        </div>
    </div>
            </div>
        </div>
    </div>

<?php $this->load->view('template/footer'); ?>

</body>
</html>