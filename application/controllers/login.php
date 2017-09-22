<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Login extends CI_Controller
{
	
	
	function __construct()
	{
		parent::__construct();
		$this->load->database();
		/*cash control*/
		$this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');
		$this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		
	}
	
	/***default functin, redirects to login page if no admin logged in yet***/
	public function index()
	{
		if ($this->session->userdata('admin_login') == 1)
			redirect(base_url() . 'index.php?admin/dashboard', 'refresh');
		
		if ($this->session->userdata('doctor_login') == 1)
			redirect(base_url() . 'index.php?doctor/dashboard', 'refresh');
		
		if ($this->session->userdata('patient_login') == 1)
			redirect(base_url() . 'index.php?patient/dashboard', 'refresh');
		
		if ($this->session->userdata('nurse_login') == 1)
			redirect(base_url() . 'index.php?nurse/dashboard', 'refresh');
		
		if ($this->session->userdata('pharmacist_login') == 1)
			redirect(base_url() . 'index.php?pharmacist/dashboard', 'refresh');
		
		if ($this->session->userdata('laboratorist_login') == 1)
			redirect(base_url() . 'index.php?laboratorist/dashboard', 'refresh');
		
		if ($this->session->userdata('accountant_login') == 1)
			redirect(base_url() . 'index.php?accountant/dashboard', 'refresh');
		
		
		
		$config = array(
			array(
				'field' => 'login_type',
				'label' => 'Account Type',
				'rules' => 'required|xss_clean'
			),
			array(
				'field' => 'email',
				'label' => 'Email',
				'rules' => 'required|xss_clean|valid_email'
			),
			array(
				'field' => 'password',
				'label' => 'Password',
				'rules' => 'required|xss_clean|callback__validate_login'
			)
		);
		
		$this->form_validation->set_rules($config);
		$this->form_validation->set_message('_validate_login', ucfirst($this->input->post('login_type')) . ' Login failed!');
		$this->form_validation->set_error_delimiters('<div class="alert alert-error">
								<button type="button" class="close" data-dismiss="alert">×</button>', '</div>');
		
		if ($this->form_validation->run() == FALSE) {
			$this->load->view('login');
		} else {
			if ($this->session->userdata('admin_login') == 1)
				redirect(base_url() . 'index.php?admin/dashboard', 'refresh');
			
			if ($this->session->userdata('doctor_login') == 1)
				redirect(base_url() . 'index.php?doctor/dashboard', 'refresh');
			
			if ($this->session->userdata('patient_login') == 1)
				redirect(base_url() . 'index.php?patient/dashboard', 'refresh');
			
			if ($this->session->userdata('nurse_login') == 1)
				redirect(base_url() . 'index.php?nurse/dashboard', 'refresh');
			
			if ($this->session->userdata('pharmacist_login') == 1)
				redirect(base_url() . 'index.php?pharmacist/dashboard', 'refresh');
			
			if ($this->session->userdata('laboratorist_login') == 1)
				redirect(base_url() . 'index.php?laboratorist/dashboard', 'refresh');
			
			if ($this->session->userdata('accountant_login') == 1)
				redirect(base_url() . 'index.php?accountant/dashboard', 'refresh');
		}
		
	}
	
	/***validate login****/
	function _validate_login($str)
	{
		if ($this->input->post('login_type') == '') {
			$this->session->set_flashdata('flash_message', get_phrase('login_failed'));
			return FALSE;
		}
		$query = $this->db->get_where($this->input->post('login_type'), array(
			'email' => $this->input->post('email'),
			'password' => $this->input->post('password')
		));
		if ($query->num_rows() > 0) {
			$row = $query->row();
			if ($this->input->post('login_type') == 'admin') {
				$this->session->set_userdata('login_type', 'admin');
				$this->session->set_userdata('admin_login', '1');
				$this->session->set_userdata('admin_id', $row->admin_id);
			}
			if ($this->input->post('login_type') == 'doctor') {
				$this->session->set_userdata('login_type', 'doctor');
				$this->session->set_userdata('doctor_login', '1');
				$this->session->set_userdata('doctor_id', $row->doctor_id);
			}
			if ($this->input->post('login_type') == 'patient') {
				$this->session->set_userdata('login_type', 'patient');
				$this->session->set_userdata('patient_login', '1');
				$this->session->set_userdata('patient_id', $row->patient_id);
			}
			if ($this->input->post('login_type') == 'nurse') {
				$this->session->set_userdata('login_type', 'nurse');
				$this->session->set_userdata('nurse_login', '1');
				$this->session->set_userdata('nurse_id', $row->nurse_id);
			}
			if ($this->input->post('login_type') == 'pharmacist') {
				$this->session->set_userdata('login_type', 'pharmacist');
				$this->session->set_userdata('pharmacist_login', '1');
				$this->session->set_userdata('pharmacist_id', $row->pharmacist_id);
			}
			if ($this->input->post('login_type') == 'laboratorist') {
				$this->session->set_userdata('login_type', 'laboratorist');
				$this->session->set_userdata('laboratorist_login', '1');
				$this->session->set_userdata('laboratorist_id', $row->laboratorist_id);
			}
			if ($this->input->post('login_type') == 'accountant') {
				$this->session->set_userdata('login_type', 'accountant');
				$this->session->set_userdata('accountant_login', '1');
				$this->session->set_userdata('accountant_id', $row->accountant_id);
			}
			return TRUE;
		} else {
			$this->session->set_flashdata('flash_message', get_phrase('login_failed'));
			return FALSE;
		}
	}
	/*******LOGOUT FUNCTION *******/
	function logout()
	{
		$this->session->unset_userdata();
		$this->session->sess_destroy();
		$this->session->set_flashdata('flash_message', get_phrase('logged_out'));
		redirect(base_url() . 'index.php?login', 'refresh');
	}
	
	/***DEFAULT NOR FOUND PAGE*****/
	function four_zero_four()
	{
		$this->load->view('four_zero_four');
	}
	
	/***RESET AND SEND PASSWORD TO REQUESTED EMAIL****/
	function reset_password()
	{
		$account_type = $this->input->post('account_type');
		if ($account_type == "") {
			redirect(base_url(), 'refresh');
		}
		$email  = $this->input->post('email');
		$result = $this->email_model->password_reset_email($account_type, $email); //SEND EMAIL ACCOUNT OPENING EMAIL
		if ($result == true) {
			$this->session->set_flashdata('flash_message', get_phrase('password_sent'));
		} else if ($result == false) {
			$this->session->set_flashdata('flash_message', get_phrase('account_not_found'));
		}
		
		
	}
	
	/***LOGIN AS ANOTHER USER LIKE DOCTOR,PATIENT,PHARMACIST,LABORATORIST ETC******/
	function login_as($user_type = '', $user_id = '')
	{
		$this->session->set_userdata('login_type', $user_type);
		$this->session->set_userdata($user_type . '_login', '1');
		$this->session->set_userdata($user_type . '_id', $user_id);
		redirect(base_url() . 'index.php?' . $user_type . '/dashboard', 'refresh');
	}
	
	
}
