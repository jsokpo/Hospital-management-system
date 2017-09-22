<div class="navbar navbar-top navbar-inverse">

	<div class="navbar-inner">

		<div class="container-fluid">

			<a class="brand" href="<?php echo base_url();?>"><?php echo $system_name;?>

			</a>

			<!-- the new toggle buttons -->

			<ul class="nav pull-right">

				<li class="toggle-primary-sidebar hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-primary"><button type="button" class="btn btn-navbar"><i class="icon-th-list"></i></button></li>

				<li class="hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-top"><button type="button" class="btn btn-navbar"><i class="icon-align-justify"></i></button></li>

			</ul>

			<div class="nav-collapse nav-collapse-top collapse">

				<ul class="nav pull-right">

					<li class="dropdown">

					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo get_phrase('account');?> <b class="caret"></b></a>

					<!-- Account Selector -->

                    <ul class="dropdown-menu">

                    	<li class="with-image">

                        	<span>

                            <?php 

								$account_type	=	$this->session->userdata('login_type');

								$account_id		=	$account_type.'_id';

								$name			=	$this->crud_model->get_type_name_by_id($account_type , $this->session->userdata($account_id) , 'name');

								echo $name;

							?>

                            </span>

                        </li>

                    	<li class="divider"></li>

						<li><a href="<?php echo base_url();?>index.php?<?php echo $this->session->userdata('login_type');?>/manage_profile">

                        		<i class="icon-user"></i><span><?php echo get_phrase('profile');?></span></a></li>

						<li><a href="<?php echo base_url();?>index.php?login/logout">

                        		<i class="icon-off"></i><span><?php echo get_phrase('logout');?></span></a></li>

					</ul>

                	<!-- Account Selector -->

					</li>

				</ul>

				<ul class="nav pull-right">

					<li class="dropdown">

					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo get_phrase('select_language');?><b class="caret"></b></a>

					<!-- Language Selector -->

                        <ul class="dropdown-menu">

                            <?php

                            $fields = $this->db->list_fields('language');

                            foreach ($fields as $field)

                            {

                                if($field == 'phrase_id' || $field == 'phrase')continue;

                                ?>

                                    <li>

                                        <a href="<?php echo base_url();?>index.php?multilanguage/select_language/<?php echo $field;?>">

                                            <?php echo $field;?>

                                            <?php //selecting current language

                                                if($this->session->userdata('current_language') == $field):?>

                                                    <i class="icon-ok"></i>

                                            <?php endif;?>

                                        </a>

                                    </li>

                                <?php

                            }

                            ?>

                        </ul>

                	<!-- Language Selector -->

					</li>

				</ul>

                <ul class="nav pull-right">

					<li class="dropdown">

					<a href="#" ><i class="icon-user"></i><?php echo get_phrase($this->session->userdata('login_type')).' '.get_phrase('panel');?> </a>

					</li>

				</ul>

			</div>

		</div>

	</div>

</div>