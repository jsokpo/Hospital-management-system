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

class laboratorist extends CI_Controller
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
		if ($this->session->userdata('laboratorist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($this->session->userdata('laboratorist_login') == 1)
			redirect(base_url() . 'index.php?laboratorist/dashboard', 'refresh');
	}
	
	/***laboratorist DASHBOARD***/
	function dashboard()
	{
		if ($this->session->userdata('laboratorist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		$page_data['page_name']  = 'dashboard';
		$page_data['page_title'] = get_phrase('laboratorist_dashboard');
		$this->load->view('index', $page_data);
	}
	
	
	
	
	/***MANAGE PRESCRIPTIONS******/
	function view_prescription($prescription_id = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('laboratorist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name']           = 'view_prescription';
		$page_data['page_title']          = get_phrase('view_prescription');
		$page_data['prescription_detail'] = $this->db->get_where('prescription', array(
			'prescription_id' => $prescription_id
		))->result_array();
		$page_data['prescriptions']       = $this->db->get('prescription')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/***MANAGE PRESCRIPTIONS*(UPLOAD/DELETE) DIAGNOSIS REPORTS OF A CERTAIN PRESCRIPTION*****/
	function manage_prescription($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('laboratorist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'create_diagnosis_report') {
			$data['report_type']     = $this->input->post('report_type');
			$data['document_type']   = $this->input->post('document_type');
			$data['prescription_id'] = $this->input->post('prescription_id');
			$data['description']     = $this->input->post('description');
			$data['timestamp']       = strtotime(date('Y-m-d') . ' ' . date('H:i:s'));
			$data['laboratorist_id'] = $this->session->userdata('laboratorist_id');
			move_uploaded_file($_FILES["userfile"]["tmp_name"], "uploads/diagnosis_report/" . $_FILES["userfile"]["name"]);
			$data['file_name'] = $_FILES["userfile"]["name"];
			
			$this->db->insert('diagnosis_report', $data);
			$this->session->set_flashdata('flash_message', get_phrase('diagnosis_report_created'));
			redirect(base_url() . 'index.php?laboratorist/manage_prescription/edit/' . $this->input->post('prescription_id'), 'refresh');
		}
		
		if ($param1 == 'delete_diagnosis_report') {
			$this->db->where('diagnosis_report_id', $param2);
			$this->db->delete('diagnosis_report');
			$this->session->set_flashdata('flash_message', get_phrase('diagnosis_report_deleted'));
			redirect(base_url() . 'index.php?laboratorist/manage_prescription/edit/' . $param3, 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('prescription', array(
				'prescription_id' => $param2
			))->result_array();
		}
		$page_data['page_name']     = 'manage_prescription';
		$page_data['page_title']    = get_phrase('manage_prescription');
		$page_data['prescriptions'] = $this->db->get('prescription')->result_array();
		$this->load->view('index', $page_data);
	}
	
	
	/*******WATCH AND MANAGE STATUS OF BLOOD GROUPS AND THEIR AVAILABLE AMOUNT OF BAGS********/
	function manage_blood_bank($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('laboratorist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['status'] = $this->input->post('status');
			$this->db->where('blood_group_id', $param3);
			$this->db->update('blood_bank', $data);
			$this->session->set_flashdata('flash_message', get_phrase('blood_status_updated'));
			redirect(base_url() . 'index.php?laboratorist/manage_blood_bank', 'refresh');
			
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
		if ($this->session->userdata('laboratorist_login') != 1)
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
			redirect(base_url() . 'index.php?laboratorist/manage_blood_donor', 'refresh');
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
			redirect(base_url() . 'index.php?laboratorist/manage_blood_donor', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('blood_donor', array(
				'blood_donor_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('blood_donor_id', $param2);
			$this->db->delete('blood_donor');
			$this->session->set_flashdata('flash_message', get_phrase('account_deleted'));
			redirect(base_url() . 'index.php?laboratorist/manage_blood_donor', 'refresh');
		}
		$page_data['page_name']    = 'manage_blood_donor';
		$page_data['page_title']   = get_phrase('manage_blood_donor');
		$page_data['blood_donors'] = $this->db->get('blood_donor')->result_array();
		$this->load->view('index', $page_data);
	}
	
	
	
	
	
	/******MANAGE OWN PROFILE AND CHANGE PASSWORD***/
	function manage_profile($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('laboratorist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		if ($param1 == 'update_profile_info') {
			$data['name']    = $this->input->post('name');
			$data['email']   = $this->input->post('email');
			$data['address'] = $this->input->post('address');
			$data['phone']   = $this->input->post('phone');
			
			$this->db->where('laboratorist_id', $this->session->userdata('laboratorist_id'));
			$this->db->update('laboratorist', $data);
			$this->session->set_flashdata('flash_message', get_phrase('profile_updated'));
			redirect(base_url() . 'index.php?laboratorist/manage_profile/', 'refresh');
		}
		if ($param1 == 'change_password') {
			$data['password']             = $this->input->post('password');
			$data['new_password']         = $this->input->post('new_password');
			$data['confirm_new_password'] = $this->input->post('confirm_new_password');
			
			$current_password = $this->db->get_where('laboratorist', array(
				'laboratorist_id' => $this->session->userdata('laboratorist_id')
			))->row()->password;
			if ($current_password == $data['password'] && $data['new_password'] == $data['confirm_new_password']) {
				$this->db->where('laboratorist_id', $this->session->userdata('laboratorist_id'));
				$this->db->update('laboratorist', array(
					'password' => $data['new_password']
				));
				$this->session->set_flashdata('flash_message', get_phrase('password_updated'));
			} else {
				$this->session->set_flashdata('flash_message', get_phrase('password_mismatch'));
			}
			redirect(base_url() . 'index.php?laboratorist/manage_profile/', 'refresh');
		}
		$page_data['page_name']    = 'manage_profile';
		$page_data['page_title']   = get_phrase('manage_profile');
		$page_data['edit_profile'] = $this->db->get_where('laboratorist', array(
			'laboratorist_id' => $this->session->userdata('laboratorist_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
}