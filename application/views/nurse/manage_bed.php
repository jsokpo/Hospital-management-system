<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
        	<?php if(isset($edit_profile)):?>
			<li class="active">
            	<a href="#edit" data-toggle="tab"><i class="icon-wrench"></i> 
					<?php echo get_phrase('edit_bed');?>
                    	</a></li>
            <?php endif;?>
			<li class="<?php if(!isset($edit_profile))echo 'active';?>">
            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('bed_list');?>
                    	</a></li>
			<li>
            	<a href="#add" data-toggle="tab"><i class="icon-plus"></i>
					<?php echo get_phrase('add_bed');?>
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
                    <?php echo form_open('nurse/manage_bed/edit/do_update/'.$row['bed_id'] , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('bed_number');?></label>
                                <div class="controls">
                                    <input type="text" class="validate[required]" name="bed_number" value="<?php echo $row['bed_number'];?>"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('type');?></label>
                                <div class="controls">
                                    <select name="type" class="uniform" style="width:100%;">
                                    	<option value="ward" <?php if($row['type']=='ward')echo 'selected';?>><?php echo get_phrase('ward');?></option>
                                    	<option value="cabin" <?php if($row['type']=='cabin')echo 'selected';?>><?php echo get_phrase('cabin');?></option>
                                    	<option value="icu" <?php if($row['type']=='icu')echo 'selected';?>><?php echo get_phrase('icu');?></option>
                                    	<option value="other" <?php if($row['type']=='other')echo 'selected';?>><?php echo get_phrase('other');?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('description');?></label>
                                <div class="controls">
                                    <input type="text" class="" name="birth_date" value="<?php echo $row['description'];?>"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('edit_bed');?></button>
                        </div>
                    <?php echo form_close();?>
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
                    		<th><div><?php echo get_phrase('bed_number');?></div></th>
                    		<th><div><?php echo get_phrase('type');?></div></th>
                    		<th><div><?php echo get_phrase('options');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php $count = 1;foreach($beds as $row):?>
                        <tr>
                            <td><?php echo $count++;?></td>
							<td><?php echo $row['bed_number'];?></td>
							<td><?php echo $row['type'];?></td>
							<td align="center">
                            	<a href="<?php echo base_url();?>index.php?nurse/manage_bed/edit/<?php echo $row['bed_id'];?>"
                                	rel="tooltip" data-placement="top" data-original-title="<?php echo get_phrase('edit');?>" class="btn btn-blue">
                                		<i class="icon-wrench"></i>
                                </a>
                            	<a href="<?php echo base_url();?>index.php?nurse/manage_bed/delete/<?php echo $row['bed_id'];?>" onclick="return confirm('delete?')"
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
                    <?php echo form_open('nurse/manage_bed/create/' , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('bed_number');?></label>
                                <div class="controls">
                                    <input type="text" class="validate[required]" name="bed_number"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('type');?></label>
                                <div class="controls">
                                    <select name="type" class="uniform" style="width:100%;">
                                    	<option value="ward"><?php echo get_phrase('ward');?></option>
                                    	<option value="cabin"><?php echo get_phrase('cabin');?></option>
                                    	<option value="icu"><?php echo get_phrase('icu');?></option>
                                    	<option value="other"><?php echo get_phrase('other');?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('description');?></label>
                                <div class="controls">
                                    <input type="text" class="" name="description"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('add_bed');?></button>
                        </div>
                    <?php echo form_close();?>                
                </div>                
			</div>
			<!----CREATION FORM ENDS--->
            
		</div>
	</div>
</div>