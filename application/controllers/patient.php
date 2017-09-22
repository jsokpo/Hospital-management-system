<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

/*	
 *	@author : Joyonto Roy
 *	date	: 1 August, 2013
 *	University Of Dhaka, Bangladesh
 *	Hospital Management system
 *	http://codecanyon.net/user/joyontaroy
 */

class Patient extends CI_Controller
{
	
	
	function __construct()
	{
		parent::__construct();
		$this->load->database();
		/*cache control*/
		$this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');
		$this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	}
	
	/***Default function, redirects to login page if no admin logged in yet***/
	public function index()
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($this->session->userdata('patient_login') == 1)
			redirect(base_url() . 'index.php?patient/dashboard', 'refresh');
	}
	
	/***patient DASHBOARD***/
	function dashboard()
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']  = 'dashboard';
		$page_data['page_title'] = get_phrase('patient_dashboard');
		$this->load->view('index', $page_data);
	}
	
	/***VIEW APPOINTMENTS******/
	function view_appointment($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']    = 'view_appointment';
		$page_data['page_title']   = get_phrase('view_appointment');
		$page_data['appointments'] = $this->db->get_where('appointment', array(
			'patient_id' => $this->session->userdata('patient_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
	
	/***MANAGE PRESCRIPTIONS******/
	function view_prescription($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('prescription', array(
				'prescription_id' => $param2
			))->result_array();
		}
		$page_data['page_name']     = 'view_prescription';
		$page_data['page_title']    = get_phrase('view_prescription');
		$page_data['prescriptions'] = $this->db->get_where('prescription', array(
			'patient_id' => $this->session->userdata('patient_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******VIEW DOCTOR LIST*****/
	function view_doctor($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']  = 'view_doctor';
		$page_data['page_title'] = get_phrase('view_doctor');
		$page_data['doctors']    = $this->db->get('doctor')->result_array();
		
		$this->load->view('index', $page_data);
	}
	
	/******VIEW ADMIT HISTORY*****/
	function view_admit_history($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']      = 'view_admit_history';
		$page_data['page_title']     = get_phrase('view_admit_history');
		$page_data['bed_allotments'] = $this->db->get_where('bed_allotment', array(
			'patient_id' => $this->session->userdata('patient_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******VIEW BLOOD BANK*****/
	function view_blood_bank($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']    = 'view_blood_bank';
		$page_data['page_title']   = get_phrase('view_blood_bank');
		$page_data['blood_donors'] = $this->db->get('blood_donor')->result_array();
		$page_data['blood_bank']   = $this->db->get('blood_bank')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******MANAGE BILLING/ MAKE PAYMENT*****/
	function view_invoice($param1 = '', $param2 = '', $param3 = '')
	{
		//if($this->session->userdata('patient_login')!=1)redirect(base_url().'index.php?login' , 'refresh');
		if ($param1 == 'make_payment') {
			$invoice_id      = $this->input->post('invoice_id');
			$system_settings = $this->db->get_where('settings', array(
				'type' => 'paypal_email'
			))->row();
			$invoice_details = $this->db->get_where('invoice', array(
				'invoice_id' => $invoice_id
			))->row();
			
			/****TRANSFERRING USER TO PAYPAL TERMINAL****/
			$this->paypal->add_field('rm', 2);
			$this->paypal->add_field('no_note', 0);
			$this->paypal->add_field('item_name', $invoice_details->title);
			$this->paypal->add_field('amount', $invoice_details->amount);
			$this->paypal->add_field('custom', $invoice_details->invoice_id);
			$this->paypal->add_field('business', $system_settings->description);
			$this->paypal->add_field('notify_url', base_url() . 'index.php?patient/view_invoice/paypal_ipn');
			$this->paypal->add_field('cancel_return', base_url() . 'index.php?patient/view_invoice/paypal_cancel');
			$this->paypal->add_field('return', base_url() . 'index.php?patient/view_invoice/paypal_success');
			
			$this->paypal->submit_paypal_post();
			// submit the fields to paypal
		}
		if ($param1 == 'paypal_ipn') {
			if ($this->paypal->validate_ipn() == true) {
				$ipn_response = '';
				foreach ($_POST as $key => $value) {
					$value = urlencode(stripslashes($value));
					$ipn_response .= "\n$key=$value";
				}
				$invoice_id     = $_POST['custom'];
				$data['status'] = 'paid';
				$this->db->where('invoice_id', $invoice_id);
				$this->db->update('invoice', $data);
				
				$data2['transaction_id'] = rand(10000, 100000);
				$data2['invoice_id']     = $invoice_id;
				$data2['patient_id']     = $this->crud_model->get_type_name_by_id('invoice', $invoice_id, 'patient_id');
				$data2['payment_method'] = 'paypal';
				$data2['description']    = $ipn_response;
				$data2['amount']         = $this->crud_model->get_type_name_by_id('invoice', $invoice_id, 'amount');
				$data2['timestamp']      = strtotime(date("m/d/Y"));
				
				$this->db->insert('payment', $data2);
			}
		}
		if ($param1 == 'paypal_cancel') {
			$this->session->set_flashdata('flash_message', get_phrase('payment_cancelled'));
			redirect(base_url() . 'index.php?patient/view_invoice/', 'refresh');
		}
		if ($param1 == 'paypal_success') {
			$this->session->set_flashdata('flash_message', get_phrase('payment_successfull'));
			redirect(base_url() . 'index.php?patient/view_invoice/', 'refresh');
		}
		
		$page_data['page_name']  = 'view_invoice';
		$page_data['page_title'] = get_phrase('view_invoice');
		$page_data['invoices']   = $this->db->get_where('invoice', array(
			'patient_id' => $this->session->userdata('patient_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******VIEW COMPLETED PAYMENT HISTORY*****/
	function payment_history($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']  = 'payment_history';
		$page_data['page_title'] = get_phrase('payment_history');
		$page_data['payments']   = $this->db->get_where('payment', array(
			'patient_id' => $this->session->userdata('patient_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******VIEW OPERATION HISTORY*****/
	function view_operation_history($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']  = 'view_operation_history';
		$page_data['page_title'] = get_phrase('view_operation_history');
		$page_data['reports']    = $this->db->get_where('report', array(
			'patient_id' => $this->session->userdata('patient_id'),
			'type' => 'operation'
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
	
	/******MANAGE OWN PROFILE AND CHANGE PASSWORD***/
	function manage_profile($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('patient_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($param1 == 'update_profile_info') {
			$data['name']        = $this->input->post('name');
			$data['email']       = $this->input->post('email');
			$data['address']     = $this->input->post('address');
			$data['phone']       = $this->input->post('phone');
			$data['sex']         = $this->input->post('sex');
			$data['birth_date']  = $this->input->post('birth_date');
			$data['age']         = $this->input->post('age');
			$data['blood_group'] = $this->input->post('blood_group');
			
			$this->db->where('patient_id', $this->session->userdata('patient_id'));
			$this->db->update('patient', $data);
			$this->session->set_flashdata('flash_message', get_phrase('profile_updated'));
			redirect(base_url() . 'index.php?patient/manage_profile/', 'refresh');
		}
		if ($param1 == 'change_password') {
			$data['password']             = $this->input->post('password');
			$data['new_password']         = $this->input->post('new_password');
			$data['confirm_new_password'] = $this->input->post('confirm_new_password');
			
			$current_password = $this->db->get_where('patient', array(
				'patient_id' => $this->session->userdata('patient_id')
			))->row()->password;
			if ($current_password == $data['password'] && $data['new_password'] == $data['confirm_new_password']) {
				$this->db->where('patient_id', $this->session->userdata('patient_id'));
				$this->db->update('patient', array(
					'password' => $data['new_password']
				));
				$this->session->set_flashdata('flash_message', get_phrase('password_updated'));
			} else {
				$this->session->set_flashdata('flash_message', get_phrase('password_mismatch'));
			}
			redirect(base_url() . 'index.php?patient/manage_profile/', 'refresh');
		}
		$page_data['page_name']    = 'manage_profile';
		$page_data['page_title']   = get_phrase('manage_profile');
		$page_data['edit_profile'] = $this->db->get_where('patient', array(
			'patient_id' => $this->session->userdata('patient_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
}