<div class="box">
	<div class="box-header">
    
    	<!------CONTROL TABS START------->
		<ul class="nav nav-tabs nav-tabs-left">
			<li class="active">
            	<a href="#list" data-toggle="tab"><i class="icon-align-justify"></i> 
					<?php echo get_phrase('view_payment');?>
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
                    		<th><div><?php echo get_phrase('time');?></div></th>
                    		<th><div><?php echo get_phrase('amount');?></div></th>
                    		<th><div><?php echo get_phrase('payment_type');?></div></th>
                    		<th><div><?php echo get_phrase('transaction_id');?></div></th>
                    		<th><div><?php echo get_phrase('invoice_id');?></div></th>
                    		<th><div><?php echo get_phrase('patient');?></div></th>
                    		<th><div><?php echo get_phrase('method');?></div></th>
                    		<th><div><?php echo get_phrase('description');?></div></th>
						</tr>
					</thead>
                    <tbody>
                    	<?php 
						$count = 1;
						foreach($payments as $row):
							?>
							<tr>
								<td><?php echo $count++;?></td>
								<td><?php echo date('d M,Y', $row['timestamp']);?></td>
								<td><?php echo $row['amount'];?></td>
								<td><?php echo $row['payment_type'];?></td>
								<td><?php echo $row['transaction_id'];?></td>
								<td><?php echo $row['invoice_id'];?></td>
                                <td><?php echo $this->crud_model->get_type_name_by_id('patient',$row['patient_id'],'name');?></td>
								<td><?php echo $row['method'];?></td>
								<td><?php echo $row['description'];?></td>
							</tr>
							<?php 
						endforeach;
						?>
                    </tbody>
                </table>
			</div>
            <!----TABLE LISTING ENDS--->
		</div>
	</div>
</div>