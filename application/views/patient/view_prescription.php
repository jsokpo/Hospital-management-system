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
                    <form method="post" action="<?php echo base_url();?>index.php?doctor/manage_prescription/edit/do_update/<?php echo $row['prescription_id'];?>" class="form-horizontal validatable">
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('doctor');?></label>
                                <div class="controls" style="padding-top:5px;">
                                    <?php echo $this->crud_model->get_type_name_by_id('doctor',$row['doctor_id'],'name');?>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('patient');?></label>
                                <div class="controls" style="padding-top:5px;">
                                    <?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('case_history');?></label>
                                <div class="controls" style="padding-top:5px;">
                                    <?php echo $row['case_history'];?>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('medication');?></label>
                                <div class="controls" style="padding-top:5px;">
                                    <?php echo $row['medication'];?>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('medication_from_pharmacist');?></label>
                                <div class="controls" style="padding-top:5px;">
                                    <?php echo $row['medication_from_pharmacist'];?>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('description');?></label>
                                <div class="controls" style="padding-top:5px;">
                                    <?php echo $row['description'];?>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('date');?></label>
                                <div class="controls" style="padding-top:5px;">
                                    <?php echo date('m/d/Y', $row['creation_timestamp']);?>
                                </div>
                            </div>
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
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('options');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php $count = 1;foreach($prescriptions as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
                            <td><?php echo date('d M,Y', $row['creation_timestamp']);?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
							<td align="center">
                            	<a href="<?php echo base_url();?>index.php?patient/view_prescription/edit/<?php echo $row['prescription_id'];?>" class="btn btn-blue">
                                	<?php echo get_phrase('view_prescription');?>
                                </a>
        					</td>
                        </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
			</div>
            <!----TABLE LISTING ENDS--->
            
            
		</div>
	</div>
</div>

