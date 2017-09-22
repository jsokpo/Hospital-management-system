<div class="sidebar-background">
	<div class="primary-sidebar-background">
	</div>
</div>
<div class="primary-sidebar">
	<!-- Main nav -->
    <br />
    <div style="text-align:center;">
    	<a href="<?php echo base_url();?>">
        	<img src="<?php echo base_url();?>uploads/logo.png"  style="max-height:100px; max-width:100px;"/>
        </a>
    </div>
   	<br />
	<ul class="nav nav-collapse collapse nav-collapse-primary">
    
        
        <!------dashboard----->
		<li class="<?php if($page_name == 'dashboard')echo 'dark-nav active';?>">
			<span class="glow"></span>
				<a href="<?php echo base_url();?>index.php?pharmacist/dashboard" >
					<i class="icon-desktop icon-2x"></i>
					<span><?php echo get_phrase('dashboard');?></span>
				</a>
		</li>
        
        <!------medicine category----->
		<li class="<?php if($page_name == 'manage_medicine_category')echo 'dark-nav active';?>">
			<span class="glow"></span>
				<a href="<?php echo base_url();?>index.php?pharmacist/manage_medicine_category" >
					<i class="icon-edit icon-2x"></i>
					<span><?php echo get_phrase('medicine_category');?></span>
				</a>
		</li>
        
        <!------manage medicine----->
		<li class="<?php if($page_name == 'manage_medicine')echo 'dark-nav active';?>">
			<span class="glow"></span>
				<a href="<?php echo base_url();?>index.php?pharmacist/manage_medicine" >
					<i class="icon-medkit icon-2x"></i>
					<span><?php echo get_phrase('manage_medicine');?></span>
				</a>
		</li>
        
        <!------prescription----->
		<li class="<?php if($page_name == 'manage_prescription')echo 'dark-nav active';?>">
			<span class="glow"></span>
				<a href="<?php echo base_url();?>index.php?pharmacist/manage_prescription" >
					<i class="icon-stethoscope icon-2x"></i>
					<span><?php echo get_phrase('provide_medication');?></span>
				</a>
		</li>
        
		<!------manage own profile--->
		<li class="<?php if($page_name == 'manage_profile')echo 'dark-nav active';?>">
			<span class="glow"></span>
				<a href="<?php echo base_url();?>index.php?pharmacist/manage_profile" >
					<i class="icon-lock icon-2x"></i>
					<span><?php echo get_phrase('profile');?></span>
				</a>
		</li>
		
	</ul>
	
</div>