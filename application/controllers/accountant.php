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

class accountant extends CI_Controller
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
		if ($this->session->userdata('accountant_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($this->session->userdata('accountant_login') == 1)
			redirect(base_url() . 'index.php?accountant/dashboard', 'refresh');
	}
	
	/***accountant DASHBOARD***/
	function dashboard()
	{
		if ($this->session->userdata('accountant_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']  = 'dashboard';
		$page_data['page_title'] = get_phrase('accountant_dashboard');
		$this->load->view('index', $page_data);
	}
	
	/******VIEW BLOOD BANK*****/
	function view_blood_bank($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('accountant_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']    = 'view_blood_bank';
		$page_data['page_title']   = get_phrase('view_blood_bank');
		$page_data['blood_donors'] = $this->db->get('blood_donor')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******MANAGE BILLING / INVOICES WITH STATUS*****/
	function manage_invoice($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('accountant_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'create') {
			$data['patient_id']         = $this->input->post('patient_id');
			$data['title']              = $this->input->post('title');
			$data['description']        = $this->input->post('description');
			$data['amount']             = $this->input->post('amount');
			$data['creation_timestamp'] = strtotime(date('Y-m-d') . ' ' . date('H:i:s'));
			$data['status']             = $this->input->post('status');
			
			$this->db->insert('invoice', $data);
			$this->session->set_flashdata('flash_message', get_phrase('invoice_created'));
			redirect(base_url() . 'index.php?accountant/manage_invoice', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['patient_id']  = $this->input->post('patient_id');
			$data['title']       = $this->input->post('title');
			$data['description'] = $this->input->post('description');
			$data['amount']      = $this->input->post('amount');
			$data['status']      = $this->input->post('status');
			
			$this->db->where('invoice_id', $param3);
			$this->db->update('invoice', $data);
			$this->session->set_flashdata('flash_message', get_phrase('invoice_updated'));
			
			redirect(base_url() . 'index.php?accountant/manage_invoice', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('invoice', array(
				'invoice_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('invoice_id', $param2);
			$this->db->delete('invoice');
			$this->session->set_flashdata('flash_message', get_phrase('invoice_deleted'));
			redirect(base_url() . 'index.php?accountant/manage_invoice', 'refresh');
		}
		$page_data['page_name']  = 'manage_invoice';
		$page_data['page_title'] = get_phrase('manage_invoice');
		$this->db->order_by('creation_timestamp', 'desc');
		$page_data['invoices'] = $this->db->get('invoice')->result_array();
		
		$this->load->view('index', $page_data);
	}
	
	/******RECIEVE CASH/HAND 2 HAND PAYMENT AGAINST A CERTAIN INVOICE******/
	function take_cash_payment($invoice_id = '', $param2 = '')
	{
		if ($this->session->userdata('accountant_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$data['payment_type']   = $this->input->post('payment_type');
		$data['transaction_id'] = rand(100000, 1000000);
		$data['invoice_id']     = $this->input->post('invoice_id');
		$data['patient_id']     = $this->input->post('patient_id');
		$data['method']         = $this->input->post('method');
		$data['description']    = $this->input->post('description');
		$data['amount']         = $this->input->post('amount');
		$data['timestamp']      = strtotime(date('Y-m-d') . ' ' . date('H:i:s'));
		
		$this->db->insert('payment', $data);
		
		$this->db->where('invoice_id', $this->input->post('invoice_id'));
		$this->db->update('invoice', array(
			'status' => 'paid'
		));
		$this->session->set_flashdata('flash_message', get_phrase('payment_created'));
		redirect(base_url() . 'index.php?accountant/manage_invoice', 'refresh');
		
	}
	
	/******MANAGE BILLING/ MAKE PAYMENT*****/
	function view_payment($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('accountant_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']  = 'view_payment';
		$page_data['page_title'] = get_phrase('view_payment');
		$page_data['payments']   = $this->db->get_where('payment')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******MANAGE OWN PROFILE AND CHANGE PASSWORD***/
	function manage_profile($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('accountant_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($param1 == 'update_profile_info') {
			$data['name']    = $this->input->post('name');
			$data['email']   = $this->input->post('email');
			$data['address'] = $this->input->post('address');
			$data['phone']   = $this->input->post('phone');
			
			$this->db->where('accountant_id', $this->session->userdata('accountant_id'));
			$this->db->update('accountant', $data);
			$this->session->set_flashdata('flash_message', get_phrase('profile_updated'));
			redirect(base_url() . 'index.php?accountant/manage_profile/', 'refresh');
		}
		if ($param1 == 'change_password') {
			$data['password']             = $this->input->post('password');
			$data['new_password']         = $this->input->post('new_password');
			$data['confirm_new_password'] = $this->input->post('confirm_new_password');
			
			$current_password = $this->db->get_where('accountant', array(
				'accountant_id' => $this->session->userdata('accountant_id')
			))->row()->password;
			if ($current_password == $data['password'] && $data['new_password'] == $data['confirm_new_password']) {
				$this->db->where('accountant_id', $this->session->userdata('accountant_id'));
				$this->db->update('accountant', array(
					'password' => $data['new_password']
				));
				$this->session->set_flashdata('flash_message', get_phrase('password_updated'));
			} else {
				$this->session->set_flashdata('flash_message', get_phrase('password_mismatch'));
			}
			redirect(base_url() . 'index.php?accountant/manage_profile/', 'refresh');
		}
		$page_data['page_name']    = 'manage_profile';
		$page_data['page_title']   = get_phrase('manage_profile');
		$page_data['edit_profile'] = $this->db->get_where('accountant', array(
			'accountant_id' => $this->session->userdata('accountant_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
}