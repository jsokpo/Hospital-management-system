<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
        	<?php if(isset($edit_profile)):?>
			<li class="active">
            	<a href="#edit" data-toggle="tab"><i class="icon-wrench"></i> 
					<?php echo get_phrase('edit_prescription');?>
                    	</a></li>
            <?php endif;?>
			<li class="<?php if(!isset($edit_profile))echo 'active';?>">
            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('prescription_list');?>
                    	</a></li>
			<li>
            	<a href="#add" data-toggle="tab"><i class="icon-plus"></i>
					<?php echo get_phrase('add_prescription');?>
                    	</a></li>
		</ul>
    	<!------CONTROL TABS END------->
        
	</div>
	<div class="box-content padded">
		<div class="tab-content">
        	<!----EDITING FORM STARTS---->
        	<?php if(isset($edit_profile)):?>
			<div class="tab-pane box active" id="edit" style="padding: 5px">
                <div class="box-content">
                	<?php foreach($edit_profile as $row):?>
                    <?php echo form_open('doctor/manage_prescription/edit/do_update/'.$row['prescription_id'] , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('doctor');?></label>
                                <div class="controls">
                                    <select class="chzn-select" name="doctor_id">
										<?php 
										$doctors	=	$this->db->get('doctor')->result_array();
										foreach($doctors as $row2):
										?>
                                        	<option value="<?php echo $row2['doctor_id'];?>" <?php if($row2['doctor_id'] == $row['doctor_id'])echo 'selected';?>>
												<?php echo $row2['name'];?>
                                            </option>
                                        <?php
										endforeach;
										?>
									</select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('patient');?></label>
                                <div class="controls">
                                    <select class="chzn-select" name="patient_id">
										<?php 
										$this->db->order_by('account_opening_timestamp' , 'asc');
										$patients	=	$this->db->get('patient')->result_array();
										foreach($patients as $row2):
										?>
                                        	<option value="<?php echo $row2['patient_id'];?>" <?php if($row2['patient_id'] == $row['patient_id'])echo 'selected';?>>
												<?php echo $row2['name'];?>
                                            </option>
                                        <?php
										endforeach;
										?>
									</select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('case_history');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="case_history" id="ttt" rows="5" 
                                                	placeholder="<?php echo get_phrase('add_description');?>"><?php echo $row['case_history'];?></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('medication');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="medication" id="ttt" rows="5" 
                                                	placeholder="<?php echo get_phrase('add_description');?>"><?php echo $row['medication'];?></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('medication_from_pharmacist');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="medication_from_pharmacist" id="ttt" rows="5" 
                                                	placeholder="<?php echo get_phrase('add_description');?>"><?php echo $row['medication_from_pharmacist'];?></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('description');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="description" id="ttt" rows="5" 
                                                	placeholder="<?php echo get_phrase('add_description');?>"><?php echo $row['description'];?></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('date');?></label>
                                <div class="controls">
                                    <input type="text" class="datepicker fill-up" name="creation_timestamp" value="<?php echo date('m/d/Y', $row['creation_timestamp']);?>"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('edit_prescription');?></button>
                        </div>
                    <?php echo form_close();?>
                    <!---------DIAGNOSIS REPORTS----------->
                    <hr />
                    <div class="box">
                    <div class="box-header"><span class="title"><?php echo get_phrase('diagnosis_report');?></span></div>
                    <div class="box-content">
                    	<table cellpadding="0" cellspacing="0" border="0" class="table table-normal ">
                            <thead>
                                <tr>
                                    <td><div>#</div></td>
                                    <td><div><?php echo get_phrase('report_type');?></div></td>
                                    <td><div><?php echo get_phrase('document_type');?></div></td>
                                    <td><div><?php echo get_phrase('download');?></div></td>
                                    <td><div><?php echo get_phrase('description');?></div></td>
                                    <td><div><?php echo get_phrase('date');?></div></td>
                                    <td><div><?php echo get_phrase('laboratorist');?></div></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $count = 1;
                                $diagnostic_reports	=	$this->db->get_where('diagnosis_report' , array('prescription_id' => $row['prescription_id']))->result_array();
                                foreach($diagnostic_reports as $row2):?>
                                <tr>
                                    <td><?php echo $count++;?></td>
                                    <td><?php echo $row2['report_type'];?></td>
                                    <td><?php echo $row2['document_type'];?></td>
                                    <td style="text-align:center;">
                                    	<?php if($row2['document_type'] == 'image'):?>
                                        <div id="thumbs">
  											<a href="<?php echo base_url();?>uploads/diagnosis_report/<?php echo $row2['file_name'];?>" 
                                            	style="background-image:url(<?php echo base_url();?>uploads/diagnosis_report/<?php echo $row2['file_name'];?>)" title="<?php echo $row2['file_name'];?>">
                                                	</a></div>
 										<?php endif;?>
                                                    
										<a href="<?php echo base_url();?>uploads/diagnosis_report/<?php echo $row2['file_name'];?>" target="_blank"
                                        	class="btn btn-blue">	<i class="icon-download-alt"></i> <?php echo get_phrase('download');?></a>
                                    </td>
                                    <td><?php echo $row2['description'];?></td>
                                    <td><?php echo date('d M,Y', $row2['timestamp']);?></td>
                                    <td><?php echo $this->crud_model->get_type_name_by_id('laboratorist',$row2['laboratorist_id'],'name');?></td>
                                    
                                </tr>
                                <?php endforeach;?>
                            </tbody>
                        </table>
                     </div>
                     </div> 
                    <!-------DIAGNOSIS REPORTS ENDS------->
                    <?php endforeach;?>
                </div>
			</div>
            <?php endif;?>
            <!----EDITING FORM ENDS--->
            
            <!----TABLE LISTING STARTS--->
            <div class="tab-pane box <?php if(!isset($edit_profile))echo 'active';?>" id="list">
				
                <table cellpadding="0" cellspacing="0" border="0" class="dTable responsive">
                	<thead>
                		<tr>
                    		<th><div>#</div></th>
                    		<th><div><?php echo get_phrase('date');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('doctor');?></div></th>
                    		<th><div><?php echo get_phrase('options');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php $count = 1;foreach($prescriptions as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
                            <td><?php echo date('d M,Y', $row['creation_timestamp']);?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('doctor',$row['doctor_id'],'name');?></td>
							<td align="center">
                            	<a href="<?php echo base_url();?>index.php?doctor/manage_prescription/edit/<?php echo $row['prescription_id'];?>"
                                	rel="tooltip" data-placement="top" data-original-title="<?php echo get_phrase('edit');?>" class="btn btn-blue">
                                		<i class="icon-wrench"></i>
                                </a>
                            	<a href="<?php echo base_url();?>index.php?doctor/manage_prescription/delete/<?php echo $row['prescription_id'];?>" onclick="return confirm('delete?')"
                                	rel="tooltip" data-placement="top" data-original-title="<?php echo get_phrase('delete');?>" class="btn btn-red">
                                		<i class="icon-trash"></i>
                                </a>
        					</td>
                        </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
			</div>
            <!----TABLE LISTING ENDS--->
            
            
			<!----CREATION FORM STARTS---->
			<div class="tab-pane box" id="add" style="padding: 5px">
                <div class="box-content">
                    <?php echo form_open('doctor/manage_prescription/create/' , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('doctor');?></label>
                                <div class="controls">
                                    <select class="chzn-select" name="doctor_id">
										<?php 
										$doctors	=	$this->db->get('doctor')->result_array();
										foreach($doctors as $row):
										?>
                                        	<option value="<?php echo $row['doctor_id'];?>"><?php echo $row['name'];?></option>
                                        <?php
										endforeach;
										?>
									</select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('patient');?></label>
                                <div class="controls">
                                    <select class="chzn-select" name="patient_id">
										<?php 
										$this->db->order_by('account_opening_timestamp' , 'asc');
										$patients	=	$this->db->get('patient')->result_array();
										foreach($patients as $row):
										?>
                                        	<option value="<?php echo $row['patient_id'];?>"><?php echo $row['name'];?></option>
                                        <?php
										endforeach;
										?>
									</select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('case_history');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="case_history" id="ttt" rows="5" placeholder="<?php echo get_phrase('add_description');?>"></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('medication');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="medication" id="ttt" rows="5" placeholder="<?php echo get_phrase('add_description');?>"></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('medication_from_pharmacist');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="medication_from_pharmacist" id="ttt" rows="5" placeholder="<?php echo get_phrase('add_description');?>"></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('description');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="description" id="ttt" rows="5" placeholder="<?php echo get_phrase('add_description');?>"></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('date');?></label>
                                <div class="controls">
                                    <input type="text" class="datepicker fill-up" name="creation_timestamp" value=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('add_prescription');?></button>
                        </div>
                    <?php echo form_close();?>                
                </div>                
			</div>
			<!----CREATION FORM ENDS--->
            
		</div>
	</div>
</div>

