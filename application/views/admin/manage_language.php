<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
        	<?php if(isset($edit_profile)):?>
			<li class="active">
            	<a href="#edit" data-toggle="tab"><i class="icon-wrench"></i> 
					<?php echo get_phrase('edit_phrase');?>
                    	</a></li>
            <?php endif;?>
			<li class="<?php if(!isset($edit_profile))echo 'active';?>">
            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('phrase_list');?>
                    	</a></li>
			<li>
            	<a href="#add" data-toggle="tab"><i class="icon-plus"></i>
					<?php echo get_phrase('add_phrase');?>
                    	</a></li>
			<li class="">
            	<a href="#add_lang" data-toggle="tab"><i class="icon-plus"></i> 
					<?php echo get_phrase('add_language');?>
                    	</a></li>
		</ul>
    	<!------CONTROL TABS END------->
        
	</div>
	<div class="box-content padded">
		<div class="tab-content">
            <!----PHRASE EDITING TAB STARTS-->
            <?php if (isset($edit_profile)):?>
			<div class="tab-pane box active" id="edit" style="padding: 5px">
                <div class="box-content">


						<div class="row-fluid">
                    	<?php 
						$current_editing_language	=	$edit_profile;
						echo form_open('admin/manage_language/update_phrase/'.$current_editing_language  , array('id' => 'phrase_form'));
						$count = 1;
						$language_phrases	=	$this->db->query("SELECT `phrase_id` , `phrase` , `$current_editing_language` FROM `language`")->result_array();
						foreach($language_phrases as $row)
						{
							$phrase_id			=	$row['phrase_id'];					//id number of phrase
							$phrase				=	$row['phrase'];						//basic phrase text
							$phrase_language	=	$row[$current_editing_language];	//phrase of current editing language
							?>
                            <!----phrase box starts-->
							<div class="span3">
                            	<div class="box">
                                	<div class="box-header">
                                       <span class="title"><i class="icon-th-list"></i> <?php echo $count++;?>. <?php echo $row['phrase'];?></span>
                                    </div>
									
                                    <div class="box-content padded">
                                    
                                          <!--text box for editing phrase------>
                                          <input type="text" name="phrase<?php echo $row['phrase_id'];?>" 	value="<?php echo $phrase_language;?>" style="margin-top:10px;width:100%;" />
                                          
                                          
                                                
                                    </div>
								</div>
                            </div>
                            <!----phrase box ends-->
							<?php 
						}
						?>
						</div>
                        <input type="hidden" name="total_phrase" value="<?php echo $count;?>" />
                        <input type="submit" value="<?php echo get_phrase('update_phrase');?>" onClick="document.getElementById('phrase_form').submit();" class="btn btn-blue"/>	
                        <?php
						echo form_close();
						?>
                                     
                </div>                
			</div>
            <?php endif;?>
            <!----PHRASE EDITING TAB ENDS-->
            <!----TABLE LISTING STARTS--->
            <div class="tab-pane box span7 <?php if(!isset($edit_profile))echo 'active';?>" id="list">
                
                
                <table cellpadding="0" cellspacing="0" border="0" class="table table-normal">
                	<thead>
                    	<tr>
                        	<th><?php echo get_phrase('language');?></th>
                        	<th><?php echo get_phrase('option');?></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<?php
								$fields = $this->db->list_fields('language');
								foreach($fields as $field)
								{
									 if($field == 'phrase_id' || $field == 'phrase')continue;
									?>
                    	<tr>
                        	<td><?php echo ucwords($field);?></td>
                        	<td>
                            	<a href="<?php echo base_url();?>index.php?admin/manage_language/edit_phrase/<?php echo $field;?>"
                                	rel="tooltip" data-placement="top" data-original-title="<?php echo get_phrase('edit_phrase');?>" class="btn btn-blue">
                                		<i class="icon-wrench"></i>
                                </a>
                            	<a href="<?php echo base_url();?>index.php?admin/manage_language/delete_language/<?php echo $field;?>"
                                	rel="tooltip" data-placement="top" data-original-title="<?php echo get_phrase('delete_language');?>" class="btn btn-gray" onclick="return confirm('Delete Language ?');">
                                		<i class="icon-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
			</div>
            <!----TABLE LISTING ENDS--->
            
            
			<!----PHRASE CREATION FORM STARTS---->
			<div class="tab-pane box" id="add" style="padding: 5px">
                <div class="box-content">
                    <?php echo form_open('admin/manage_language/add_phrase/' , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('phrase');?></label>
                                <div class="controls">
                                    <input type="text" class="validate[required]" name="phrase"/>
                                </div>
                            </div>
                            
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('add_phrase');?></button>
                        </div>
                    <?php echo form_close();?>                
                </div>                
			</div>
			<!----PHRASE CREATION FORM ENDS--->
            
        	<!----ADD NEW LANGUAGE---->
			<div class="tab-pane box" id="add_lang" style="padding: 5px">
                <div class="box-content">
                    <?php echo form_open('admin/manage_language/add_language/' , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('language');?></label>
                                <div class="controls">
                                    <input type="text" class="validate[required]" name="language"/>
                                </div>
                            </div>
                            
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('add_language');?></button>
                        </div>
                    <?php echo form_close();?> 
                </div>
			</div>
            <!----LANGUAGE ADDING FORM ENDS--->
            
		</div>
	</div>
</div>