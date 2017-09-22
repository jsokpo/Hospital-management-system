<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
			<li class="active">
            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('bed_allotment');?>
                    	</a></li>
			<li>
            	<a href="#list_blood_bank" data-toggle="tab"><i class="icon-align-justify"></i>
					<?php echo get_phrase('bed_list');?>
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
                    		<th><div><?php echo get_phrase('bed_id');?></div></th>
                    		<th><div><?php echo get_phrase('bed_type');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('allotment_time');?></div></th>
                    		<th><div><?php echo get_phrase('discharge_time');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php $count = 1;foreach($bed_allotments as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
							<td><?php echo $row['bed_id'];?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('bed' , 		$row['bed_id'] , 'type');?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient' , 	$row['patient_id'] , 'name');?></td>
							<td><?php echo date('d M,Y',$row['allotment_timestamp']);?></td>
							<td><?php echo date('d M,Y',$row['discharge_timestamp']);?></td>
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
                                <th><div><?php echo get_phrase('bed_number');?></div></th>
                                <th><div><?php echo get_phrase('type');?></div></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $count = 1;foreach($beds as $row):?>
                            <tr>
                                <td><?php echo $count++;?></td>
                                <td><?php echo $row['bed_number'];?></td>
                                <td><?php echo $row['type'];?></td>
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