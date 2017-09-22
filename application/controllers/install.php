<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

/*	
 *	@author : Joyonto Roy
 *	date	: 26 March, 2013
 *	University Of Dhaka, Bangladesh
 *	Ekattor School & College Management System
 *	http://codecanyon.net/user/joyontaroy
 */


class Install extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('file');
		/*cash control*/
		$this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');
		$this->output->set_header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	}
	
	function index()
	{
		
		$this->load->view('install/index');
	}
	
	
	/*****INSTALL THE SCRIPT HERE *****/
	function do_install()
	{
		$db_verify = $this->check_db_connection();
		if ($db_verify == true) {
			///////replace the database settings//////////
			$data = read_file('./application/config/database.php');
			$data = str_replace('db_name', $this->input->post('db_name'), $data);
			$data = str_replace('db_uname', $this->input->post('db_uname'), $data);
			$data = str_replace('db_password', $this->input->post('db_password'), $data);
			$data = str_replace('db_hname', $this->input->post('db_hname'), $data);
			write_file('./application/config/database.php', $data);
			
			///////replace new default routing controller/////
			$data2 = read_file('./application/config/routes.php');
			$data2 = str_replace('install', 'login', $data2);
			write_file('./application/config/routes.php', $data2);
			
			
			///////run the installer sql schema//////////			
			$this->load->database();
			
			$schema = read_file('./uploads/hms.sql');
			
			$query      = rtrim(trim($schema), "\n;");
			$query_list = explode(";", $query);
			
			foreach ($query_list as $query)
				$this->db->query($query);
			
			///////replace the admin login credentials and site's info///////////
			$this->db->insert('admin', array(
				'email' => $this->input->post('email'),
				'password' => $this->input->post('password')
			));
			
			
			$this->db->where('type', 'system_name');
			$this->db->update('settings', array(
				'description' => $this->input->post('system_name')
			));
			$this->db->where('type', 'system_title');
			$this->db->update('settings', array(
				'description' => $this->input->post('system_name')
			));
			
			///////redirect to login page after completing installation
			$this->session->set_flashdata('installation_result', 'success');
			redirect(base_url(), 'refresh');
		} else {
			$this->session->set_flashdata('installation_result', 'failed');
			redirect(base_url(), 'refresh');
		}
	}
	
	
	/*****DB VALIDATION FROM USER INPUT SETTINGS*********/
	function check_db_connection()
	{
		$link = @mysql_connect($this->input->post('db_hname'), $this->input->post('db_uname'), $this->input->post('db_password'));
		if (!$link) {
			@mysql_close($link);
			return false;
		}
		
		$db_selected = mysql_select_db($this->input->post('db_name'), $link);
		if (!$db_selected) {
			@mysql_close($link);
			return false;
		}
		
		@mysql_close($link);
		return true;
	}
	
}
