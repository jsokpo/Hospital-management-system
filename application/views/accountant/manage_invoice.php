<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
        	<?php if(isset($edit_profile)):?>
			<li class="active">
            	<a href="#edit" data-toggle="tab"><i class="icon-wrench"></i> 
					<?php echo get_phrase('edit_invoice');?>
                    	</a></li>
            <?php endif;?>
			<li class="<?php if(!isset($edit_profile))echo 'active';?>">
            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('invoice_list');?>
                    	</a></li>
			<li>
            	<a href="#add" data-toggle="tab"><i class="icon-plus"></i>
					<?php echo get_phrase('add_invoice');?>
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
                    
                    <?php echo form_open('accountant/manage_invoice/edit/do_update/'.$row['invoice_id'] , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('patient');?></label>
                                <div class="controls">
                                    <select class="chzn-select" name="patient_id">
										<?php 
										$this->db->order_by('account_opening_timestamp' , 'asc');
										$patients	=	$this->db->get('patient')->result_array();
										foreach($patients as $row2):
										?>
                                        	<option value="<?php echo $row2['patient_id'];?>" <?php if($row2['patient_id']==$row['patient_id'])echo 'selected';?>>
												<?php echo $row2['name'];?></option>
                                        <?php
										endforeach;
										?>
									</select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('title');?></label>
                                <div class="controls">
                                    <input type="text" name="title" value="<?php echo $row['title'];?>"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('amount');?></label>
                                <div class="controls">
                                    <input type="text" name="amount" value="<?php echo $row['amount'];?>"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('description');?></label>
                                <div class="controls">
                                    <div class="box closable-chat-box">
                                        <div class="box-content padded">
                                                <div class="chat-message-box">
                                                <textarea name="description" id="ttt" rows="5" placeholder="<?php echo get_phrase('add_description');?>"><?php echo $row['description'];?></textarea>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('status');?></label>
                                <div class="controls">
                                    <select name="status" class="uniform">
                                       	<option value="paid" <?php if($row['status']=='paid')echo 'selected';?>><?php echo get_phrase('paid');?></option>
                                       	<option value="unpaid" <?php if($row['status']=='unpaid')echo 'selected';?>><?php echo get_phrase('unpaid');?></option>
									</select>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('edit_invoice');?></button>
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
                    		<th><div><?php echo get_phrase('invoice_id');?></div></th>
                    		<th><div><?php echo get_phrase('title');?></div></th>
                    		<th><div><?php echo get_phrase('amount');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('date');?></div></th>
                    		<th><div><?php echo get_phrase('status');?></div></th>
                    		<th><div><?php echo get_phrase('option');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php $count = 1;foreach($invoices as $row):?>
                        <tr>
                            <td class="center"><?php echo $count++;?></td>
                            <td class="center"><?php echo $row['invoice_id'];?></td>
                            <td><?php echo $row['title'];?></td>
                            <td class="center"><?php echo $row['amount'];?></td>
							<td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
                            <td class="center"><?php echo date('d M,Y', $row['creation_timestamp']);?></td>
                            <td class="center">
                            	<?php if($row['status']=='paid'):?>
                            		<span class="label label-green"><?php echo get_phrase('paid');?></span>
                                <?php endif;?>
                                <?php if($row['status']=='unpaid'):?>
                            		<span class="label label-red"><?php echo get_phrase('unpaid');?></span>
                                    
                                    <!-----take cash payment-->
                                    <?php echo form_open('accountant/take_cash_payment' , array(
										'onsubmit' => "return confirm('Confirm cash payment ? It will mark this invoice as paid')"));?>
                                        	<input name="payment_type" 	type="hidden" value="<?php echo $row['title'];?>" />
                                        	<input name="invoice_id"   	type="hidden" value="<?php echo $row['invoice_id'];?>" />
                                        	<input name="patient_id" 	type="hidden" value="<?php echo $row['patient_id'];?>" />
                                        	<input name="method" 		type="hidden" value="cash" />
                                        	<input name="description" 	type="hidden" value="<?php echo $row['description'];?>" />
                                        	<input name="amount" 		type="hidden" value="<?php echo $row['amount'];?>" />
                                    		<input name="" type="submit" value="<?php echo get_phrase('take_cash_payment');?>" class="btn btn-gray btn-mini"/>
                                    <?php echo form_close();?>
                                    
                                <?php endif;?>
							<td align="center">
                            	<a href="<?php echo base_url();?>index.php?accountant/manage_invoice/edit/<?php echo $row['invoice_id'];?>"
                                	rel="tooltip" data-placement="top" data-original-title="<?php echo get_phrase('edit');?>" class="btn btn-blue">
                                		<i class="icon-wrench"></i>
                                </a>
                            	<a href="<?php echo base_url();?>index.php?accountant/manage_invoice/delete/<?php echo $row['invoice_id'];?>" onclick="return confirm('delete?')"
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
                    <?php echo form_open('accountant/manage_invoice/create' , array('class' => 'form-horizontal validatable'));?>
                        <div class="padded">
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
                                <label class="control-label"><?php echo get_phrase('title');?></label>
                                <div class="controls">
                                    <input type="text" name="title" value=""/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><?php echo get_phrase('amount');?></label>
                                <div class="controls">
                                    <input type="text" name="amount" value=""/>
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
                                <label class="control-label"><?php echo get_phrase('status');?></label>
                                <div class="controls">
                                    <select name="status" class="uniform">
                                       	<option value="unpaid"><?php echo get_phrase('unpaid');?></option>
                                       	<option value="paid"><?php echo get_phrase('paid');?></option>
									</select>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-blue"><?php echo get_phrase('add_invoice');?></button>
                        </div>
                    <?php echo form_close();?>                
                </div>                
			</div>
			<!----CREATION FORM ENDS--->
            
		</div>
	</div>
</div>

