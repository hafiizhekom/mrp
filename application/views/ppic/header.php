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
                        class="active">
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
                               aria-expanded="false">Schedule &amp; Progress <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>ppc/schedule">Schedule Lists</a></li>
                                                                    <li><a href="<?php echo base_url() ?>ppc/schedule/create">Add New Schedule</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Material Requirement (DKM) <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>ppc/dkm">Material Requirement Lists</a></li>
                                                                    <li><a href="<?php echo base_url() ?>ppc/dkm/create">Add New Material Requirement</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">MPK <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>ppc/mpk">MPK List</a></li>
                                                                    <li><a href="<?php echo base_url() ?>ppc/mpk/create">Add New MPK</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Packing Lists <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>ppc/packing">Packing Lists</a></li>
                                                                    <li><a href="<?php echo base_url() ?>ppc/packing/create">Add New Packing List</a></li>
                                                            </ul>
                        </li>
                                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Monitoring Progress <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                                                    <li><a href="<?php echo base_url() ?>ppc/schedule/monitoring">Reports</a></li>
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
                   aria-expanded="false">Schedule &amp; Progress <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>ppc/schedule">Schedule Lists</a></li>
                                            <li><a href="<?php echo base_url() ?>ppc/schedule/create">Add New Schedule</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Material Requirement (DKM) <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>ppc/dkm">Material Requirement Lists</a></li>
                                            <li><a href="<?php echo base_url() ?>ppc/dkm/create">Add New Material Requirement</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">MPK <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>ppc/mpk">MPK List</a></li>
                                            <li><a href="<?php echo base_url() ?>ppc/mpk/create">Add New MPK</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Packing Lists <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>ppc/packing">Packing Lists</a></li>
                                            <li><a href="<?php echo base_url() ?>ppc/packing/create">Add New Packing List</a></li>
                                    </ul>
            </li>
                    <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Monitoring Progress <span class="caret"></span></a>
                <ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>ppc/schedule/monitoring">Reports</a></li>
                                    </ul>
            </li>
            </ul>
</div>