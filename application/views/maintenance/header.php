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
                <a href="<?php echo base_url() ?>/marketing" class="btn btn-default" type="button">Admin</a>
                <a href="<?php echo base_url() ?>/marketing" class="btn btn-default" type="button">HOME</a>
                <a href="<?php echo base_url() ?>/change-language" class="btn btn-default" type="button"
                   title="Change report language to EN">LANG: ID</a>
                <a href="<?php echo base_url() ?>password" class="btn btn-default" type="button">CHANGE PASSWORD</a>
                <a href="<?php echo base_url() ?>login/log_out" class="btn btn-default">LOGOUT</a>
            </div>
        </div>
        <div class="navbar-left">
            <h5 class="title">PT. Buana Masa Metalindo</h5>
            <div class="collapse navbar-collapse" id="modules">
                <ul class="nav nav-tabs">
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="Marketing"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>marketing">MARKETING</a>
                            </li>
                        <?php }
                    } ?>
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="Engineering"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>engineering">ENGINEERING</a>
                            </li>
                        <?php }
                    } ?>
                    
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="PPC"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>ppc">PPIC</a>
                            </li>
                        <?php }
                    } ?>
                    
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="Purchasing"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>purchasing">PURCHASING</a>
                            </li>
                        <?php }
                    } ?>
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="Production"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>production">PRODUCTION</a>
                            </li>
                        <?php }
                    } ?>
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="Logistic"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>logistic">LOGISTIC</a>
                            </li>
                        <?php }
                    } ?>
                    
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="QC"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>qc">QC</a>
                            </li>
                        <?php }
                    } ?>
                    
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="Maintenance"){?>
                            <li role="presentation" class="active">
                                <a href="<?php echo base_url() ?>maintenance">MAINTENANCE</a>
                            </li>
                        <?php }
                    } ?>
                    <?php foreach ($this->session->userdata('menu_access') as $key => $value) {
                        if($value->module=="Administrator"){?>
                            <li role="presentation" class="">
                                <a href="<?php echo base_url() ?>admin">ADMIN</a>
                            </li>
                        <?php }
                    } ?>
                </ul>
                <ul class="nav navbar-nav navbar-xs visible-xs">
                    <?php $header=false;
                    foreach ($sub_menu as $key => $value) {
                        if($value->menu=="Equipment & Inventories"){
                            $header=true;
                        }
                    }
                    if($header==true){?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Equipments &amp; Inventories <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Equipment & Inventories"){?>
                                    <li><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                                <?php }
                            } ?>
                        </ul>
                    </li>
                <?php } ?>
                <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Transactions"){
                        $header=true;
                    }
                }
                if($header==true){?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Transactions <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Transactions"){?>
                                    <li><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                                <?php }
                            } ?>
                        </ul>
                    </li>
                <?php } ?>
                <?php $header=false;
                foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Reports"){
                        $header=true;
                    }
                }
                if($header==true){?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Reports <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <?php foreach ($sub_menu as $key => $value) {
                                if($value->menu=="Reports"){?>
                                    <li><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                                <?php }
                            } ?>
                        </ul>
                    </li>
                <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="collapse navbar-collapse" style="border: 1px solid #ddd; margin-bottom: 15px;">
    <ul class="nav navbar-nav navbar-xs">
        <?php $header=false;
        foreach ($sub_menu as $key => $value) {
            if($value->menu=="Equipment & Inventories"){
                $header=true;
            }
        }
        if($header==true){?>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Equipments &amp; Inventories <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <?php foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Equipment & Inventories"){?>
                        <li><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                    <?php }
                } ?>
            </ul>
        </li>
    <?php } ?>
    <?php $header=false;
        foreach ($sub_menu as $key => $value) {
            if($value->menu=="Transactions"){
                $header=true;
            }
        }
        if($header==true){?>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Transactions <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <?php foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Transactions"){?>
                        <li><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                    <?php }
                } ?>
            </ul>
        </li>
    <?php } ?>
    <?php $header=false;
        foreach ($sub_menu as $key => $value) {
            if($value->menu=="Reports"){
                $header=true;
            }
        }
        if($header==true){?>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Reports <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <?php foreach ($sub_menu as $key => $value) {
                    if($value->menu=="Reports"){?>
                        <li><a href="<?php echo base_url() ?><?php echo $value->url; ?>"><?php echo $value->sub_menu; ?></a></li>
                    <?php }
                } ?>
            </ul>
        </li>
    <?php } ?>
    </ul>
</div>