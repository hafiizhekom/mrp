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
<nav class="navbar navbar-default navbar-custom">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#modules" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?php echo base_url()?>">
                <img alt="Brand" src="<?php echo base_url() ?>images/logo.png">
            </a>
        </div>
        <div class="navbar-text navbar-right">
            <div class="btn-group" role="group" aria-label="...">
                <a href="<?php echo base_url() ?>marketing" class="btn btn-default" type="button">Admin</a>
                <a href="<?php echo base_url() ?>marketing" class="btn btn-default" type="button">HOME</a>
                <a href="<?php echo base_url() ?>change-language" class="btn btn-default" type="button"
                   title="Change report language to EN">LANG: ID</a>
                <a href="<?php echo base_url() ?>change-password" class="btn btn-default" type="button">CHANGE PASSWORD</a>
                <a href="<?php echo base_url() ?>login/log_out" class="btn btn-default">LOGOUT</a>
            </div>
        </div>
        <div class="navbar-left">
            <h5 class="title">PT. Buana Masa Metalindo</h5>
            <div class="collapse navbar-collapse" id="modules">
                <ul class="nav nav-tabs">
                    <li role="presentation"
                        class="active">
                        <a href="<?php echo base_url()?>marketing">MARKETING</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>engineering">ENGINEERING</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>ppic">PPIC</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>purchasing">PURCHASING</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>production">PRODUCTION</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>logistic">LOGISTIC</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>qc">QC</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>maintenance">MAINTENANCE</a>
                    </li>
                    <li role="presentation"
                        class="">
                        <a href="<?php echo base_url()?>admin">ADMIN</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-xs visible-xs">
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Master <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/customer">Customer List</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/customer/create">Add New Customer</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/sot">Sales Order Types</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/sow">Scope of Works</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/kom">Kick Off Meeting Template</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Quotation <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/quotation">Quotation List</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/quotation/create">Add New Quotation</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/document">BQ and Documents</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Job Order <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/joborder">Job Orders List</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/joborder/create">Add New Job Order</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/document">Job Order Documents</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Projects <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/project">Project List</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/project/create">Add New Project</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Kickoff Meeting <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/kom">Kickoff Meeting Lists</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/kom/create">Add Kickoff Meeting</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Delivery Order <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/delivery">Delivery Order List</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/delivery/create">Add New Delivery Order</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Reports <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/joborder/report/create">Add Yearly Target</a></li>
                                                                    <li><a href="<?php echo base_url() ?>marketing/joborder/report">Yearly Report</a></li>
                                                            </ul>
                        </li>
                                    </ul>
            </div>
        </div>
    </div>
</nav>
<div class="collapse navbar-collapse" style="border: 1px solid #ddd; margin-bottom: 15px;">
    <ul class="nav navbar-nav navbar-xs">
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Master <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/customer">Customer List</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/customer/create">Add New Customer</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/sot">Sales Order Types</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/sow">Scope of Works</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/kom">Kick Off Meeting Template</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Quotation <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/quotation">Quotation List</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/quotation/create">Add New Quotation</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/document">BQ and Documents</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Job Order <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/joborder">Job Orders List</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/joborder/create">Add New Job Order</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/document">Job Order Documents</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Projects <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/project">Project List</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/project/create">Add New Project</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Kickoff Meeting <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/kom">Kickoff Meeting Lists</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/kom/create">Add Kickoff Meeting</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Delivery Order <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/delivery">Delivery Order List</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/delivery/create">Add New Delivery Order</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Reports <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/joborder/report/create">Add Yearly Target</a></li>
                                            <li><a href="<?php echo base_url() ?>marketing/joborder/report">Yearly Report</a></li>
                                    </ul>
            </li>
            </ul>
</div>

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