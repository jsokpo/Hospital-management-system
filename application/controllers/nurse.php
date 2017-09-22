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

class Nurse extends CI_Controller
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
	
	/***Default function, redirects to login page if no nurse logged in yet***/
	public function index()
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($this->session->userdata('nurse_login') == 1)
			redirect(base_url() . 'index.php?nurse/dashboard', 'refresh');
	}
	
	/***nurse DASHBOARD***/
	function dashboard()
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']  = 'dashboard';
		$page_data['page_title'] = get_phrase('nurse_dashboard');
		$this->load->view('index', $page_data);
	}
	
	
	/***Manage patients**/
	function manage_patient($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('nurse_login') != 1)
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
			redirect(base_url() . 'index.php?nurse/manage_patient', 'refresh');
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
			redirect(base_url() . 'index.php?nurse/manage_patient', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('patient', array(
				'patient_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('patient_id', $param2);
			$this->db->delete('patient');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			redirect(base_url() . 'index.php?nurse/manage_program', 'refresh');
		}
		$page_data['page_name']  = 'manage_patient';
		$page_data['page_title'] = get_phrase('manage_patient');
		$page_data['patients']   = $this->db->get('patient')->result_array();
		$this->load->view('index', $page_data);
	}
	

	
	/*****LIST OF BED, MANAGE THIER TYPES********/
	function manage_bed($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create') {
			$data['bed_number']  = $this->input->post('bed_number');
			$data['type']        = $this->input->post('type');
			$data['description'] = $this->input->post('description');
			$this->db->insert('bed', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			redirect(base_url() . 'index.php?nurse/manage_bed', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['bed_number']  = $this->input->post('bed_number');
			$data['type']        = $this->input->post('type');
			$data['status']      = $this->input->post('status');
			$data['description'] = $this->input->post('description');
			$this->db->where('bed_id', $param3);
			$this->db->update('bed', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			redirect(base_url() . 'index.php?nurse/manage_bed', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('bed', array(
				'bed_id' => $param2
			))->result_array();
		}
		if ($param1 == 'view_bed_history') {
			$page_data['view_bed_history_id'] = $this->db->get_where('bed_allotment', array(
				'bed_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('bed_id', $param2);
			$this->db->delete('bed');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			redirect(base_url() . 'index.php?nurse/manage_bed', 'refresh');
		}
		$page_data['page_name']  = 'manage_bed';
		$page_data['page_title'] = get_phrase('manage_bed');
		$page_data['beds']       = $this->db->get('bed')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******ALLOT / DISCHARGE BED TO PATIENTS*****/
	function manage_bed_allotment($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		//create a new allotment only in available / unalloted beds. beds can be ward,cabin,icu,other types
		if ($param1 == 'create') {
			$data['bed_id']              = $this->input->post('bed_id');
			$data['patient_id']          = $this->input->post('patient_id');
			$data['allotment_timestamp'] = strtotime($this->input->post('allotment_timestamp'));
			$data['discharge_timestamp'] = strtotime($this->input->post('discharge_timestamp'));
			$this->db->insert('bed_allotment', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			redirect(base_url() . 'index.php?nurse/manage_bed_allotment', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['bed_id']              = $this->input->post('bed_id');
			$data['patient_id']          = $this->input->post('patient_id');
			$data['allotment_timestamp'] = strtotime($this->input->post('allotment_timestamp'));
			$data['discharge_timestamp'] = strtotime($this->input->post('discharge_timestamp'));
			$this->db->where('bed_allotment_id', $param3);
			$this->db->update('bed_allotment', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			redirect(base_url() . 'index.php?nurse/manage_bed_allotment', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('bed_allotment', array(
				'bed_allotment_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('bed_allotment_id', $param2);
			$this->db->delete('bed_allotment');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			redirect(base_url() . 'index.php?nurse/manage_bed_allotment', 'refresh');
		}
		$page_data['page_name']     = 'manage_bed_allotment';
		$page_data['page_title']    = get_phrase('manage_bed_allotment');
		$page_data['bed_allotment'] = $this->db->get('bed_allotment')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/*******WATCH AND MANAGE STATUS OF BLOOD GROUPS AND THEIR AVAILABLE AMOUNT OF BAGS********/
	function manage_blood_bank($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['status'] = $this->input->post('status');
			$this->db->where('blood_group_id', $param3);
			$this->db->update('blood_bank', $data);
			$this->session->set_flashdata('flash_message', get_phrase('blood_status_updated'));
			redirect(base_url() . 'index.php?nurse/manage_blood_bank', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('blood_bank', array(
				'blood_group_id' => $param2
			))->result_array();
		}
		$page_data['page_name']  = 'manage_blood_bank';
		$page_data['page_title'] = get_phrase('manage_blood_bank');
		$page_data['blood_bank'] = $this->db->get('blood_bank')->result_array();
		$this->load->view('index', $page_data);
	}

	
	/******MANAGE BLOOD DONORS*****/
	function manage_blood_donor($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		//create a new allotment only in available / unalloted beds. beds can be ward,cabin,icu,other types
		if ($param1 == 'create') {
			$data['name']                    = $this->input->post('name');
			$data['blood_group']             = $this->input->post('blood_group');
			$data['sex']                     = $this->input->post('sex');
			$data['age']                     = $this->input->post('age');
			$data['phone']                   = $this->input->post('phone');
			$data['email']                   = $this->input->post('email');
			$data['address']                 = $this->input->post('address');
			$data['last_donation_timestamp'] = strtotime($this->input->post('last_donation_timestamp'));
			$this->db->insert('blood_donor', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_opened'));
			redirect(base_url() . 'index.php?nurse/manage_blood_donor', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']                    = $this->input->post('name');
			$data['blood_group']             = $this->input->post('blood_group');
			$data['sex']                     = $this->input->post('sex');
			$data['age']                     = $this->input->post('age');
			$data['phone']                   = $this->input->post('phone');
			$data['email']                   = $this->input->post('email');
			$data['address']                 = $this->input->post('address');
			$data['last_donation_timestamp'] = strtotime($this->input->post('last_donation_timestamp'));
			$this->db->where('blood_donor_id', $param3);
			$this->db->update('blood_donor', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			redirect(base_url() . 'index.php?nurse/manage_blood_donor', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('blood_donor', array(
				'blood_donor_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('blood_donor_id', $param2);
			$this->db->delete('blood_donor');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			redirect(base_url() . 'index.php?nurse/manage_blood_donor', 'refresh');
		}
		$page_data['page_name']    = 'manage_blood_donor';
		$page_data['page_title']   = get_phrase('manage_blood_donor');
		$page_data['blood_donors'] = $this->db->get('blood_donor')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/***CREATE REPORT BIRTH,DEATH,OPERATION**/
	function manage_report($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		//create a new report baby birth,patient death, operation , other types
		if ($param1 == 'create') {
			$data['type']        = $this->input->post('type');
			$data['description'] = $this->input->post('description');
			$data['timestamp']   = strtotime(date('Y-m-d') . ' ' . date('H:i:s'));
			$data['doctor_id']   = $this->input->post('doctor_id');
			$data['patient_id']  = $this->input->post('patient_id');
			$this->db->insert('report', $data);
			$this->session->set_flashdata('flash_message', get_phrase('report_created'));
			redirect(base_url() . 'index.php?nurse/manage_report', 'refresh');
		}
		if ($param1 == 'delete') {
			$this->db->where('report_id', $param2);
			$this->db->delete('report');
			$this->session->set_flashdata('flash_message', get_phrase('report_deleted'));
			redirect(base_url() . 'index.php?nurse/manage_report', 'refresh');
		}
		$page_data['page_name']  = 'manage_report';
		$page_data['page_title'] = get_phrase('manage_report');
		$page_data['reports']    = $this->db->get('report')->result_array();
		$this->load->view('index', $page_data);
	}


	
	/******MANAGE OWN PROFILE AND CHANGE PASSWORD***/
	function manage_profile($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('nurse_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'update_profile_info') {
			$data['name']    = $this->input->post('name');
			$data['email']   = $this->input->post('email');
			$data['address'] = $this->input->post('address');
			$data['phone']   = $this->input->post('phone');
			
			$this->db->where('nurse_id', $this->session->userdata('nurse_id'));
			$this->db->update('nurse', $data);
			$this->session->set_flashdata('flash_message', get_phrase('account_updated'));
			redirect(base_url() . 'index.php?nurse/manage_profile/', 'refresh');
		}
		if ($param1 == 'change_password') {
			$data['password']             = $this->input->post('password');
			$data['new_password']         = $this->input->post('new_password');
			$data['confirm_new_password'] = $this->input->post('confirm_new_password');
			
			$current_password = $this->db->get_where('nurse', array(
				'nurse_id' => $this->session->userdata('nurse_id')
			))->row()->password;
			if ($current_password == $data['password'] && $data['new_password'] == $data['confirm_new_password']) {
				$this->db->where('nurse_id', $this->session->userdata('nurse_id'));
				$this->db->update('nurse', array(
					'password' => $data['new_password']
				));
				$this->session->set_flashdata('flash_message', get_phrase('password_updated'));
			} else {
				$this->session->set_flashdata('flash_message', get_phrase('password_mismatch'));
			}
			redirect(base_url() . 'index.php?nurse/manage_profile/', 'refresh');
		}
		$page_data['page_name']    = 'manage_profile';
		$page_data['page_title']   = get_phrase('manage_profile');
		$page_data['edit_profile'] = $this->db->get_where('nurse', array(
			'nurse_id' => $this->session->userdata('nurse_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
	
}
