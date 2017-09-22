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

class Pharmacist extends CI_Controller
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
		if ($this->session->userdata('pharmacist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($this->session->userdata('pharmacist_login') == 1)
			redirect(base_url() . 'index.php?pharmacist/dashboard', 'refresh');
	}
	
	/***pharmacist DASHBOARD***/
	function dashboard()
	{
		if ($this->session->userdata('pharmacist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
			
		$page_data['page_name']  = 'dashboard';
		$page_data['page_title'] = get_phrase('pharmacist_dashboard');
		$this->load->view('index', $page_data);
	}
	
	/****MANAGE MEDICINE CATEGORIES*********/
	function manage_medicine_category($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('pharmacist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'create') {
			$data['name']        = $this->input->post('name');
			$data['description'] = $this->input->post('description');
			
			$this->db->insert('medicine_category', $data);
			$this->session->set_flashdata('flash_message', get_phrase('medicine_category_created'));
			redirect(base_url() . 'index.php?pharmacist/manage_medicine_category', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']        = $this->input->post('name');
			$data['description'] = $this->input->post('description');
			
			$this->db->where('medicine_category_id', $param3);
			$this->db->update('medicine_category', $data);
			$this->session->set_flashdata('flash_message', get_phrase('medicine_category_updated'));
			redirect(base_url() . 'index.php?pharmacist/manage_medicine_category', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('medicine_category', array(
				'medicine_category_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('medicine_category_id', $param2);
			$this->db->delete('medicine_category');
			$this->session->set_flashdata('flash_message', get_phrase('medicine_category_deleted'));
			redirect(base_url() . 'index.php?pharmacist/manage_medicine_category', 'refresh');
		}
		$page_data['page_name']           = 'manage_medicine_category';
		$page_data['page_title']          = get_phrase('manage_medicine_category');
		$page_data['medicine_categories'] = $this->db->get('medicine_category')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/****MANAGE MEDICINES CATEGORY WISE*********/
	function manage_medicine($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('pharmacist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'create') {
			$data['name']                  = $this->input->post('name');
			$data['medicine_category_id']  = $this->input->post('medicine_category_id');
			$data['description']           = $this->input->post('description');
			$data['price']                 = $this->input->post('price');
			$data['manufacturing_company'] = $this->input->post('manufacturing_company');
			$data['status']                = $this->input->post('status');
			
			$this->db->insert('medicine', $data);
			$this->session->set_flashdata('flash_message', get_phrase('medicine_created'));
			redirect(base_url() . 'index.php?pharmacist/manage_medicine', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['name']                  = $this->input->post('name');
			$data['medicine_category_id']  = $this->input->post('medicine_category_id');
			$data['description']           = $this->input->post('description');
			$data['price']                 = $this->input->post('price');
			$data['manufacturing_company'] = $this->input->post('manufacturing_company');
			$data['status']                = $this->input->post('status');
			
			$this->db->where('medicine_id', $param3);
			$this->db->update('medicine', $data);
			$this->session->set_flashdata('flash_message', get_phrase('medicine_updated'));
			redirect(base_url() . 'index.php?pharmacist/manage_medicine', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('medicine', array(
				'medicine_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('medicine_id', $param2);
			$this->db->delete('medicine');
			$this->session->set_flashdata('flash_message', get_phrase('medicine_deleted'));
			redirect(base_url() . 'index.php?pharmacist/manage_medicine', 'refresh');
		}
		$page_data['page_name']  = 'manage_medicine';
		$page_data['page_title'] = get_phrase('manage_medicine');
		$page_data['medicines']  = $this->db->get('medicine')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/***MANAGE PRESCRIPTIONS******/
	function manage_prescription($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('pharmacist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		if ($param1 == 'create') {
			$data['medication_from_pharmacist'] = $this->input->post('medication_from_pharmacist');
			$this->db->insert('prescription', $data);
			$this->session->set_flashdata('flash_message', get_phrase('prescription_created'));
			redirect(base_url() . 'index.php?pharmacist/manage_prescription', 'refresh');
		}
		if ($param1 == 'edit' && $param2 == 'do_update') {
			$data['medication_from_pharmacist'] = $this->input->post('medication_from_pharmacist');
			$this->db->where('prescription_id', $param3);
			$this->db->update('prescription', $data);
			$this->session->set_flashdata('flash_message', get_phrase('prescription_updated'));
			redirect(base_url() . 'index.php?pharmacist/manage_prescription', 'refresh');
			
		} else if ($param1 == 'edit') {
			$page_data['edit_profile'] = $this->db->get_where('prescription', array(
				'prescription_id' => $param2
			))->result_array();
		}
		if ($param1 == 'delete') {
			$this->db->where('prescription_id', $param2);
			$this->db->delete('prescription');
			$this->session->set_flashdata('flash_message', get_phrase('prescription_deleted'));
			redirect(base_url() . 'index.php?pharmacist/manage_prescription', 'refresh');
		}
		$page_data['page_name']     = 'manage_prescription';
		$page_data['page_title']    = get_phrase('manage_prescription');
		$page_data['prescriptions'] = $this->db->get('prescription')->result_array();
		$this->load->view('index', $page_data);
	}
	
	/******MANAGE OWN PROFILE AND CHANGE PASSWORD***/
	function manage_profile($param1 = '', $param2 = '', $param3 = '')
	{
		if ($this->session->userdata('pharmacist_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($param1 == 'update_profile_info') {
			$data['name']    = $this->input->post('name');
			$data['email']   = $this->input->post('email');
			$data['address'] = $this->input->post('address');
			$data['phone']   = $this->input->post('phone');
			
			$this->db->where('pharmacist_id', $this->session->userdata('pharmacist_id'));
			$this->db->update('pharmacist', $data);
			$this->session->set_flashdata('flash_message', get_phrase('profile_updated'));
			redirect(base_url() . 'index.php?pharmacist/manage_profile/', 'refresh');
		}
		if ($param1 == 'change_password') {
			$data['password']             = $this->input->post('password');
			$data['new_password']         = $this->input->post('new_password');
			$data['confirm_new_password'] = $this->input->post('confirm_new_password');
			
			$current_password = $this->db->get_where('pharmacist', array(
				'pharmacist_id' => $this->session->userdata('pharmacist_id')
			))->row()->password;
			if ($current_password == $data['password'] && $data['new_password'] == $data['confirm_new_password']) {
				$this->db->where('pharmacist_id', $this->session->userdata('pharmacist_id'));
				$this->db->update('pharmacist', array(
					'password' => $data['new_password']
				));
				$this->session->set_flashdata('flash_message', get_phrase('password_updated'));
			} else {
				$this->session->set_flashdata('flash_message', get_phrase('password_mismatch'));
			}
			redirect(base_url() . 'index.php?pharmacist/manage_profile/', 'refresh');
		}
		$page_data['page_name']    = 'manage_profile';
		$page_data['page_title']   = get_phrase('manage_profile');
		$page_data['edit_profile'] = $this->db->get_where('pharmacist', array(
			'pharmacist_id' => $this->session->userdata('pharmacist_id')
		))->result_array();
		$this->load->view('index', $page_data);
	}
}