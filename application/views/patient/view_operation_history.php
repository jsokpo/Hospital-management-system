<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
			<li class="active">
            	<a href="#operation" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('operation');?>
                    	</a></li>
			<li>
            	<a href="#birth" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('birth');?>
                    	</a></li>
			<li>
            	<a href="#other" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('other');?>
                    	</a></li>
		</ul>
    	<!------CONTROL TABS END------->
        
	</div>
	<div class="box-content padded">
		<div class="tab-content">            
            <!----OPERATION LISTING STARTS--->
            <div class="tab-pane box active" id="operation">
				
                <table cellpadding="0" cellspacing="0" border="0" class="dTable responsive">
                	<thead>
                		<tr>
                    		<th><div>#</div></th>
                    		<th><div><?php echo get_phrase('description');?></div></th>
                    		<th><div><?php echo get_phrase('date');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('options');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php 
						$count = 1;
						$birth_reports	=	$this->db->get_where('report' , array('type'=>'operation','patient_id'=>$this->session->userdata('patient_id')))->result_array();
						foreach($birth_reports as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
                            <td><?php echo $row['description'];?></td>
                            <td><?php echo date('d M,Y', $row['timestamp']);?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td align="center">

        					</td>
                        </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
			</div>
            <!----OPERATION LISTING ENDS--->
            
            <!----BIRTH LISTING STARTS--->
            <div class="tab-pane box" id="birth">
				
                <table cellpadding="0" cellspacing="0" border="0" class="dTable responsive">
                	<thead>
                		<tr>
                    		<th><div>#</div></th>
                    		<th><div><?php echo get_phrase('description');?></div></th>
                    		<th><div><?php echo get_phrase('date');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('options');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php 
						$count = 1;
						$birth_reports	=	$this->db->get_where('report' , array('type'=>'birth','patient_id'=>$this->session->userdata('patient_id')))->result_array();
						foreach($birth_reports as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
                            <td><?php echo $row['description'];?></td>
                            <td><?php echo date('d M,Y', $row['timestamp']);?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td align="center">

        					</td>
                        </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
			</div>
            <!----BIRTH LISTING ENDS--->
            
            <!----OTHER LISTING STARTS--->
            <div class="tab-pane box" id="other">
				
                <table cellpadding="0" cellspacing="0" border="0" class="dTable responsive">
                	<thead>
                		<tr>
                    		<th><div>#</div></th>
                    		<th><div><?php echo get_phrase('description');?></div></th>
                    		<th><div><?php echo get_phrase('date');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('options');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php 
						$count = 1;
						$birth_reports	=	$this->db->get_where('report' , array('type'=>'other','patient_id'=>$this->session->userdata('patient_id')))->result_array();
						foreach($birth_reports as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
                            <td><?php echo $row['description'];?></td>
                            <td><?php echo date('d M,Y', $row['timestamp']);?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td align="center">

        					</td>
                        </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
			</div>
            <!----OTHER LISTING ENDS--->
            
		</div>
	</div>
</div>