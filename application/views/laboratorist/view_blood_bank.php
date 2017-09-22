<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
			<li class="active">
            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('blood_donor_list');?>
                    	</a></li>
			<li>
            	<a href="#list_blood_bank" data-toggle="tab"><i class="icon-align-justify"></i>
					<?php echo get_phrase('blood_bank');?>
                    	</a></li>
		</ul>
    	<!------CONTROL TABS END------->
        
	</div>
	<div class="box-content padded">
		<div class="tab-content">
            <!----TABLE LISTING STARTS--->
            <div class="tab-pane box active" id="list">
				
                <table cellpadding="0" cellspacing="0" border="0" class="dTable responsive">
                	<thead>
                		<tr>
                    		<th><div>#</div></th>
                    		<th><div><?php echo get_phrase('name');?></div></th>
                    		<th><div><?php echo get_phrase('age');?></div></th>
                    		<th><div><?php echo get_phrase('sex');?></div></th>
                    		<th><div><?php echo get_phrase('blood_group');?></div></th>
                    		<th><div><?php echo get_phrase('last_donation_date');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php $count = 1;foreach($blood_donors as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
							<td><?php echo $row['name'];?></td>
							<td><?php echo $row['age'];?></td>
							<td><?php echo $row['sex'];?></td>
							<td><?php echo $row['blood_group'];?></td>
							<td><?php echo date('d M,Y',$row['last_donation_timestamp']);?></td>
                        </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
			</div>
            <!----TABLE LISTING ENDS--->
            
            
			<!----CREATION FORM STARTS---->
			<div class="tab-pane box" id="list_blood_bank" >
                <div class="box-content">
                    <table cellpadding="0" cellspacing="0" border="0" class="dTable responsive">
                        <thead>
                            <tr>
                                <th><div>#</div></th>
                                <th><div><?php echo get_phrase('blood_group');?></div></th>
                                <th><div><?php echo get_phrase('status');?></div></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $count = 1;foreach($blood_bank as $row):?>
                            <tr>
                                <td><?php echo $count++;?></td>
                                <td><?php echo $row['blood_group'];?></td>
                                <td><?php echo $row['status'];?></td>
                            </tr>
                            <?php endforeach;?>
                        </tbody>
                    </table>  
                </div>                
			</div>
			<!----CREATION FORM ENDS--->
            
		</div>
	</div>
</div>