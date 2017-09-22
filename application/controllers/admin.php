<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

/*	
 *	Hospital Management system
 */

class Admin extends CI_Controller
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
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($this->session->userdata('admin_login') == 1)
			redirect(base_url() . 'index.php?admin/dashboard', 'refresh');
	}
	
	/***ADMIN DASHBOARD***/
	function dashboard()
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		$page_data['page_name']  = 'dashboard';
		$page_data['page_title'] = get_phrase('admin_dashboard');
		$this->load->view('index', $page_data);
	}
	
	/***DEPARTMENTS OF DOCTORS********/
	function manage_department($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['name']        = $this->input->post('name');
			$data['description'] = $this->input->post('description');
			$this->db->insert('department', $data);
			$this->session->set_flashdata('flash_message', get_phrase('department_opened'));
			redirect(base_url() . 'index.php?admin/manage_department', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']        = $this->input->post('name');
			$data['description'] = $this->input->post('description');
			$this->db->where('department_id', $param3);
			$this->db->update('department', $data);
			$this->session->set_flashdata('flash_message', get_phrase('department_updated'));
			redirect(base_url() . 'index.php?admin/manage_department', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('department', array(
				'department_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('department_id', $param2);
			$this->db->delete('department');
			$this->session->set_flashdata('flash_message', get_phrase('department_deleted'));
			redirect(base_url() . 'index.php?admin/manage_department', 'refresh');
		}
		$page_data['page_name']   = 'manage_department';
		$page_data['page_title']  = get_phrase('manage_department');
		$page_data['departments'] = $this->db->get('department')->result_array();
		$this->load->view('index', $page_data);
		
	}
	/***Manage doctors**/
	function manage_doctor($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['name']          = $this->input->post('name');
			$data['email']         = $this->input->post('email');
			$data['password']      = $this->input->post('password');
			$data['address']       = $this->input->post('address');
			$data['phone']         = $this->input->post('phone');
			$data['department_id'] = $this->input->post('department_id');
			$data['profile']       = $this->input->post('profile');
			$this->db->insert('doctor', $data);
			$this->email_model->account_opening_email('doctor', $data['email']); //SEND EMAIL ACCOUNT OPENING EMAIL
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			
			redirect(base_url() . 'index.php?admin/manage_doctor', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']          = $this->input->post('name');
			$data['email']         = $this->input->post('email');
			$data['password']      = $this->input->post('password');
			$data['address']       = $this->input->post('address');
			$data['phone']         = $this->input->post('phone');
			$data['department_id'] = $this->input->post('department_id');
			$data['profile']       = $this->input->post('profile');
			
			$this->db->where('doctor_id', $param3);
			$this->db->update('doctor', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_doctor', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('doctor', array(
				'doctor_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('doctor_id', $param2);
			$this->db->delete('doctor');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			
			redirect(base_url() . 'index.php?admin/manage_doctor', 'refresh');
		}
		$page_data['page_name']  = 'manage_doctor';
		$page_data['page_title'] = get_phrase('manage_doctor');
		$page_data['doctors']    = $this->db->get('doctor')->result_array();
		$this->load->view('index', $page_data);
		
	}
	
	/***Manage patients**/
	function manage_patient($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['name']                      = $this->input->post('name');
			$data['email']                     = $this->input->post('email');
			$data['password']                  = $this->input->post('password');
			$data['address']                   = $this->input->post('address');
			$data['phone']                     = $this->input->post('phone');
			$data['sex']                       = $this->input->post('sex');
			$data['birth_date']                = $this->input->post('birth_date');
			$data['age']                       = $this->input->post('age');
			$data['blood_group']               = $this->input->post('blood_group');
			$data['account_opening_timestamp'] = strtotime(date('Y-m-d') . ' ' . date('H:i:s'));
			$this->db->insert('patient', $data);
			$this->email_model->account_opening_email('patient', $data['email']); //SEND EMAIL ACCOUNT OPENING EMAIL
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			
			redirect(base_url() . 'index.php?admin/manage_patient', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']        = $this->input->post('name');
			$data['email']       = $this->input->post('email');
			$data['password']    = $this->input->post('password');
			$data['address']     = $this->input->post('address');
			$data['phone']       = $this->input->post('phone');
			$data['sex']         = $this->input->post('sex');
			$data['birth_date']  = $this->input->post('birth_date');
			$data['age']         = $this->input->post('age');
			$data['blood_group'] = $this->input->post('blood_group');
			
			$this->db->where('patient_id', $param3);
			$this->db->update('patient', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_patient', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('patient', array(
				'patient_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('patient_id', $param2);
			$this->db->delete('patient');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			
			redirect(base_url() . 'index.php?admin/manage_patient', 'refresh');
		}
		$page_data['page_name']  = 'manage_patient';
		$page_data['page_title'] = get_phrase('manage_patient');
		$page_data['patients']   = $this->db->get('patient')->result_array();
		$this->load->view('index', $page_data);
	}
	
	
	/***Manage nurses**/
	function manage_nurse($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->insert('nurse', $data);
			$this->email_model->account_opening_email('nurse', $data['email']); //SEND EMAIL ACCOUNT OPENING EMAIL
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			
			redirect(base_url() . 'index.php?admin/manage_nurse', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->where('nurse_id', $param3);
			$this->db->update('nurse', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_nurse', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('nurse', array(
				'nurse_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('nurse_id', $param2);
			$this->db->delete('nurse');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			
			redirect(base_url() . 'index.php?admin/manage_nurse', 'refresh');
		}
		$page_data['page_name']  = 'manage_nurse';
		$page_data['page_title'] = get_phrase('manage_nurse');
		$page_data['nurses']     = $this->db->get('nurse')->result_array();
		$this->load->view('index', $page_data);
		
	}
	
	/***Manage pharmacists**/
	function manage_pharmacist($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->insert('pharmacist', $data);
			$this->email_model->account_opening_email('pharmacist', $data['email']); //SEND EMAIL ACCOUNT OPENING EMAIL
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			redirect(base_url() . 'index.php?admin/manage_pharmacist', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->where('pharmacist_id', $param3);
			$this->db->update('pharmacist', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_pharmacist', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('pharmacist', array(
				'pharmacist_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('pharmacist_id', $param2);
			$this->db->delete('pharmacist');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			
			redirect(base_url() . 'index.php?admin/manage_pharmacist', 'refresh');
		}
		$page_data['page_name']   = 'manage_pharmacist';
		$page_data['page_title']  = get_phrase('manage_pharmacist');
		$page_data['pharmacists'] = $this->db->get('pharmacist')->result_array();
		$this->load->view('index', $page_data);
		
	}
	
	/***Manage laboratorists**/
	function manage_laboratorist($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->insert('laboratorist', $data);
			$this->email_model->account_opening_email('laboratorist', $data['email']); //SEND EMAIL ACCOUNT OPENING EMAIL
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			redirect(base_url() . 'index.php?admin/manage_laboratorist', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->where('laboratorist_id', $param3);
			$this->db->update('laboratorist', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_laboratorist', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('laboratorist', array(
				'laboratorist_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('laboratorist_id', $param2);
			$this->db->delete('laboratorist');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			redirect(base_url() . 'index.php?admin/manage_laboratorist', 'refresh');
		}
		$page_data['page_name']     = 'manage_laboratorist';
		$page_data['page_title']    = get_phrase('manage_laboratorist');
		$page_data['laboratorists'] = $this->db->get('laboratorist')->result_array();
		$this->load->view('index', $page_data);
	}
	/***Manage accountants**/
	function manage_accountant($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->insert('accountant', $data);
			$this->email_model->account_opening_email('accountant', $data['email']); //SEND EMAIL ACCOUNT OPENING EMAIL
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			
			redirect(base_url() . 'index.php?admin/manage_accountant', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']     = $this->input->post('name');
			$data['email']    = $this->input->post('email');
			$data['password'] = $this->input->post('password');
			$data['address']  = $this->input->post('address');
			$data['phone']    = $this->input->post('phone');
			$this->db->where('accountant_id', $param3);
			$this->db->update('accountant', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			redirect(base_url() . 'index.php?admin/manage_accountant', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('accountant', array(
				'accountant_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('accountant_id', $param2);
			$this->db->delete('accountant');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			redirect(base_url() . 'index.php?admin/manage_accountant', 'refresh');
		}
		$page_data['page_name']   = 'manage_accountant';
		$page_data['page_title']  = get_phrase('manage_accountant');
		$page_data['accountants'] = $this->db->get('accountant')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*******VIEW APPOINTMENT REPORT	********/
	function view_appointment($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']    = 'view_appointment';
		$page_data['page_title']   = get_phrase('view_appointment');
		$page_data['appointments'] = $this->db->get('appointment')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*******VIEW PAYMENT REPORT	********/
	function view_payment($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']  = 'view_payment';
		$page_data['page_title'] = get_phrase('view_payment');
		$page_data['payments']   = $this->db->get('payment')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*******VIEW BED STATUS	********/
	function view_bed_status($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']      = 'view_bed_status';
		$page_data['page_title']     = get_phrase('view_blood_bank');
		$page_data['bed_allotments'] = $this->db->get('bed_allotment')->result_array();
		$page_data['beds']           = $this->db->get('bed')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*******VIEW BLOOD BANK	********/
	function view_blood_bank($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']    = 'view_blood_bank';
		$page_data['page_title']   = get_phrase('view_blood_bank');
		$page_data['blood_donors'] = $this->db->get('blood_donor')->result_array();
		$page_data['blood_bank']   = $this->db->get('blood_bank')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*******VIEW MEDICINE********/
	function view_medicine($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']  = 'view_medicine';
		$page_data['page_title'] = get_phrase('view_medicine');
		$page_data['medicines']  = $this->db->get('medicine')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*******VIEW MEDICINE********/
	function view_report($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']   = 'view_report';
		$page_data['page_title']  = get_phrase('view_' . $param1 . '_report');
		$page_data['report_type'] = $param1;
		$page_data['reports']     = $this->db->get_where('report', array(
			'type' => $param1
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
	/***MANAGE EMAIL TEMPLATE**/
	function manage_email_template($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param2 == 'do_update') {
			$this->db->where('task', $param1);
			$this->db->update('email_template', array(
				'body' => $this->input->post('body'),
				'subject' => $this->input->post('subject')
			));
			$this->session->set_flashdata('flash_message', get_phrase('template_updated'));
			redirect(base_url() . 'index.php?admin/manage_email_template/' . $param1, 'refresh');
		}
		$page_data['page_name']     = 'manage_email_template';
		$page_data['page_title']    = get_phrase('manage_email_template');
		$page_data['template']      = $this->db->get_where('email_template', array(
			'task' => $param1
		))->result_array();
		$page_data['template_task'] = $param1;
		$this->load->view('index', $page_data);
	}
	
	/***MANAGE NOTICEBOARD, WILL BE SEEN BY ALL ACCOUNTS DASHBOARD**/
	function manage_noticeboard($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'create') {
			$data['notice_title']     = $this->input->post('notice_title');
			$data['notice']           = $this->input->post('notice');
			$data['create_timestamp'] = strtotime($this->input->post('create_timestamp'));
			$this->db->insert('noticeboard', $data);
			$this->session->set_flashdata('flash_message', get_phrase('report_created'));
			
			redirect(base_url() . 'index.php?admin/manage_noticeboard', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['notice_title']     = $this->input->post('notice_title');
			$data['notice']           = $this->input->post('notice');
			$data['create_timestamp'] = strtotime($this->input->post('create_timestamp'));
			$this->db->where('notice_id', $param3);
			$this->db->update('noticeboard', $data);
			$this->session->set_flashdata('flash_message', get_phrase('notice_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_noticeboard', 'refresh');
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('noticeboard', array(
				'notice_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('notice_id', $param2);
			$this->db->delete('noticeboard');
			$this->session->set_flashdata('flash_message', get_phrase('notice_deleted'));
			
			redirect(base_url() . 'index.php?admin/manage_noticeboard', 'refresh');
		}
		$page_data['page_name']  = 'manage_noticeboard';
		$page_data['page_title'] = get_phrase('manage_noticeboard');
		$page_data['notices']    = $this->db->get('noticeboard')->result_array();
		$this->load->view('index', $page_data);
	}
	
	
	/*****SITE/SYSTEM SETTINGS*********/
	function system_settings($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param2 == 'do_update') {
			$this->db->where('type', $param1);
			$this->db->update('settings', array(
				'description' => $this->input->post('description')
			));
			$this->session->set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'index.php?admin/system_settings/', 'refresh');
		}
		if ($param1 == 'upload_logo') {
			move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/logo.png');
			$this->session->set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'index.php?admin/system_settings/', 'refresh');
		}
		$page_data['page_name']  = 'system_settings';
		$page_data['page_title'] = get_phrase('system_settings');
		$page_data['settings']   = $this->db->get('settings')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*****LANGUAGE SETTINGS*********/
	function manage_language($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'edit_phrase') {
			$page_data['edit_profile'] 	= $param2;	
		}
		if ($param1 == 'update_phrase') {
			$language	=	$param2;
			$total_phrase	=	$this->input->post('total_phrase');
			for($i = 1 ; $i < $total_phrase ; $i++)
			{
				//$data[$language]	=	$this->input->post('phrase').$i;
				$this->db->where('phrase_id' , $i);
				$this->db->update('language' , array($language => $this->input->post('phrase'.$i)));
			}
			redirect(base_url() . 'index.php?admin/manage_language/edit_phrase/'.$language, 'refresh');
		}
		if ($param1 == 'do_update') {
			$language        = $this->input->post('language');
			$data[$language] = $this->input->post('phrase');
			$this->db->where('phrase_id', $param2);
			$this->db->update('language', $data);
			$this->session->set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'index.php?admin/manage_language/', 'refresh');
		}
		if ($param1 == 'add_phrase') {
			$data['phrase'] = $this->input->post('phrase');
			$this->db->insert('language', $data);
			$this->session->set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'index.php?admin/manage_language/', 'refresh');
		}
		if ($param1 == 'add_language') {
			$language = $this->input->post('language');
			$this->load->dbforge();
			$fields = array(
				$language => array(
					'type' => 'LONGTEXT'
				)
			);
			$this->dbforge->add_column('language', $fields);
			
			$this->session->set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'index.php?admin/manage_language/', 'refresh');
		}
		if ($param1 == 'delete_language') {
			$language = $param2;
			$this->load->dbforge();
			$this->dbforge->drop_column('language', $language);
			$this->session->set_flashdata('flash_message', get_phrase('settings_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_language/', 'refresh');
		}
		$page_data['page_name']        = 'manage_language';
		$page_data['page_title']       = get_phrase('manage_language');
		//$page_data['language_phrases'] = $this->db->get('language')->result_array();
		$this->load->view('index', $page_data);
	}
	
	
	/*****BACKUP / RESTORE / DELETE DATA PAGE**********/
	function backup_restore($operation = '', $type = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect('login', 'refresh');
		
		if ($operation == 'create') {
			$this->crud_model->create_backup($type);
		}
		if ($operation == 'restore') {
			$this->crud_model->restore_backup();
			redirect(base_url() . 'index.php?admin/backup_restore/', 'refresh');
		}
		if ($operation == 'delete') {
			$this->crud_model->truncate($type);
			redirect(base_url() . 'index.php?admin/backup_restore/', 'refresh');
		}
		
		$page_data['page_name']  = 'backup_restore';
		$page_data['page_title'] = get_phrase('backup_restore');
		$this->load->view('index', $page_data);
	}
	
	/******MANAGE OWN PROFILE AND CHANGE PASSWORD***/
	function manage_profile($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('admin_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'update_profile_info') {
			$data['name']    = $this->input->post('name');
			$data['email']   = $this->input->post('email');
			$data['address'] = $this->input->post('address');
			$data['phone']   = $this->input->post('phone');
			
			$this->db->where('admin_id', $this->session->userdata('admin_id'));
			$this->db->update('admin', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			
			redirect(base_url() . 'index.php?admin/manage_profile/', 'refresh');
		}
		if ($param1 == 'change_password') {
			$data['password']             = $this->input->post('password');
			$data['new_password']         = $this->input->post('new_password');
			$data['confirm_new_password'] = $this->input->post('confirm_new_password');
			
			$current_password = $this->db->get_where('admin', array(
				'admin_id' => $this->session->userdata('admin_id')
			))->row()->password;
			if ($current_password == $data['password'] && $data['new_password'] == $data['confirm_new_password']) {
				$this->db->where('admin_id', $this->session->userdata('admin_id'));
				$this->db->update('admin', array(
					'password' => $data['new_password']
				));
				$this->session->set_flashdata('flash_message', get_phrase('password_updated'));
			} else {
				$this->session->set_flashdata('flash_message', get_phrase('password_mismatch'));
			}
			
			redirect(base_url() . 'index.php?admin/manage_profile/', 'refresh');
		}
		$page_data['page_name']    = 'manage_profile';
		$page_data['page_title']   = get_phrase('manage_profile');
		$page_data['edit_profile'] = $this->db->get_where('admin', array(
			'admin_id' => $this->session->userdata('admin_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
}
