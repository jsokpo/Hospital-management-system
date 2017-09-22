<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2008 - 2011, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */


if ( ! function_exists('get_phrase'))
{
	function get_phrase($phrase = '')
	{
		$CI	=&	get_instance();
		$CI->load->database();
		$current_language	=	$CI->session->userdata('current_language');
		
		if($current_language	==	'')
		{
			$current_language	=	'english';
			$CI->session->set_userdata('current_language' , $current_language);
		}


		$query	=	$CI->db->get_where('language' , array('phrase' => $phrase));
		$row   	=	$query->row();
		
		//return $row->$current_language;
		if(isset($row->$current_language) && $row->$current_language !="")
			return $row->$current_language;
		else 
			return ucwords(str_replace('_',' ',$phrase));
	}
}

// ------------------------------------------------------------------------
/* End of file language_helper.php */
/* Location: ./system/helpers/language_helper.php */