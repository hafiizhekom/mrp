<nav class="navbar navbar-default navbar-custom">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#modules" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?php echo base_url() ?>">
                <img alt="Brand" src="<?php echo base_url() ?>images/logo.png">
            </a>
        </div>
        <div class="navbar-text navbar-right">
            <div class="btn-group" role="group" aria-label="...">
                <a href="<?php echo base_url() ?>marketing" class="btn btn-default" type="button">Admin</a>
                <a href="<?php echo base_url() ?>marketing" class="btn btn-default" type="button">HOME</a>
                <a href="<?php echo base_url() ?>change-language" class="btn btn-default" type="button"
                   title="Change report language to EN">LANG: ID</a>
                <a href="<?php echo base_url() ?>password" class="btn btn-default" type="button">CHANGE PASSWORD</a>
                <a href="<?php echo base_url() ?>login/log_out" class="btn btn-default">LOGOUT</a>
            </div>
        </div>
        <div class="navbar-left">
            <h5 class="title">PT. Buana Masa Metalindo</h5>
            <div class="collapse navbar-collapse" id="modules">
                <ul class="nav nav-tabs">
                    <li role="presentation"
                        class="">
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
                        class="active">
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
                               aria-expanded="false">Master Consumable <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>logistic/consumable">Master Consumable</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Inventory <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>logistic/inventory">Stock Consumable</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/consumable/input">Penerimaan Consumable</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/consumable/output">Pengambilan Consumable</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/consumable/history">Transaction Records</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Project <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>marketing/joborder">Job Orders</a></li>
                                                                    <li><a href="<?php echo base_url() ?>ppc/dkm">DKM</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Stock Opname <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>logistic/opname">Stock Opname Lists</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/opname/create">Add New Stock Opname</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Request Consumable <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>logistic/request">Request Consumable List</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/request/create">Add New Request Consumable</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Reports <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>logistic/report/monthly/input">Penerimaan Consumable</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/report/monthly/output">Pengeluaran Consumable</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/report/project">Per Project</a></li>
                                                                    <li><a href="<?php echo base_url() ?>logistic/report/monthly/stock">Stock Opname</a></li>
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
                   aria-expanded="false">Master Consumable <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>logistic/consumable">Master Consumable</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Inventory <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>logistic/inventory">Stock Consumable</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/consumable/input">Penerimaan Consumable</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/consumable/output">Pengambilan Consumable</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/consumable/history">Transaction Records</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Project <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>marketing/joborder">Job Orders</a></li>
                                            <li><a href="<?php echo base_url() ?>ppc/dkm">DKM</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Stock Opname <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>logistic/opname">Stock Opname Lists</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/opname/create">Add New Stock Opname</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Request Consumable <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>logistic/request">Request Consumable List</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/request/create">Add New Request Consumable</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Reports <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>logistic/report/monthly/input">Penerimaan Consumable</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/report/monthly/output">Pengeluaran Consumable</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/report/project">Per Project</a></li>
                                            <li><a href="<?php echo base_url() ?>logistic/report/monthly/stock">Stock Opname</a></li>
                                    </ul>
            </li>
            </ul>
</div>