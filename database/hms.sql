-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2017 at 06:51 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE IF NOT EXISTS `accountant` (
  `accountant_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`accountant_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accountant`
--

INSERT INTO `accountant` (`accountant_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'James Alabi', 'jalabi@hms.com', 'accountant13244', 'Abuja, Nigeria', '+23480000000');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'John Sokpo', 'jsokpo@hms.com', 'admin13317', 'Abuja, Nigeria', '+234800000000');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `appointment_timestamp`, `doctor_id`, `patient_id`) VALUES
(1, 1449097200, 1, 2),
(2, 1450220400, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE IF NOT EXISTS `bed` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_number` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` longtext NOT NULL COMMENT 'ward,cabin,ICU',
  `status` int(11) NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bed_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`bed_id`, `bed_number`, `type`, `status`, `description`) VALUES
(1, 'W1', 'ward', 0, 'ward1'),
(2, 'W2', 'ward', 0, 'ward 2'),
(3, 'I1', 'icu', 0, 'icu 1');

-- --------------------------------------------------------

--
-- Table structure for table `bed_allotment`
--

CREATE TABLE IF NOT EXISTS `bed_allotment` (
  `bed_allotment_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allotment_timestamp` int(11) NOT NULL,
  `discharge_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`bed_allotment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bed_allotment`
--

INSERT INTO `bed_allotment` (`bed_allotment_id`, `bed_id`, `patient_id`, `allotment_timestamp`, `discharge_timestamp`) VALUES
(1, 1, 2, 1449702000, 1449874800);

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

CREATE TABLE IF NOT EXISTS `blood_bank` (
  `blood_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`blood_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `blood_bank`
--

INSERT INTO `blood_bank` (`blood_group_id`, `blood_group`, `status`) VALUES
(1, 'A+', '55'),
(2, 'A-', '42'),
(3, 'B+', '98'),
(4, 'B-', '63'),
(5, 'AB+', '47'),
(6, 'AB-', '65'),
(7, 'O+', '28'),
(8, 'O-', '64');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

CREATE TABLE IF NOT EXISTS `blood_donor` (
  `blood_donor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_donation_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`blood_donor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `blood_donor`
--

INSERT INTO `blood_donor` (`blood_donor_id`, `name`, `blood_group`, `sex`, `age`, `phone`, `email`, `address`, `last_donation_timestamp`) VALUES
(1, 'Dennis Makur', 'A+', 'male', 25, '+23480000000', 'donor@hms.com', 'Abuja, Nigeria', 1413237600);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`, `description`) VALUES
(1, 'Anesthesiology', 'Anesthesiology'),
(2, 'Bacteriological Laboratory', 'Bacteriological Laboratory'),
(3, 'Physical Therapy', 'Physical Therapy'),
(4, 'Plastic Surgery', 'Plastic Surgery');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_report`
--

CREATE TABLE IF NOT EXISTS `diagnosis_report` (
  `diagnosis_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'xray,blood test',
  `document_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'text,photo',
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `laboratorist_id` int(11) NOT NULL,
  PRIMARY KEY (`diagnosis_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `profile` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `name`, `email`, `password`, `address`, `phone`, `department_id`, `profile`) VALUES
(1, 'Dr. Michael Ojonugwa', 'mojonugwa@hms.com', 'doctor13248', 'Abuja, Nigeria', '+234800000000', 4, 'profile details here');

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE IF NOT EXISTS `email_template` (
  `email_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `task` longtext CHARACTER SET latin1 NOT NULL,
  `subject` longtext CHARACTER SET latin1 NOT NULL,
  `body` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`email_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `patient_id`, `title`, `description`, `amount`, `creation_timestamp`, `status`) VALUES
(1, 1, 'Blood Test', 'Blood test for maleria, Nov 2015', 500, 1448985663, 'unpaid'),
(2, 2, 'Fracture', 'Fracture bandage.', 1200, 1448985702, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `laboratorist`
--

CREATE TABLE IF NOT EXISTS `laboratorist` (
  `laboratorist_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`laboratorist_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `laboratorist`
--

INSERT INTO `laboratorist` (`laboratorist_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Sarah Enedu', 'senedu@hms.com', 'laboratorist13252', 'Abuja, Nigeria', '+234800000000');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bengali` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `arabic` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dutch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `russian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `chinese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `turkish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portuguese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hungarian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `french` longtext COLLATE utf8_unicode_ci NOT NULL,
  `greek` longtext COLLATE utf8_unicode_ci NOT NULL,
  `german` longtext COLLATE utf8_unicode_ci NOT NULL,
  `italian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `thai` longtext COLLATE utf8_unicode_ci NOT NULL,
  `urdu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hindi` longtext COLLATE utf8_unicode_ci NOT NULL,
  `latin` longtext COLLATE utf8_unicode_ci NOT NULL,
  `indonesian` longtext COLLATE utf8_unicode_ci NOT NULL,
  `japanese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `korean` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=234 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `bengali`, `spanish`, `arabic`, `dutch`, `russian`, `chinese`, `turkish`, `portuguese`, `hungarian`, `french`, `greek`, `german`, `italian`, `thai`, `urdu`, `hindi`, `latin`, `indonesian`, `japanese`, `korean`) VALUES
(1, 'admin_dashboard', 'admin dashboard', 'অ্যাডমিন ড্যাশবোর্ড', 'panel de administración', 'لوحة أجهزة القياس المشرف', 'admin dashboard', 'панели администратора', '管理面板', 'yönetici paneli', 'painel de administração', 'admin műszerfal', 'interface d''administration', 'το admin ταμπλό', 'Admin-Dashboard', 'cruscotto Admin', 'แผงควบคุมดูแลระบบ', 'ایڈمن ڈیش بورڈ', 'व्यवस्थापक डैशबोर्ड', 'admin Dashboard', 'dashboard admin', '管理ダッシュボード', '관리자 대시 보드'),
(2, 'login', 'login', 'লগইন করুন', 'login', 'دخول', 'inloggen', 'вход', '注册', 'giriş', 'login', 'bejelentkezés', 'S''identifier', 'σύνδεση', 'anmelden', 'login', 'เข้าสู่ระบบ', 'لاگ ان', 'लॉगिन', 'login', 'login', 'ログイン', '로그인'),
(3, 'email', 'email', 'ইমেল', 'email', 'البريد الإلكتروني', 'e-mail', 'E-mail', '电子邮件', 'e-posta', 'e-mail', 'email', 'email', 'e-mail', 'E-Mail-', 'e-mail', 'ส่งอีเมล์', 'ای میل', 'ईमेल', 'Email', 'email', 'メール', '이메일'),
(4, 'password', 'password', 'পাসওয়ার্ড', 'contraseña', 'كلمة السر', 'wachtwoord', 'пароль', '密码', 'parola', 'senha', 'jelszó', 'mot de passe', 'κωδικού πρόσβασης', 'Kennwort', 'parola d''ordine', 'รหัสผ่าน', 'پاس ورڈ', 'पासवर्ड', 'Signum', 'kata sandi', 'パスワード', '암호'),
(5, 'forgot_password?', 'forgot password?', 'পাসওয়ার্ড ভুলে গেছেন?', '¿Olvidó su contraseña?', 'هل نسيت كلمة المرور؟', 'wachtwoord vergeten?', 'Забыли пароль?', '忘记密码？', 'şifremi unuttum?', 'Esqueceu a senha?', 'elfelejtett jelszó?', 'Mot de passe oublié?', 'Ξεχάσατε τον κωδικό σας;', 'Passwort vergessen?', 'Hai dimenticato la password?', 'ลืมรหัสผ่าน?', 'پاس ورڈ بھول گیا ہے؟', 'पासवर्ड भूल गए हैं?', 'nibh', 'lupa password?', 'パスワードを忘れた？', '비밀번호를 잊으 셨나요?'),
(6, 'account_type', 'account type', 'অ্যাকাউন্টের প্রকার', 'Tipo de cuenta', 'نوع الحساب', 'accounttype', 'тип счета', '账户类型', 'hesap türü', 'tipo de conta', 'fiók típusát', 'type de compte', 'Τύπος λογαριασμού', 'Kontotyp', 'Tipo di conto', 'ประเภทบัญชี', 'اکاؤنٹ کی قسم', 'खाता प्रकार', 'propter speciem', 'Jenis akun', '口座の種類', '계정 유형'),
(7, 'admin', 'admin', 'অ্যাডমিন', 'administración', 'مشرف', 'admin', 'Админ', '管理员', 'yönetim', 'administrador', 'admin', 'administrateur', 'το admin', 'Admin', 'Admin', 'ผู้ดูแลระบบ', 'منتظم', 'प्रशासन', 'admin', 'admin', '管理者', '관리자'),
(8, 'doctor', 'doctor', 'ডাক্তার', 'doctor', 'طبيب,en', 'dokter', 'врач,en', '医生,en', 'doktor', 'médico', 'orvos', 'médecin', 'γιατρός', 'Arzt', 'medico', 'คุณหมอ', 'ڈاکٹر', 'चिकित्सक', 'Medicus', 'dokter', '医者', '의사'),
(9, 'patient', 'patient', 'রোগীর', 'paciente', 'المريض,en', 'patiënt', 'пациент,en', '病人,en', 'hasta', 'paciente', 'beteg', 'patients', 'ασθενής', 'Patienten', 'paziente', 'ผู้ป่วย', 'مریض', 'रोगी', 'Patientes', 'pasien', '患者', '환자'),
(10, 'pharmacist', 'pharmacist', 'ফার্মাসিস্ট', 'farmacéutico', 'صيدلي,en', 'apotheker', 'фармацевт', '药剂师,en', 'eczacı', 'farmacêutico', 'gyógyszerész', 'pharmacien', 'φαρμακοποιός', 'Apotheker', 'farmacista', 'เภสัชกร', 'فارماسسٹ', 'औषध बनानेवाला', 'pharmacist', 'apoteker,en', '薬剤師', '약사,en'),
(11, 'laboratorist', 'laboratorist,eo', 'ল্যাবরেটরিস্ট', 'laboratorista', 'laboratorist', 'laboratorist', 'laboratorist', 'laboratorist', 'laboratorist', 'laboratorista', 'laboratorist', 'laboratorist', 'laboratorist', 'laboratorist', 'laboratorist,eo', 'laboratorist', 'laboratorist', 'laboratorist', 'laboratorist', 'laboratorist,eo', 'laboratorist', 'laboratorist'),
(12, 'accountant', 'accountant', 'হিসাবরক্ষক', 'contador', 'محاسب,en', 'boekhouder', 'бухгалтер', '会计,en', 'muhasebeci', 'contador', 'könyvelő', 'comptable', 'λογιστής', 'Buchhalter', 'ragioniere', 'สมุห์บัญชี', 'اکاؤنٹنٹ', 'मुनीम', 'Ratiocinatore', 'akuntan', '会計士', '회계 원'),
(13, 'monitor_hospital', 'monitor hospital', 'মনিটর হাসপাতালে', 'hospital monitor', 'مستشفى رصد,en', 'beeldscherm ziekenhuis', 'монитор больницу', '监测医院,en', 'monitör hastane', 'Monitor hospitalar', 'monitor kórházban', 'hôpital moniteur', 'οθόνη από νοσοκομείο', 'Monitor Krankenhaus', 'ospedale monitor', 'โรงพยาบาลจอ', 'مانیٹر ہسپتال', 'मॉनिटर अस्पताल', 'notes hospitalis', 'memantau rumah sakit', 'モニター病院', '모니터 병원,en'),
(14, 'nurse', 'nurse', 'নার্স', 'enfermera', 'ممرضة,en', 'verpleegster', 'медсестра', '护士,en', 'hemşire', 'enfermeira', 'nővér', 'infirmière', 'νοσοκόμα', 'Krankenschwester', 'infermiere', 'พยาบาล', 'نرس', 'नर्स', 'nutricem', 'perawat', '看護師', '간호사'),
(15, 'department', 'department', 'বিভাগ', 'departamento', 'قسم,en', 'afdeling', 'отдел', '部门,en', 'bölüm', 'departamento', 'osztály', 'département', 'τμήμα', 'Abteilung', 'Dipartimento', 'แผนก', 'محکمہ', 'विभाग', 'Department', 'departemen', '部門', '부'),
(16, 'dashboard', 'dashboard', 'ড্যাশবোর্ড', 'salpicadero', 'لوحة أجهزة القياس,en', 'dashboard', 'приборная панель', '仪表盘,en', 'gösterge paneli', 'painel de instrumentos', 'műszerfal', 'tableau de bord', 'ταμπλό', 'Armaturenbrett', 'cruscotto', 'หน้าปัด', 'ڈیش بورڈ', 'डैशबोर्ड', 'Dashboard', 'dasbor', 'ダッシュボード', '계기판,en'),
(17, 'settings', 'settings', 'সেটিংস', 'ajustes', 'إعدادات,en', 'instellingen', 'настройки', '设置,en', 'ayarları', 'definições', 'beállítások', 'réglages', 'Ρυθμίσεις', 'Einstellungen', 'impostazioni', 'การตั้งค่า', 'ترتیبات', 'सेटिंग्स', 'obitus', 'Pengaturan', '設定', '설정,en'),
(18, 'profile', 'profile', 'প্রফাইল', 'perfil', 'الملف الشخصي,en', 'profiel', 'профиль', '轮廓,en', 'profil', 'perfil', 'profil', 'profil', 'προφίλ', 'Profil', 'Profilo', 'รายละเอียด', 'پروفائل', 'प्रोफ़ाइल', 'profile', 'profil,en', 'プロフィール', '프로필'),
(19, 'settings_updated', 'settings updated', 'সেটিংস আপডেট', 'configuración actualizado', 'تحديث إعدادات', 'instellingen bijgewerkt', 'Настройки обновленной', '更新设置', 'ayarlarının güncellenmesi', 'definições atualizadas', 'beállítások frissítése', 'les paramètres mis à jour', 'Ρυθμίσεις ενημέρωση', 'Einstellungen aktualisiert', 'impostazioni aggiornate', 'การตั้งค่าการอัพเดต', 'ترتیبات کی تازہ کاری', 'सेटिंग्स अपडेट', 'occasus updated', 'pengaturan diperbarui', '設定が更新され', '설정 업데이트'),
(20, 'logout', 'logout', 'লগ আউট', 'logout', 'خروج', 'uitloggen', 'выход из системы', '注销', 'çıkış', 'sair', 'logout', 'déconnexion', 'αποσύνδεση', 'Abmeldung', 'il logout', 'ออกจากระบบ', 'لاگ آؤٹ کریں', 'लॉगआउट', 'logout', 'logout', 'ログアウト', '로그 아웃'),
(21, 'logged_out', 'logged out', 'লগ আউট', 'desconectado', 'تسجيل الخروج', 'uitgelogd', 'выход из системы', '注销', 'oturumu', 'desconectado', 'kijelentkezett', 'déconnecté', 'αποσυνδεθεί', 'abgemeldet', 'disconnesso', 'เข้าออก', 'باہر کا', 'लॉग आउट', 'de logged', 'log out', 'ログアウト', '로그 아웃'),
(22, 'reset_password', 'reset password', 'পাসওয়ার্ড রিসেট করুন', 'restablecer la contraseña', 'إعادة تعيين كلمة المرور', 'reset wachtwoord', 'Сброс пароля', '重设密码', 'parola sıfırlama', 'redefinir a senha', 'Jelszó törlése', 'réinitialiser le mot de passe', 'επαναφέρετε τον κωδικό πρόσβασης', 'Kennwort zurücksetzen', 'reimpostare la password', 'ตั้งค่ารหัสผ่าน', 'پاس ورڈ ری سیٹ', 'पासवर्ड रीसेट', 'reset Signum', 'reset password', 'パスワードをリセット', '암호를 재설정'),
(23, 'reset', 'reset', 'রিসেট করুন', 'reajustar', 'إعادة تعيين', 'reset', 'сброс', '复位', 'ayarlamak', 'restabelecer', 'vissza', 'réinitialiser', 'επαναφορά', 'Zurücksetzen', 'reimpostare', 'ตั้งใหม่', 'ری سیٹ', 'रीसेट करें', 'reset', 'ulang', 'リセット', '재설정'),
(24, 'account', 'account', 'হিসাব', 'cuenta', 'حساب', 'rekening', 'счет', '帐户', 'hesap', 'conta', 'számla', 'considération', 'λογαριασμός', 'Rechnung', 'acconto', 'บัญชี', 'اکاؤنٹ', 'खाता', 'propter', 'rekening', 'アカウント', '계정'),
(25, 'select_language', 'select language', 'ভাষা নির্বাচন করুন', 'seleccionar el idioma', 'اختر اللغة,en', 'Selecteer taal,en', 'выбрать язык,en', '选择语言,en', 'dili seçin', 'selecionar o idioma', 'Válasszon nyelvet', 'sélectionner la langue', 'επιλέξτε τη γλώσσα', 'Sprache wählen', 'selezionare la lingua', 'เลือกภาษา', 'زبان منتخب کریں', 'भाषा का चयन', 'Linguam elige', 'pilih bahasa', '言語を選択する', '언어를 선택,en'),
(26, 'panel', 'panel', 'প্যানেল', 'panel', 'لوحة', 'paneel', 'панель', '面板', 'panel', 'painel', 'bizottság', 'panneau', 'πίνακας', 'Panel', 'pannello', 'แผงหน้าปัด', 'پینل', 'पैनल', 'panel', 'panel', 'パネル', '패널'),
(27, 'view_appointment', 'view appointment', 'অ্যাপয়েন্টমেন্ট দেখতে', 'ver la cita', 'عرض التعيين', 'bekijken afspraak', 'Просмотреть встречу', '查看预约', 'randevu görmek', 'ver nomeação', 'Találkozó megtekintése', 'voir rendez-vous', 'δείτε το διορισμό', 'Termin ansehen', 'visualizzare appuntamento', 'ดูได้รับการแต่งตั้ง', 'تقرری دیکھنے کے', 'नियुक्ति देखने', 'considerabit constitutio', 'lihat penunjukan', '予定を表示', '약속보기'),
(28, 'view_payment', 'view payment', 'পেমেন্ট দেখতে', 'ver pago', 'عرض الدفع', 'bekijk betaling', 'просмотреть оплаты', '查看支付', 'ödeme görmek', 'ver o pagamento', 'megtekintése fizetés', 'voir paiement', 'δείτε πληρωμών', 'sehen Zahlung', 'visualizzare pagamento', 'ดูการชำระเงิน', 'ادائیگی کے لئیے', 'भुगतान देखने', 'considerabit solutione', 'lihat pembayaran', '支払いを表示', '지불을 볼'),
(29, 'view_bed_status', 'view bed status', 'বিছানা অবস্থা দেখতে', 'ver el estado de la cama', 'عرض حالة السرير', 'bekijk de status bed', 'View Bed статус', '查看卧床状态', 'yatak durumunu görüntülemek', 'visualizar o status de cama', 'View Bed állapot', 'afficher l''état du lit', 'δείτε την κατάσταση κρεβάτι', 'View Bed Status', 'visualizzare lo stato del letto', 'ดูสถานะเตียง', 'بستر کی حیثیت کو دیکھنے کے', 'बिस्तर स्थिति देखने', 'considerabit status cubile', 'melihat status tidur', '床の状態を表示', '침대 상태를 확인'),
(30, 'view_blood_bank', 'view blood bank', 'ব্লাড ব্যাঙ্ক দেখতে', 'ver el banco de sangre', 'عرض بنك الدم', 'bekijk bloedbank', 'просмотреть банк крови', '查看血库', 'kan bankası görmek', 'ver banco de sangue', 'megtekintéséhez vér bank', 'voir la banque de sang', 'δείτε τράπεζα αίματος', 'sehen Blutbank', 'visualizzare banca del sangue', 'ดูธนาคารเลือด', 'بلڈ بینک کے لئیے', 'ब्लड बैंक देखने', 'considerabit sanguinem ripae', 'lihat bank darah', '血液バンクを表示', '혈액 은행보기'),
(31, 'view_medicine', 'view medicine', 'ঔষধ দেখতে', 'ver la medicina', 'نظر إلى الطب', 'bekijk geneeskunde', 'просмотреть медицине', '查看药', 'tıp görmek', 'ver medicina', 'megtekintéséhez gyógyszer', 'voir la médecine', 'δείτε το φάρμακο', 'ansehen Medizin', 'visualizzare medicina', 'ดูยา', 'دوا کو دیکھنے کے', 'दवा देखने', 'considerabit medicamentum', 'lihat obat', '薬を見る', '약을 보려면'),
(32, 'view_operation', 'view operation', 'অপারেশন দেখতে', 'ver la operación', 'عرض عملية', 'bekijk operatie', 'Отображение работы', '查看操作', 'çalışma görmek', 'visualizar operação', 'megtekinteni működés', 'voir opération', 'δείτε τη λειτουργία', 'anzuzeigen Betrieb', 'visualizzare il funzionamento', 'ดูการดำเนินงาน', 'آپریشن دیکھنے کے', 'आपरेशन देखने', 'considerabit operatione', 'melihat operasi', '操作を表示', '작업을 보려면'),
(33, 'view_birth_report', 'view birth report', 'আমার রিপোর্ট', 'ver el informe de nacimiento', 'عرض التقرير الميلاد', 'bekijk geboorte rapport', 'просмотреть отчет рождения', '查看出生申报', 'Doğum raporunu görüntülemek', 'ver relatório de nascimento', 'megtekintéséhez születési jelentés', 'voir rapport de naissance', 'προβάλετε την αναφορά γέννησης', 'sehen Geburtsdatum Bericht', 'visualizzare il report di nascita', 'ดูรายงานการเกิด', 'آپ کی رپورٹ دیکھنے کے', 'जन्म रिपोर्ट देखने', 'considerabit nativitatis auditui', 'melihat laporan kelahiran', '出産レポートを表示', '출생 보고서를 보려면'),
(34, 'view_death_report', 'view death report', 'মৃত্যুর রিপোর্ট', 'ver el informe de la muerte', 'عرض تقرير الوفاة', 'bekijk dood rapport', 'просмотреть отчет смерти', '查看死亡报告', 'ölüm raporunu görüntülemek', 'ver relatório morte', 'a halált jelentés', 'voir rapport de la mort', 'προβάλετε την αναφορά του θανάτου', 'sehen Tod Bericht', 'visualizzare il report di morte', 'ดูรายงานการเสียชีวิต', 'موت کی رپورٹ دیکھنے کے', 'मौत रिपोर्ट देखने', 'considerabit mortis nuntium', 'melihat laporan kematian', '死のレポートを表示', '죽음의 보고서를 보려면'),
(35, 'manage_email_template', 'manage email template', 'ইমেইল টেমপ্লেট পরিচালনা', 'gestión de plantilla de correo electrónico', 'إدارة قالب البريد الإلكتروني', 'beheren e-mail template', 'Шаблон управления электронной почтой', '管理电子邮件模板', 'e-posta şablonu yönetmek', 'gerenciar modelo de e-mail', 'kezelni e-mail sablon', 'gérer modèle de courriel', 'διαχείριση πρότυπο email', 'Verwalten von E-Vorlage', 'gestione modello e-mail', 'แม่แบบการจัดการอีเมล์', 'ای میل سانچے انتظام', 'ईमेल टेम्पलेट का प्रबंधन', 'Morbi luctus curo', 'mengelola email template', '電子メールテンプレートを管理', '전자 메일 서식 파일 관리'),
(36, 'manage_noticeboard', 'manage noticeboard', 'নোটিশবোর্ড পরিচালনা', 'gestionar tablón de anuncios', 'إدارة اللافتة', 'beheren prikbord', 'управлять доске объявлений', '管理布告', 'panosuna yönetmek', 'gerenciar avisos', 'kezelni üzenőfalán', 'gérer panneau d''', 'διαχείριση Ανακοινώσεων', 'verwalten noticeboard', 'gestire bacheca', 'จัดการ noticeboard', 'noticeboard کا انتظام', 'नोटिसबोर्ड प्रबंधन', 'noticeboard curo', 'mengelola pengumuman', '掲示板を管理', '공지 사항 more 관리'),
(37, 'system_settings', 'system settings', 'সিস্টেম সেটিংস', 'configuración del sistema', 'إعدادات النظام', 'systeeminstellingen', 'настройки системы', '系统设置', 'sistem ayarlarını', 'configurações do sistema', 'rendszerbeállításokat', 'les paramètres du système', 'ρυθμίσεις του συστήματος', 'Systemeinstellungen', 'impostazioni di sistema', 'การตั้งค่าระบบ', 'سسٹم کی ترتیبات', 'प्रणाली सेटिंग्स', 'ratio occasus', 'pengaturan sistem', 'システム設定', '시스템 설정'),
(38, 'manage_language', 'manage language', 'ভাষা পরিচালনা', 'gestionar idioma', 'إدارة اللغة', 'beheren taal', 'управлять языком', '管理语言', 'dil yönetmek', 'gerenciar linguagem', 'kezelni nyelv', 'gérer langue', 'διαχείριση γλώσσα', 'verwalten Sprache', 'gestire lingua', 'จัดการภาษา', 'زبان کا انتظام', 'भाषा का प्रबंधन', 'Linguam curo', 'mengelola bahasa', '言語を管理', '언어 관리'),
(39, 'backup_restore', 'backup restore', 'পুনঃস্থাপন ব্যাকআপ', 'Restaurar copia de seguridad', 'استعادة النسخ الاحتياطي', 'backup terugzetten', 'восстановление резервной копии', '备份还原', 'geri yedekleme', 'Restauração de Backup', 'Backup Restore', 'Backup Restore', 'επαναφοράς αντιγράφων ασφαλείας', 'Backup wiederherstellen', 'Backup Restore', 'การสำรองข้อมูลเรียกคืน', 'بحال بیک اپ', 'बहाल बैकअप', 'tergum quod restituo', 'backup restore', 'バックアップのリストア', '복원 백업'),
(40, 'appointment', 'appointment', 'এপয়েন্টমেন্ট', 'nombramiento', 'موعد', 'afspraak', 'назначение', '任命', 'randevu', 'nomeação', 'kinevezés', 'rendez-vous', 'ραντεβού', 'Ernennung', 'appuntamento', 'การแต่งตั้ง', 'تقرری', 'नियुक्ति', 'Nominatio', 'penunjukan', '任命', '약속'),
(41, 'payment', 'payment', 'প্রদান', 'pago', 'دفع', 'betaling', 'оплата', '付款', 'ödeme', 'pagamento', 'fizetés', 'paiement', 'πληρωμή', 'Bezahlung', 'pagamento', 'การชำระเงิน', 'ادائیگی', 'भुगतान', 'solucionis', 'pembayaran', '支払い', '지불'),
(42, 'blood_bank', 'blood bank', 'ব্লাড ব্যাঙ্ক', 'banco de sangre', 'بنك الدم', 'bloedbank', 'банк крови', '血库', 'kan bankası', 'banco de sangue', 'vérbank', 'la banque de sang', 'τράπεζα αίματος', 'Blutbank', 'banca del sangue', 'ธนาคารเลือด', 'بلڈ بینک', 'रक्त बैंक', 'sanguinem ripam', 'bank darah', '血液バンク', '혈액 은행'),
(43, 'medicine', 'medicine', 'ঔষধ', 'medicina', 'دواء', 'geneeskunde', 'медицина', '医药', 'tıp', 'medicina', 'orvostudomány', 'médecine', 'ιατρική', 'Medizin', 'medicina', 'ยา', 'دوا', 'दवा', 'medicine', 'obat', '医学', '의학'),
(44, 'operation_report', 'operation report', 'অপারেশন পরিচালনা', 'confirmación de la operación', 'تقرير العملية', 'bediening rapport', 'отчет о работе', '操作报告', 'çalışma raporu', 'relatório operação', 'működéséről szóló jelentés', 'rapport d''opération', 'αναφορά λειτουργίας', 'OP-Bericht', 'rapporto sul funzionamento', 'รายงานการดำเนินงาน', 'آپریشن کی رپورٹ', 'आपरेशन रिपोर्ट', 'operatio auditui', 'Laporan operasi', '動作報告', '운영 보고서'),
(45, 'birth_report', 'birth report', 'আমার রিপোর্ট', 'informe nacimiento', 'تقرير الميلاد', 'geboorte rapport', 'Отчет рождения', '出生申报', 'doğum raporu', 'relatório de nascimento', 'születési jelentés', 'rapport à la naissance', 'Έκθεση Γέννησης', 'Geburt Bericht', 'relazione di nascita', 'รายงานการเกิด', 'آپ کی رپورٹ', 'जन्म रिपोर्ट', 'fama nativitate', 'Laporan lahir', '出生届', '출생 보고서'),
(46, 'death_report', 'death report', 'মৃত্যুর প্রতিবেদন', 'informe de la muerte', 'تقرير الموت', 'dood rapport', 'смерть отчет', '死亡报告', 'ölüm raporu', 'relatório morte', 'halál jelentés', 'Rapport de mort', 'έκθεση του θανάτου', 'Tod Bericht', 'rapporto di morte', 'รายงานการเสียชีวิต', 'موت رپورٹ', 'मौत रिपोर्ट', 'fama mortis', 'Laporan kematian', '死亡届', '사망 보고서'),
(47, 'bed_allotment', 'bed allotment', 'বিছানা অ্যালটমেন্ট', 'asignación de cama', 'تخصيص سرير', 'bed toewijzing', 'кровать выделение', '床上配发', 'yatak tahsis', 'cama loteamento', 'ágy elosztás', 'attribution de lit', 'κατανομής κρεβάτι', 'Bett Zuteilung', 'letto riparto', 'จัดสรรเตียง', 'بستر الاٹمنٹ', 'बिस्तर आवंटन', 'stratum sorti', 'tidur penjatahan', 'ベッド割当', '침대 할당'),
(48, 'noticeboard', 'noticeboard', 'নোটিশবোর্ড', 'noticeboard', 'اللافتة', 'prikbord', 'доска объявлений', '布告', 'panosuna', 'NOTICEBOARD', 'üzenőfalán', 'Panneau d''affichage', 'Ανακοινώσεων', 'Schwarzes Brett', 'bacheca', 'noticeboard', 'noticeboard', 'Noticeboard', 'noticeboard', 'pengumuman', '掲示板', '공지 사항 more'),
(49, 'language', 'language', 'ভাষা', 'idioma', 'لغة', 'taal', 'язык', '语', 'dil', 'linguagem', 'nyelv', 'langue', 'γλώσσα', 'Sprache', 'lingua', 'ภาษา', 'زبان', 'भाषा', 'Linguam', 'bahasa', '言語', '언어'),
(50, 'backup', 'backup', 'ব্যাকআপ', 'copia de seguridad', 'النسخ الاحتياطي', 'backup', 'резервное копирование', '备份', 'yedekleme', 'fazer backup', 'hát', 'sauvegarder', 'αντιγράφων ασφαλείας', 'Backup', 'eseguire il backup', 'การสำรองข้อมูล', 'بیک اپ', 'बैकअप', 'tergum', 'backup', 'バックアップ', '백업'),
(51, 'calendar_schedule', 'calendar schedule', 'ক্যালেন্ডার সময়সূচী', 'horario de calendario', 'جدول التقويم', 'kalender schema', 'календарный план', '日历日程', 'takvim programı', 'calendário da programação', 'naptári ütemezés', 'calendrier calendrier', 'ημερολογιακό πρόγραμμα', 'Kalender Zeitplan', 'calendario calendario', 'ตารางปฏิทิน', 'کیلنڈر شیڈول', 'कैलेंडर अनुसूची', 'Calendarium cedula', 'jadwal kalender', 'カレンダースケジュール', '캘린더 일정'),
(52, 'manage_department', 'manage department', 'ডিপার্টমেন্ট পরিচালনা', 'gestionar departamento', 'إدارة قسم', 'beheren afdeling', 'управлять отделом', '管理部门', 'bölümü yönetmek', 'gerenciar departamento', 'kezelni osztály', 'gérer département', 'διαχειρίζεται το τμήμα', 'Verwaltung Abteilung', 'gestire reparto', 'จัดการแผนก', 'محکمہ کا انتظام', 'विभाग का प्रबंधन', 'department curo', 'mengelola departemen', '部門を管理', '부서 관리'),
(53, 'department_list', 'department list', 'বিভাগ তালিকা', 'Lista departamento', 'قائمة وزارة', 'afdeling lijst', 'Отдел список', '部门列表', 'bölüm listesi', 'Lista de departamento', 'osztály lista', 'Liste département', 'Τμήμα λίστα', 'Abteilung Liste', 'Lista reparto', 'รายการแผนก', 'محکمہ کی فہرست', 'विभाग की सूची', 'department album', 'Daftar departemen', '部門リスト', '부서 목록'),
(54, 'add_department', 'add department', 'বিভাগ যোগ করুন', 'añadir departamento', 'إضافة قسم', 'add afdeling', 'добавить отделе', '新增部门', 'bölümü ekleyin', 'adicionar departamento', 'add osztály', 'ajouter département', 'προσθέστε το τμήμα', 'Abteilung hinzufügen', 'aggiungere reparto', 'เพิ่มแผนก', 'محکمہ شامل', 'विभाग जोड़ना', 'addere dolor', 'menambah organisasi', '部門を追加', '부서를 추가'),
(55, 'department_name', 'department name', 'বিভাগের নাম', 'nombre del departamento', 'اسم القسم', 'afdelingsnaam', 'название отдела', '部门名称', 'bölüm adı', 'nome do departamento', 'részleg nevét', 'nom du département', 'Τμήμα όνομα', 'Name der Abteilung', 'nome del reparto', 'ชื่อแผนก', 'محکمہ کا نام', 'विभाग का नाम', 'nomen department', 'nama departemen', '部署名', '부서 이름'),
(56, 'description', 'description', 'বর্ণনা', 'descripción', 'وصف', 'beschrijving', 'описание', '描述', 'tanımlama', 'descrição', 'leírás', 'Description', 'περιγραφή', 'Beschreibung', 'descrizione', 'ลักษณะ', 'تفصیل', 'विवरण', 'description', 'deskripsi', '説明', '기술'),
(57, 'options', 'options', 'অপশন', 'Opciones', 'خيارات', 'opties', 'опции', '选项', 'seçenekleri', 'opções', 'lehetőségek', 'les options', 'Επιλογές', 'Optionen', 'opzioni', 'ตัวเลือก', 'اختیارات', 'विकल्प', 'options', 'Pilihan', 'オプション', '옵션'),
(58, 'edit', 'edit', 'সম্পাদনা করুন', 'editar', 'تعديل', 'uitgeven', 'редактировать', '编辑', 'düzenleme', 'editar', 'szerkeszt', 'éditer', 'επεξεργαστείτε', 'bearbeiten', 'modificare', 'แก้ไข', 'ترمیم کریں', 'संपादित', 'emendo', 'mengedit', '編集', '편집'),
(59, 'delete', 'delete', 'মুছে দিন', 'borrar', 'حذف', 'verwijderen', 'удалять', '删除', 'silmek', 'excluir', 'töröl', 'supprimer', 'διαγραφή', 'löschen', 'cancella', 'ลบ', 'خارج کر دیں', 'हटाना', 'delete', 'menghapus', '削除する', '삭제'),
(60, 'department_description', 'department description', 'বিভাগ বর্ণনা', 'Descripción del departamento', 'وصف قسم', 'afdeling beschrijving', 'Отдел описание', '科室介绍', 'Bölüm açıklaması', 'descrição departamento', 'osztály leírás', 'Description département', 'Τμήμα περιγραφή', 'Abteilung Beschreibung', 'Descrizione del reparto', 'คำอธิบายของแผนก', 'محکمہ تفصیل', 'विभाग विवरण', 'hac descriptione', 'deskripsi departemen', '部門の説明', '부서 소개'),
(61, 'manage_doctor', 'manage doctor', 'ডাক্তার পরিচালনা', 'gestionar médico', 'إدارة الطبيب', 'beheren arts', 'управлять врача', '医生管理', 'doktor yönetmek', 'gerenciar médico', 'kezelését orvos', 'gérer médecin', 'διαχειρίζεται το γιατρό', 'verwalten Arzt', 'gestire medico', 'จัดการแพทย์', 'ڈاکٹر کا انتظام', 'डॉक्टर का प्रबंधन', 'Medicus curo', 'mengelola dokter', '医師を管理', '의사 관리'),
(62, 'doctor_list', 'doctor list', 'ডাক্তারের তালিকা', 'Lista médico', 'قائمة الطبيب', 'arts lijst', 'Врач список', '医生名单', 'doktor listesi', 'lista médico', 'orvos lista', 'liste de racle', 'Λίστα γιατρό', 'Arzt-Liste', 'elenco medico', 'รายชื่อแพทย์', 'ڈاکٹر فہرست', 'डॉक्टर सूची', 'Medicus album', 'Daftar dokter', '医師リスト', '의사 목록'),
(63, 'add_doctor', 'add doctor', 'ডাক্তার যোগ করুন', 'añadir médico', 'طبيب جديد', 'voegen arts', 'добавить врача', '加医生', 'doktor ekleyin', 'adicionar médico', 'hozzá orvos', 'ajouter médecin', 'προσθέστε το γιατρό', 'Arzt hinzufügen', 'aggiungere medico', 'เพิ่มแพทย์', 'ڈاکٹر شامل', 'डॉक्टर जोड़', 'adde medicum', 'menambah tenaga dokter', '医師を追加', '의사 추가'),
(64, 'doctor_name', 'doctor name', 'ডাক্তারের নাম', 'Nombre del médico', 'اسم الطبيب', 'Naam arts', 'Врач название', '医生姓名', 'doktor adı', 'Nome do médico', 'orvos név', 'Nom du médecin', 'Όνομα γιατρό', 'Arzt Namen', 'Nome del medico', 'ชื่อแพทย์', 'ڈاکٹر کا نام', 'डॉक्टर का नाम', 'medicus nomen', 'Nama dokter', '医師名', '의사 이름'),
(65, 'name', 'name', 'নাম', 'nombre', 'اسم', 'naam', 'название', '名', 'ad', 'nome', 'név', 'Nom', 'όνομα', 'Name', 'nome', 'ชื่อ', 'نام', 'नाम', 'nóminis', 'nama', '名前', '이름'),
(66, 'address', 'address', 'ঠিকানা', 'dirección', 'عنوان', 'adres', 'адрес', '地址', 'adres', 'endereço', 'cím', 'Adresse', 'διεύθυνση', 'Anschrift', 'indirizzo', 'ที่อยู่', 'ایڈریس', 'पता', 'inscriptio', 'alamat', 'アドレス', '주소'),
(67, 'phone', 'phone', 'ফোন', 'teléfono', 'هاتف', 'telefoon', 'телефон', '电话', 'telefon', 'telefone', 'telefon', 'téléphone', 'τηλέφωνο', 'telefonieren', 'telefono', 'โทรศัพท์', 'فون', 'फ़ोन', 'phone', 'telepon', '電話', '전화'),
(68, 'manage_patient', 'manage patient', 'রোগীর পরিচালনা', 'gestionar paciente', 'إدارة المريض', 'beheren patiënt', 'управлять пациента', '管理病人', 'hastanın tedavisini düzenleyin', 'gerenciar paciente', 'kezelni beteg', 'gérer les patients', 'διαχείριση των ασθενών', 'Patienten verwalten', 'gestione del paziente', 'บริหารจัดการผู้ป่วย', 'مریض کا انتظام', 'रोगी प्रबंधन', 'patiens aget', 'mengelola pasien', '患者を管理', '환자 관리'),
(69, 'patient_list', 'patient list', 'রোগীর তালিকা', 'lista de pacientes', 'قائمة المريض', 'patiënt lijst', 'Список пациентов', '病人列表', 'Hasta listesi', 'lista de pacientes', 'beteglistát', 'liste des patients', 'λίστα ασθενών', 'Patientenliste', 'elenco dei pazienti', 'รายชื่อผู้ป่วย', 'مریض کی فہرست', 'रोगी सूची', 'Patientes album', 'daftar pasien', '患者リスト', '환자 목록'),
(70, 'add_patient', 'add patient', 'রোগীর যোগ করুন', 'añadir paciente', 'إضافة المريض', 'voegen patiënt', 'добавить пациента', '增加病人', 'Hasta ekleyin', 'adicionar paciente', 'hozzá beteg', 'ajouter patients', 'προσθήκη ασθενούς', 'Patienten hinzufügen', 'aggiungere paziente', 'เพิ่มผู้ป่วย', 'مریض شامل', 'रोगी जोड़ना', 'adde patientes', 'menambahkan pasien', '患者を追加', '환자 추가'),
(71, 'patient_name', 'patient name', 'রোগীর নাম', 'Nombre del paciente', 'اسم المريض', 'naam van de patiënt', 'имя пациента', '患者姓名', 'hasta adı', 'nome do paciente', 'páciens neve', 'le nom du patient', 'το όνομα του ασθενούς', 'Patientennamen', 'nome del paziente', 'ชื่อผู้ป่วย', 'مریض کا نام', 'रोगी का नाम', 'Patientes nomine', 'Nama pasien', '患者名', '환자의 이름'),
(72, 'age', 'age', 'বয়স', 'edad', 'عمر', 'leeftijd', 'возраст', '年龄', 'yaş', 'idade', 'életkor', 'âge', 'ηλικία', 'Alter', 'età', 'อายุ', 'عمر', 'उम्र', 'saeculi', 'usia', '年齢', '나이'),
(73, 'sex', 'sex', 'যৌন', 'sexo', 'جنس', 'seks', 'секс', '性别', 'seks', 'sexo', 'szex', 'sexe', 'φύλο', 'Sex', 'sesso', 'เพศ', 'جنسی تعلقات', 'लिंग', 'sexum', 'seks', 'セックス', '섹스'),
(74, 'blood_group', 'blood group', 'রক্তের বিভাগ', 'grupo sanguíneo', 'فصيلة الدم', 'bloedgroep', 'группа крови', '血型', 'kan grubu', 'grupo sanguíneo', 'vércsoport', 'groupe sanguin', 'ομάδα αίματος', 'Blutgruppe', 'gruppo sanguigno', 'กรุ๊ปเลือด', 'خون کے گروپ', 'रक्त वर्ग', 'sanguine coetus', 'golongan darah', '血液型', '혈액형'),
(75, 'birth_date', 'birth date', 'আমার জন্ম', 'fecha de nacimiento', 'تاريخ الميلاد', 'geboortedatum', 'Дата рождения', '出生日期', 'doğum tarihi', 'data de nascimento', 'születési dátum', 'date de naissance', 'ημερομηνία γέννησης', 'Geburtsdatum', 'Data di nascita', 'วันเดือนปีเกิด', 'پیدائش کی تاریخ', 'जन्म तिथि', 'date nativitatis', 'tanggal lahir', '生年月日', '생년월일'),
(76, 'male', 'male', 'পুরুষ', 'macho', 'ذكر', 'mannelijk', 'мужской', '男性', 'erkek', 'masculino', 'férfi', 'masculin', 'αρσενικός', 'männlich', 'maschio', 'ชาย', 'کھنگالیں', 'नर', 'masculus', 'laki-laki', '男性', '남성'),
(77, 'female', 'female', 'মহিলা', 'femenino', 'أنثى', 'vrouw', 'женский', '女性', 'kadın', 'feminino', 'női', 'féminin', 'θηλυκός', 'weiblich', 'femminile', 'หญิง', 'خواتین', 'महिला', 'feminam', 'perempuan', '女性', '여성'),
(78, 'manage_nurse', 'manage nurse', 'নার্স পরিচালনা', 'gestionar la enfermera', 'إدارة ممرضة', 'beheren verpleegkundige', 'управлять медсестры', '护士管理', 'hemşire yönetmek', 'gerenciar enfermeira', 'kezelni nővér', 'gérer infirmière', 'διαχείριση νοσοκόμα', 'verwalten Krankenschwester', 'gestire infermiera', 'จัดการพยาบาล', 'نرس کا انتظام', 'नर्स का प्रबंधन', 'nutrix curo', 'mengelola perawat', '看護師を管理', '간호사 관리'),
(79, 'nurse_list', 'nurse list', 'নার্স তালিকা', 'Lista de enfermera', 'قائمة ممرضة', 'verpleegkundige lijst', 'Медсестра список', '护士名单', 'hemşire liste', 'lista enfermeira', 'nővér lista', 'infirmière liste', 'Λίστα νοσοκόμα', 'Krankenschwester Liste', 'Lista infermiera', 'รายการพยาบาล', 'نرس کی فہرست', 'नर्स सूची', 'nutrix album', 'daftar perawat', '看護師のリスト', '간호사 목록'),
(80, 'add_nurse', 'add nurse', 'নার্স যোগ করুন', 'añadir enfermera', 'إضافة ممرضة', 'voegen verpleegkundige', 'добавить медсестры', '增加护士', 'hemşire ekleyin', 'adicionar enfermeira', 'hozzá nővér', 'ajouter infirmière', 'προσθήκη νοσοκόμα', 'Krankenschwester hinzufügen', 'aggiungere infermiera', 'เพิ่มพยาบาล', 'نرس شامل', 'नर्स जोड़', 'adde nutricem', 'tambahkan perawat', '看護師を追加', '간호사 추가'),
(81, 'nurse_name', 'nurse name', 'নার্স নাম', 'nombre de la enfermera', 'اسم ممرضة', 'naam verpleegkundige', 'Медсестра название', '护士的名字', 'hemşire adı', 'Nome enfermeira', 'nővér név', 'nom de l''infirmière', 'Όνομα νοσοκόμα', 'Krankenschwester Namen', 'Nome infermiera', 'ชื่อพยาบาล', 'نرس کا نام', 'नर्स का नाम', 'nomine nutricis', 'Nama perawat', '看護師名', '간호사 이름'),
(82, 'manage_pharmacist', 'manage pharmacist', 'ফার্মাসিস্ট পরিচালনা', 'gestionar farmacéutico', 'إدارة الصيدلي', 'beheren apotheker', 'управлять фармацевт', '管理药剂师', 'eczacı yönetmek', 'gerenciar farmacêutico', 'kezelni gyógyszerész', 'gérer pharmacien', 'διαχείριση φαρμακοποιό', 'verwalten Apotheker', 'gestire farmacista', 'จัดการเภสัชกร', 'فارماسسٹ کا انتظام', 'फार्मासिस्ट का प्रबंधन', 'pharmacist curo', 'mengelola apoteker', '薬剤師を管理', '약사 관리'),
(83, 'pharmacist_list', 'pharmacist list', 'ফার্মাসিস্ট তালিকা', 'Lista farmacéutico', 'قائمة الصيدلي', 'apotheker lijst', 'Фармацевт список', '药剂师列表', 'eczacı liste', 'lista farmacêutico', 'gyógyszerész lista', 'liste de pharmacien', 'Λίστα φαρμακοποιό', 'Apotheker Liste', 'Lista farmacista', 'รายการเภสัชกร', 'فارماسسٹ فہرست', 'फार्मासिस्ट सूची', 'pharmacist album', 'Daftar apoteker', '薬剤師のリスト', '약사 목록'),
(84, 'add_pharmacist', 'add pharmacist', 'ফার্মাসিস্ট যোগ করুন', 'añadir farmacéutico', 'إضافة الصيدلي', 'voegen apotheker', 'добавить фармацевта', '加药剂师', 'eczacı ekleyin', 'adicionar farmacêutico', 'hozzá gyógyszerészét', 'ajouter pharmacien', 'προσθέστε το φαρμακοποιό', 'Apotheker hinzufügen', 'aggiungere il farmacista', 'เพิ่มเภสัชกร', 'فارماسسٹ شامل', 'फार्मासिस्ट जोड़', 'adde pharmacopola', 'menambahkan apoteker', '薬剤師を追加', '약사 추가'),
(85, 'pharmacist_name', 'pharmacist name', 'ফার্মাসিস্ট নাম', 'Nombre farmacéutico', 'اسم الصيدلي', 'naam apotheker', 'Фармацевт название', '药剂师名称', 'eczacı adı', 'Nome farmacêutico', 'gyógyszerész név', 'Nom du pharmacien', 'το όνομα του φαρμακοποιού', 'Apotheker Namen', 'Nome del farmacista', 'ชื่อเภสัชกร', 'فارماسسٹ کا نام', 'फार्मासिस्ट के नाम', 'pharmacist nomine', 'Nama apoteker', '薬剤師名', '약사 이름'),
(86, 'manage_laboratorist', 'manage laboratorist,eo', 'ল্যাবরেটরিস্ট পরিচালনা', 'gestionar laboratorista', 'إدارة laboratorist', 'beheren laboratorist', 'управлять laboratorist', '管理laboratorist“', 'laboratorist yönetmek', 'gerenciar laboratorista', 'kezelni laboratorist', 'gérer laboratorist', 'διαχείριση laboratorist', 'verwalten laboratorist', 'gestire laboratorist', 'จัดการ laboratorist', 'laboratorist کا انتظام', 'laboratorist प्रबंधन', 'laboratorist curo', 'mengelola laboratorist', 'laboratoristを管理', 'laboratorist 관리'),
(87, 'laboratorist_list', 'laboratorist list,eo', 'ল্যাবরেটরিস্ট তালিকা', 'Lista laboratorista', 'قائمة laboratorist', 'laboratorist lijst', 'laboratorist список', 'laboratorist列表', 'laboratorist liste', 'lista laboratorista', 'laboratorist lista', 'Liste d''laboratorist', 'Λίστα laboratorist', 'laboratorist Liste', 'Lista laboratorist', 'รายการ laboratorist', 'laboratorist فہرست', 'laboratorist सूची', 'laboratorist album', 'Daftar laboratorist', 'laboratoristリスト', 'laboratorist 목록'),
(88, 'add_laboratorist', 'add laboratorist,eo', 'ল্যাবরেটরিস্ট যোগ করুন', 'añadir laboratorista', 'إضافة laboratorist', 'voegen laboratorist', 'добавить laboratorist', '添加laboratorist“', 'laboratorist ekleyin', 'adicionar laboratorista', 'hozzá laboratorist', 'ajouter laboratorist', 'προσθήκη laboratorist', 'laboratorist hinzufügen', 'aggiungere laboratorist', 'เพิ่ม laboratorist', 'laboratorist شامل', 'laboratorist जोड़', 'adde laboratorist', 'tambahkan laboratorist', 'laboratoristを追加', 'laboratorist 추가'),
(89, 'laboratorist_name', 'laboratorist name,sl', 'ল্যাবরেটরিস্ট নাম', 'Nombre laboratorista', 'اسم laboratorist', 'naam laboratorist', 'laboratorist название', 'laboratorist名', 'laboratorist adı', 'nome laboratorista', 'laboratorist név', 'nom de laboratorist', 'Όνομα laboratorist', 'laboratorist Namen', 'Nome laboratorist', 'ชื่อ laboratorist', 'laboratorist نام', 'laboratorist नाम', 'nomen laboratorist', 'Nama laboratorist', 'laboratorist名', 'laboratorist 이름'),
(90, 'manage_accountant', 'manage accountant', 'হিসাবরক্ষক পরিচালনা', 'gestión contable', 'إدارة محاسب', 'beheren accountant', 'управлять бухгалтера', '管理会计师', 'muhasebeci yönetmek', 'gerenciar contador', 'kezelni könyvelő', 'gérer comptable', 'διαχείριση λογιστή', 'Buchhalter verwalten', 'gestione contabile', 'การจัดการบัญชี', 'اکاؤنٹنٹ کا انتظام', 'लेखाकार प्रबंधन', 'Ratiocinatore curo', 'mengelola akuntan', '会計士を管理', '회계 관리'),
(91, 'accountant_list', 'accountant list', 'হিসাবরক্ষক তালিকা', 'Lista de contador', 'قائمة محاسب', 'accountant lijst', 'бухгалтером список', '会计师名单', 'muhasebeci liste', 'Lista de contador', 'könyvelő lista', 'Liste comptable', 'Λίστα λογιστή', 'Buchhalter Liste', 'Lista ragioniere', 'รายการบัญชี', 'اکاؤنٹنٹ فہرست', 'लेखाकार सूची', 'Ratiocinatore album', 'Daftar akuntan', '会計士リスト', '회계사 목록'),
(92, 'add_accountant', 'add accountant', 'হিসাবরক্ষক যোগ করুন', 'añadir contador', 'إضافة محاسب', 'voegen accountant', 'добавить бухгалтера', '添加会计师', 'muhasebeci ekleyin', 'adicionar contador', 'hozzá könyvelő', 'ajouter comptable', 'προσθήκη λογιστή', 'Buchhalter hinzufügen', 'aggiungere ragioniere', 'เพิ่มบัญชี', 'اکاؤنٹنٹ شامل', 'एकाउंटेंट जोड़ना', 'adde Ratiocinatore', 'tambahkan akuntan', '会計士を追加', '회계사 추가'),
(93, 'accountant_name', 'accountant name', 'হিসাবরক্ষক নাম', 'Nombre del contador', 'اسم محاسب', 'naam accountant', 'бухгалтером название', '会计师名称', 'muhasebeci adı', 'Nome do contador', 'könyvelő név', 'Nom de l''expert-comptable', 'Όνομα λογιστή', 'Buchhalter Namen', 'Nome ragioniere', 'ชื่อบัญชี', 'اکاؤنٹنٹ کا نام', 'लेखाकार नाम', 'nomen Ratiocinatore', 'Nama akuntan', '会計士名', '회계사 이름'),
(94, 'phrase_list', 'phrase list', 'ফ্রেজ তালিকা', 'lista de frases', 'قائمة العبارة', 'woordgroepenlijst', 'список фраз', '短语列表', 'ifade liste', 'lista de frases', 'kifejezés lista', 'liste de phrase', 'Λίστα φράση', 'Phrase Liste', 'elenco frase', 'รายการวลี', 'جملہ فہرست', 'वाक्यांश सूची', 'phrase album', 'Daftar frase', 'フレーズリスト', '구문 목록'),
(95, 'add_phrase', 'add phrase', 'শব্দবন্ধ যোগ করুন', 'añadir una frase', 'إضافة العبارة', 'add zin', 'Добавить фразу', '加短语', 'ifade ekleme', 'adicionar frase', 'add kifejezés', 'ajouter phrase', 'Προσθήκη φράσης', 'Phrase hinzufügen', 'aggiungere la frase', 'เพิ่มวลี', 'فقرہ شامل کریں', 'वाक्यांश जोड़ना', 'addere phrase', 'menambahkan frase', 'フレーズを追加', '문구를 추가'),
(96, 'add_language', 'add language', 'ভাষা যুক্ত', 'añadir el idioma', 'إضافة لغة', 'add taal', 'добавить язык', '新增语言', 'dil eklemek', 'adicionar linguagem', 'nyelv hozzáadása', 'ajouter langue', 'προσθήκη γλώσσας', 'Sprache hinzufügen', 'aggiungere la lingua', 'เพิ่มภาษา', 'زبان کا اضافہ', 'भाषा जोड़ना', 'Linguam addere', 'menambah bahasa', '言語を追加する', '언어를 추가'),
(97, 'phrase', 'phrase', 'ফ্রেজ', 'frase', 'العبارة', 'frase', 'фраза', '短语', 'ifade', 'frase', 'kifejezés', 'phrase', 'φράση', 'Begriff', 'Frase', 'วลี', 'جملے', 'वाक्यांश', 'phrase', 'frasa', 'フレーズ', '구'),
(98, 'delete_language', 'delete language', 'ভাষা মুছে দিন', 'eliminar el idioma', 'لغة حذف', 'taal verwijderen', 'удалить язык', '删除语言', 'dil silmek', 'excluir linguagem', 'törlése nyelv', 'supprimer langue', 'διαγραφή γλώσσα', 'löschen Sprache', 'eliminare lingua', 'ลบภาษา', 'زبان کو خارج کر دیں', 'भाषा को हटाना', 'Linguam delete', 'menghapus bahasa', '言語を削除する', '언어를 삭제'),
(99, 'update_phrase', 'update phrase', 'ফ্রেজ আপডেট', 'actualizar frase', 'تحديث العبارة', 'updaten zin', 'обновления фразу', '更新短语', 'ifade güncelleme', 'atualizar frase', 'frissítés kifejezés', 'mettre à jour phrase', 'ενημέρωση φράση', 'aktualisieren Phrase', 'aggiornare frase', 'ปรับปรุงวลี', 'جملہ اپ ڈیٹ', 'वाक्यांश अद्यतन', 'phrase update', 'memperbarui frase', 'フレーズを更新', '문구를 업데이트'),
(100, 'time', 'time', 'সময়', 'tiempo', 'وقت', 'tijd', 'время', '时间', 'zaman', 'tempo', 'idő', 'heure', 'χρόνος', 'Zeit', 'volta', 'เวลา', 'وقت', 'समय', 'tempus', 'waktu', '時間', '시간'),
(101, 'amount', 'amount', 'পরিমাণ', 'cantidad', 'كمية', 'bedrag', 'количество', '量', 'miktar', 'quantidade', 'mennyiség', 'montant', 'ποσό', 'Betrag', 'importo', 'จำนวน', 'رقم', 'राशि', 'moles', 'jumlah', '額', '양'),
(102, 'payment_type', 'payment type', 'পেমেন্ট টাইপ', 'forma de pago', 'نوع الدفع', 'soort betaling', 'тип оплаты', '支付类型', 'ödeme türü', 'tipo de pagamento', 'fizetési módot', 'Type de paiement', 'Τύπος πληρωμής', 'Art der Bezahlung', 'Tipo di pagamento', 'ประเภทการชำระเงิน', 'ادائیگی کی قسم', 'भुगतान के प्रकार', 'type solutione', 'jenis pembayaran', '支払いタイプ', '지불 유형'),
(103, 'transaction_id', 'transaction id', 'লেনদেন আইডি', 'identificación de la transacción', 'رقم المعاملات', 'transaction id', 'ID транзакции', '事务ID', 'işlem kimliği', 'ID da transação', 'tranzakció id', 'Identifiant de transaction', 'id συναλλαγών', 'Transaktions-ID', 'id transazione', 'รายการ ID', 'ٹرانزیکشن کی شناخت', 'लेन - देन आईडी', 'id negotii', 'id transaksi', 'トランザクションID', '트랜잭션 ID');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `bengali`, `spanish`, `arabic`, `dutch`, `russian`, `chinese`, `turkish`, `portuguese`, `hungarian`, `french`, `greek`, `german`, `italian`, `thai`, `urdu`, `hindi`, `latin`, `indonesian`, `japanese`, `korean`) VALUES
(104, 'invoice_id', 'invoice id', 'চালান আইডি', 'Identificación factura', 'رقم الفاتورة', 'factuur id', 'счет-фактура ID', '发票编号', 'fatura id', 'id fatura', 'számla id', 'Identifiant facture', 'τιμολογίου id', 'Rechnung id', 'id fattura', 'id ของใบแจ้งหนี้', 'انوائس کی شناخت', 'चालान आईडी', 'ID cautionem', 'id faktur', '請求書のID', '송장 번호'),
(105, 'method', 'method', 'পদ্ধতি', 'método', 'طريقة', 'methode', 'метод', '方法', 'yöntem', 'método', 'módszer', 'méthode', 'μέθοδος', 'Verfahren', 'Metodo', 'วิธี', 'طریقہ', 'विधि', 'methodo', 'metode', '方法', '방법'),
(106, 'bed_list', 'bed list', 'বিছানা তালিকা', 'Lista de cama', 'قائمة سرير', 'bed lijst', 'кровать список', '床列表', 'yatak liste', 'Lista de cama', 'ágy lista', 'liste de lit', 'Λίστα κρεβάτι', 'Bett Liste', 'Lista letto', 'รายการเตียง', 'بستر کی فہرست', 'बिस्तर सूची', 'stratum album', 'Daftar tidur', 'ベッド一覧', '침대 목록'),
(107, 'bed_id', 'bed id', 'বিছানা আইডি', 'Identificación cama', 'معرف السرير', 'bed id', 'кровать ID', '床上ID', 'yatak id', 'id cama', 'ágy id', 'Identifiant du lit', 'id κρεβάτι', 'Bett-ID', 'id letto', 'ID เตียง', 'بستر کی شناخت', 'बिस्तर आईडी', 'ID lectulo', 'tidur id', 'ベッド番号', '침대 ID'),
(108, 'bed_type', 'bed type', 'বিছানা টাইপ', 'tipo de cama', 'نوع السرير', 'Type bed', 'тип кровати', '床型', 'yatak tipi', 'tipo de cama', 'szoba típus', 'Type de lit', 'τύπο κρεβατιού', 'Bett-Typ', 'Tipo di letto', 'ประเภทเตียง', 'بستر کی قسم', 'बिस्तर प्रकार', 'stratum typus', 'jenis tempat tidur', 'ベッドタイプ', '침대 유형'),
(109, 'allotment_time', 'allotment time', 'বন্টনের সময়', 'asignación del tiempo', 'وقت التخصيص', 'allotment tijd', 'выделение времени', '配发时间', 'tahsis süresi', 'tempo loteamento', 'elosztás idő', 'temps d''attribution', 'κατανομή του χρόνου', 'Zuteilung Zeit', 'tempo di riparto', 'เวลาจัดสรร', 'الاٹمنٹ کے وقت', 'आवंटन के समय', 'sortitio tempore', 'waktu penjatahan', '割当時間', '할당 시간'),
(110, 'discharge_time', 'discharge time', 'স্রাব সময়', 'tiempo de descarga', 'وقت التفريغ', 'ontlaadtijd', 'Время разряда', '放电时间', 'boşalma süresi', 'tempo de descarga', 'kisütési idő', 'temps de décharge', 'χρόνο εκροής', 'Entladezeit', 'tempo di scarica', 'เวลาปลดประจำการ', 'خارج ہونے والے مادہ کا وقت', 'छुट्टी के समय', 'tempus fluit', 'waktu pengosongan', '放電時間', '방전 시간'),
(111, 'bed_number', 'bed number', 'বেড সংখ্যা', 'número de la cama', 'عدد السرير', 'bed nummer', 'номер кровать', '床号', 'yatak sayısı', 'número cama', 'ágyszám', 'Numéro du lit', 'αριθμό κλινών', 'Bettnummer', 'numero letto', 'จำนวนเตียง', 'بیڈ نمبر', 'बिस्तर संख्या', 'torum numero', 'nomor tidur', 'ベッド数', '침대 수'),
(112, 'type', 'type', 'টাইপ', 'tipo', 'نوع', 'type', 'тип', '类型', 'tip', 'tipo', 'típus', 'catégorie', 'τύπος', 'Art', 'Tipo di', 'ชนิด', 'قسم', 'टाइप', 'type', 'jenis', 'タイプ', '유형'),
(113, 'blood_donor_list', 'blood donor list', 'রক্ত দাতার তালিকা', 'lista de donantes de sangre', 'قائمة متبرعين بالدم', 'bloeddonor lijst', 'Список доноров крови', '献血者名单', 'kan bağış yapanlar listesinde', 'lista de doadores de sangue', 'véradó lista', 'liste des donneurs de sang', 'αίμα λίστα των χορηγών', 'Blutspender Liste', 'Lista dei donatori di sangue', 'รายชื่อผู้บริจาคเลือด', 'خون کے عطیہ دہندگان کی فہرست', 'रक्त दाता सूची', 'sanguinem donator album', 'Daftar donor darah', '血液ドナーリスト', '혈액 기증자 목록'),
(114, 'last_donation_date', 'last donation date', 'শেষ দান জন্ম', 'última fecha de la donación', 'مشاركة تاريخ التبرع', 'laatste donatie datum', 'Дата последнего пожертвования', '最后捐赠日期', 'son bağış tarih', 'data da última doação', 'utolsó adomány dátum', 'date du dernier don', 'τελευταία ημερομηνία δωρεά', 'letzten Spende Datum', 'ultima data di donazione', 'วันที่บริจาคล่าสุด', 'گزشتہ عطیہ تاریخ', 'पिछले दान तारीख', 'novissimo tempore donationis', 'Tanggal sumbangan lalu', '最後の寄付日', '마지막으로 기부 날짜'),
(115, 'status', 'status', 'অবস্থা', 'estado', 'حالة', 'toestand', 'статус', '状态', 'durum', 'estado', 'állapot', 'statut', 'κατάσταση', 'Status', 'stato', 'สถานะ', 'درجہ', 'हैसियत', 'Status', 'status', 'ステータス', '지위'),
(116, 'category', 'category', 'বিভাগ', 'categoría', 'فئة', 'categorie', 'категория', '类别', 'kategori', 'categoria', 'kategória', 'catégorie', 'κατηγορία', 'Kategorie', 'categoria', 'หมวดหมู่', 'زمرے', 'श्रेणी', 'praedicamenti', 'kategori', 'カテゴリ', '범주'),
(117, 'price', 'price', 'দাম', 'precio', 'السعر', 'prijs', 'цена', '价格', 'fiyat', 'preço', 'ár', 'prix', 'τιμή', 'Preis', 'prezzo', 'ราคา', 'قیمت', 'कीमत', 'pretium', 'harga', '価格', '가격'),
(118, 'manufacturing_company', 'manufacturing company', 'উত্পাদন কোম্পানি', 'empresa de fabricación', 'شركة التصنيع', 'productiebedrijf', 'производственная фирма', '制造商', 'üretim şirketi', 'empresa de fabricação', 'gyártó cég', 'entreprise de fabrication', 'κατασκευαστική εταιρεία', 'Produktionsunternehmen', 'società di produzione', 'บริษัท ผู้ผลิต', 'مینوفیکچرنگ کمپنی', 'निर्माण कंपनी', 'vestibulum consortia', 'perusahaan manufaktur', '製造会社', '제조 회사'),
(119, 'view_operation_report', 'view operation report', 'অপারেশন রিপোর্ট', 'ver la confirmación de la operación', 'عرض تقرير العملية', 'bekijk bediening rapport', 'просмотреть отчет о работе', '查看操作报告', 'çalışma raporunu görüntülemek', 'exibir o relatório de operação', 'megtekintéséhez működéséről szóló jelentés', 'voir rapport d''opération', 'δείτε αναφορά λειτουργίας', 'OP-Bericht ansehen', 'visualizzare il report di funzionamento', 'ดูรายงานการดำเนินงาน', 'آپریشن کی رپورٹ دیکھنے کے', 'ऑपरेशन रिपोर्ट को देखने', 'considerabit operatio auditui', 'melihat laporan operasi', '操作レポートを表示', '운영 보고서를 보려면'),
(120, 'view_report', 'view report', 'রিপোর্ট', 'ver el informe', 'عرض تقرير', 'rapport bekijken', 'Просмотреть отчет', '查看报告', 'Raporu görüntülemek', 'ver relatório', 'jelentés megtekintése', 'voir rapport', 'προβάλετε την αναφορά', 'Bericht ansehen', 'visualizzare il report', 'ดูรายงาน', 'رپورٹ دیکھنے کے', 'रिपोर्ट देखने', 'considerabit auditui', 'melihat laporan', 'レポートを見る', '보고서를 보려면'),
(121, 'date', 'date', 'জন্ম', 'fecha', 'تاريخ', 'datum', 'дата', '日', 'tarih', 'data', 'dátum', 'Date', 'ημερομηνία', 'Datum', 'Data', 'วันที่', 'تاریخ', 'तारीख', 'date', 'tanggal', '日付', '날짜'),
(122, 'noticeboard_list', 'noticeboard list', 'নোটিশবোর্ড তালিকা', 'Lista tablón de anuncios', 'قائمة اللافتة', 'prikbord lijst', 'доске объявлений список', '布告名单', 'panosuna liste', 'lista de avisos', 'üzenőfalán lista', 'liste de tableau d''affichage', 'Λίστα Ανακοινώσεων', 'Brett Liste', 'Lista bacheca', 'รายการ noticeboard', 'noticeboard فہرست', 'नोटिसबोर्ड सूची', 'noticeboard album', 'daftar pengumuman', '掲示板一覧', '공지 사항 more 목록'),
(123, 'add_noticeboard', 'add noticeboard', 'নোটিশবোর্ড যোগ করুন', 'añadir tablón de anuncios', 'إضافة اللافتة', 'voegen prikbord', 'добавить доску объявлений', '加布告', 'panosuna ekleyin', 'adicionar avisos', 'hozzá üzenőfalán', 'ajouter tableau d''affichage', 'προσθήκη Ανακοινώσεων', 'hinzufügen noticeboard', 'aggiungere bacheca', 'เพิ่ม noticeboard', 'noticeboard شامل', 'नोटिसबोर्ड जोड़', 'adde noticeboard', 'tambahkan pengumuman', '掲示板を追加', '공지 사항 more를 추가'),
(124, 'title', 'title', 'শিরোনাম', 'título', 'لقب', 'titel', 'название', '标题', 'başlık', 'título', 'cím', 'titre', 'τίτλος', 'Titel', 'titolo', 'ชื่อเรื่อง', 'عنوان', 'शीर्षक', 'title', 'judul', 'タイトル', '이름'),
(125, 'notice', 'notice', 'বিজ্ঞপ্তি', 'notar', 'إشعار', 'opmerken', 'замечать', '注意', 'dikkat', 'notar', 'észrevesz', 'remarquer', 'ανακοίνωση', 'Bekanntmachung', 'preavviso', 'สังเกตเห็น', 'نوٹس', 'नोटिस', 'Observa', 'memperhatikan', '気付く', '통지'),
(126, 'system_name', 'system name', 'সিস্টেমের নামের', 'Nombre del sistema', 'اسم النظام', 'Name System', 'имя системы', '系统名称', 'sistemi adı', 'nome do sistema', 'rendszer neve', 'nom de système', 'όνομα του συστήματος', 'System Name', 'nome del sistema', 'ชื่อระบบ', 'نظام کا نام', 'सिस्टम नाम', 'nomen ratio', 'nama sistem', 'システム名', '시스템 이름'),
(127, 'save', 'save', 'সংরক্ষণ করুন', 'guardar', 'حفظ', 'sparen', 'экономить', '节省', 'kurtarmak', 'salvar', 'kivéve', 'sauver', 'εκτός', 'speichern', 'salva', 'ประหยัด', 'کو بچانے کے', 'बचाना', 'Salvum', 'menyimpan', '保存', '저장'),
(128, 'system_email', 'system email', 'সিস্টেম ইমেল', 'sistema de correo electrónico', 'نظام البريد الإلكتروني', 'systeem e-mail', 'системы электронной почты', '电子邮件系统', 'sistemi e-posta', 'sistema de e-mail', 'rendszer email', 'email de système', 'σύστημα ηλεκτρονικού ταχυδρομείου', 'E-Mail-System', 'e-mail del sistema', 'ระบบอีเมล', 'نظام کی ای میل', 'प्रणाली ईमेल', 'email ratio', 'email sistem', 'システムのメール', '시스템 전자 메일'),
(129, 'system_title', 'system title', 'সিস্টেম শিরোনাম', 'Título sistema', 'عناوين النظام', 'systeem titel', 'Система название', '系统标题', 'Sistem başlık', 'título sistema', 'rendszer cím', 'titre du système', 'Τίτλος του συστήματος', 'System Titel', 'del titolo di sistema', 'ชื่อระบบ', 'نظام عنوان', 'सिस्टम शीर्षक', 'ratio title', 'judul sistem', 'システムのタイトル', '시스템 제목'),
(130, 'paypal_email', 'paypal email', 'PayPal এর ইমেইল', 'email paypal', 'البريد الإلكتروني باي بال', 'paypal e-mail', 'PayPal e-mail', 'PayPal电子邮件', 'paypal e-posta', 'email paypal', 'paypal email', 'email paypal', 'paypal email', 'paypal E-Mail', 'email paypal', 'อีเมล์ PayPal', 'پے پال ای میل', 'पेपैल ईमेल', 'Paypal email', 'email paypal', 'ペイパルメール', '페이팔 이메일'),
(131, 'currency', 'currency', 'মুদ্রা', 'moneda', 'عملة', 'valuta', 'валюта', '货币', 'para', 'moeda', 'valuta', 'monnaie', 'νόμισμα', 'Währung', 'valuta', 'เงินตรา', 'کرنسی', 'मुद्रा', 'monetæ', 'mata uang', '通貨', '통화'),
(132, 'restore', 'restore', 'প্রত্যর্পণ করা', 'restaurar', 'استعادة', 'herstellen', 'восстановление', '恢复', 'geri', 'restaurar', 'visszaad', 'rétablir', 'αποκατάσταση', 'wiederherstellen', 'ripristinare', 'ฟื้นฟู', 'بحال', 'बहाल', 'restituo', 'memulihkan', '復元する', '복원'),
(133, 'report', 'report', 'প্রতিবেদন', 'reportar', 'تقرير', 'rapporteren', 'сообщить', '报告', 'rapor', 'denunciar', 'jelentés', 'signaler', 'έκθεση', 'berichten', 'segnalare', 'แจ้ง', 'رپورٹ', 'रिपोर्ट', 'referrent', 'melaporkan', 'レポート', '보고'),
(134, 'all', 'all', 'সমস্ত', 'todo', 'كل', 'alle', 'все', '所有', 'tüm', 'tudo', 'minden', 'tous', 'όλα', 'alle', 'tutti', 'ทั้งหมด', 'تمام', 'सब', 'omnes', 'semua', 'すべて', '모든'),
(135, 'upload_&_restore_from_backup', 'upload & restore from backup', 'আপলোড & ব্যাকআপ থেকে পুনঃস্থাপন', 'cargar y restaurar la copia de seguridad', 'تحميل واستعادة من النسخة الاحتياطية', 'uploaden en terugzetten van een backup', 'загрузить и восстановить из резервной копии', '上传及从备份中还原', 'yüklemek ve yedekten geri yükleme', 'enviar e restaurar a partir de backup', 'feltölteni és visszaállítani backup', 'télécharger et de restauration de la sauvegarde', 'ανεβάσετε και επαναφορά από backup', 'Upload und Wiederherstellung von Backups', 'caricare e ripristinare dal backup', 'อัพโหลดและเรียกคืนจากการสำรองข้อมูล', 'اپ لوڈ اور بیک اپ سے بحال', 'अपलोड और बैकअप से बहाल', '&amp; restituo ex tergum upload', 'meng-upload &amp; restore dari backup', 'アップロード＆バックアップから復元', '업로드 및 백업에서 복원'),
(136, 'manage_profile', 'manage profile', 'প্রফাইল পরিচালনা', 'gestionar el perfil', 'إدارة الملف الشخصي', 'beheren profiel', 'Управление профилем', '管理配置文件', 'profilinizi', 'gerenciar o perfil', 'Profil kezelése', 'Gérer le profil', 'διαχειριστείτε το προφίλ', 'Profil verwalten', 'gestire il profilo', 'จัดการรายละเอียด', 'پروفائل کا انتظام', 'प्रोफ़ाइल का प्रबंधन', 'aget profile', 'mengelola profil', 'プロファイルの管理', '프로필 (내 정보) 관리'),
(137, 'update_profile', 'update profile', 'প্রোফাইল আপডেট', 'actualizar el perfil', 'تحديث الملف الشخصي', 'updaten profiel', 'обновления профиля', '更新个人资料', 'Profil güncelleme', 'atualizar o perfil', 'Profil frissítése', 'mettre à jour le profil', 'ενημερώσετε το προφίλ', 'Profil aktualisieren', 'aggiornare il profilo', 'ปรับปรุงรายละเอียด', 'پروفائل کی تازہ کاری', 'प्रोफ़ाइल का अद्यतन', 'update profile', 'memperbarui profil', 'プロファイルを更新', '프로필을 업데이트'),
(138, 'change_password', 'change password', 'পাসওয়ার্ড পরিবর্তন করুন', 'cambiar la contraseña', 'تغيير كلمة المرور', 'wachtwoord wijzigen', 'сменить пароль', '更改密码', 'şifresini değiştirmek', 'alterar a senha', 'jelszó megváltoztatása', 'changer le mot de passe', 'αλλάξετε τον κωδικό πρόσβασης', 'Kennwort ändern', 'modificare la password', 'เปลี่ยนรหัสผ่าน', 'پاس ورڈ تبدیل کریں', 'पासवर्ड बदलना', 'mutare password', 'mengubah password', 'パスワードを変更する', '암호를 변경'),
(139, 'new_password', 'new password', 'নতুন পাসওয়ার্ড', 'nueva contraseña', 'كلمة مرور جديدة', 'nieuw wachtwoord', 'новый пароль', '新密码', 'Yeni şifre', 'nova senha', 'Új jelszó', 'nouveau mot de passe', 'νέο κωδικό', 'Neues Passwort', 'nuova password', 'รหัสผ่านใหม่', 'نیا پاس ورڈ', 'नया पासवर्ड', 'Novum password', 'sandi baru', '新しいパスワード', '새 암호를'),
(140, 'confirm_new_password', 'confirm new password', 'নতুন পাসওয়ার্ড নিশ্চিত করুন', 'confirmar nueva contraseña', 'تأكيد كلمة المرور الجديدة', 'Bevestig nieuw wachtwoord', 'Подтвердите новый пароль', '确认新密码', 'yeni parolayı onaylayın', 'confirmar nova senha', 'erősítse meg az új jelszót', 'confirmer le nouveau mot de passe', 'επιβεβαιώσετε το νέο κωδικό', 'Bestätigen eines neuen Kennwortes', 'confermare la nuova password', 'ยืนยันรหัสผ่านใหม่', 'نئے پاس ورڈ کی توثیق', 'नए पासवर्ड की पुष्टि', 'Confirmabit novum Signum', 'konfirmasi password baru', '新しいパスワードを確認', '새 암호를 확인합니다'),
(141, 'update_password', 'update password', 'হালনাগাদ পাসওয়ার্ড', 'actualización de la contraseña', 'تحديث كلمة السر', 'Update wachtwoord', 'Обновление пароля', '更新密码', 'güncelleştirme şifre', 'atualização de senha', 'frissítési jelszó', 'mise à jour le mot de passe', 'ενημερώσετε τον κωδικό πρόσβασης', 'Update vergessen', 'aggiornamento della password', 'รหัสผ่านการปรับปรุง', 'اپ ڈیٹ پاس ورڈ', 'अद्यतन पासवर्ड', 'update Signum', 'Update sandi', 'パスワードを更新', '업데이트 암호'),
(142, 'option', 'option', 'বিকল্প', 'opción', 'خيار', 'optie', 'вариант', '选项', 'seçenek', 'opção', 'opció', 'choix', 'επιλογή', 'Wahl', 'opzione', 'การเลือก', 'آپشن', 'विकल्प', 'optionem', 'opsi', 'オプション', '선택권'),
(143, 'edit_phrase', 'edit phrase', 'ফ্রেজ সম্পাদনা', 'editar frase', 'تحرير العبارة', 'bewerk zin', 'редактировать фразу', '编辑短语', 'ifade düzenlemek', 'editar frase', 'szerkesztés kifejezés', 'éditer phrase', 'επεξεργαστείτε φράση', 'bearbeiten Phrase', 'modificare frase', 'แก้ไขวลี', 'جملہ ترمیم کریں', 'वाक्यांश को संपादित', 'recensere phrase', 'mengedit frase', 'フレーズを編集', '문구를 편집'),
(144, 'edit_noticeboard', 'edit noticeboard', 'নোটিশবোর্ড সম্পাদনা', 'editar tablón de anuncios', 'تعديل اللافتة', 'bewerk prikbord', 'редактировать доске объявлений', '编辑布告', 'panosuna düzenleme', 'editar avisos', 'szerkesztés hirdetőtábla', 'éditer panneau d''', 'επεξεργαστείτε Ανακοινώσεων', 'bearbeiten noticeboard', 'modificare bacheca', 'แก้ไข noticeboard', 'noticeboard ترمیم کریں', 'नोटिसबोर्ड संपादित', 'recensere noticeboard', 'mengedit pengumuman', '掲示板を編集', '공지 사항 more 편집'),
(145, 'doctor_dashboard', 'doctor dashboard', 'ডাক্তার ড্যাশবোর্ড', 'médico salpicadero', 'طبيب لوحة أجهزة القياس', 'arts dashboard', 'Врач приборной панели', '医生仪表板', 'doktor paneli', 'médico dashboard', 'orvos műszerfal', 'médecin tableau de bord', 'Ο γιατρός ταμπλό', 'Arzt Armaturenbrett', 'medico cruscotto', 'แผงควบคุมของแพทย์', 'ڈاکٹر ڈیش بورڈ', 'डॉक्टर डैशबोर्ड', 'Medicus Dashboard', 'Dokter dashboard', '医師ダッシュ', '의사 대시 보드'),
(146, 'manage_appointment', 'manage appointment', 'অ্যাপয়েন্টমেন্ট পরিচালনা', 'gestionar cita', 'تعيين إدارة', 'beheren afspraak', 'управлять назначением', '管理预约', 'randevu yönetmek', 'gerenciar nomeação', 'kezelni találkozó', 'gérer les rendez-vous', 'διαχείριση ραντεβού', 'Termin verwalten', 'gestire appuntamento', 'จัดการแต่งตั้ง', 'تقرری کا انتظام', 'नियुक्ति का प्रबंधन', 'gere institutionis', 'mengelola janji', 'アポイントメントを管理', '약속을 관리'),
(147, 'manage_prescription', 'manage prescription', 'প্রেসক্রিপশন পরিচালনা', 'gestión de la prescripción', 'إدارة وصفة طبية', 'beheren recept', 'управлять рецепту', '处方管理', 'reçete yönetmek', 'gerenciar prescrição', 'kezelni recept', 'gérer prescription', 'διαχείριση συνταγή', 'verwalten Rezept', 'gestire prescrizione', 'บริหารจัดการตามใบสั่งแพทย์', 'نسخے کا انتظام', 'पर्चे का प्रबंधन', 'praescriptio curo', 'mengelola resep', '処方箋を管理', '처방 관리'),
(148, 'manage_report', 'manage report', 'রিপোর্ট পরিচালনা', 'gestionar informe', 'إدارة تقرير', 'rapport beheren', 'управлять отчета', '管理报告', 'rapor yönetmek', 'gerenciar relatório', 'kezelni jelentés', 'gérer rapport', 'διαχειρίζονται την έκθεση', 'verwalten Bericht', 'gestione rapporto', 'จัดการรายงาน', 'رپورٹ کا انتظام', 'रिपोर्ट का प्रबंधन', 'fama curo', 'mengelola laporan', 'レポートの管理', '보고서 관리'),
(149, 'prescription', 'prescription', 'প্রেসক্রিপশন', 'prescripción', 'وصفة طبية', 'recept', 'рецепт', '处方', 'reçete', 'prescrição', 'recept', 'ordonnance', 'συνταγή', 'Verschreibung', 'prescrizione', 'ใบสั่งยา', 'نسخے', 'नुस्खा', 'praescriptio', 'resep', '処方箋', '처방'),
(150, 'edit_patient', 'edit patient', 'রোগীর সম্পাদনা', 'editar paciente', 'تحرير المريض', 'bewerk patiënt', 'редактировать пациента', '编辑患者', 'Hasta düzenleme', 'editar paciente', 'szerkesztés beteg', 'éditer des patients', 'επεξεργαστείτε ασθενή', 'Bearbeitung von Patientendaten', 'modificare paziente', 'แก้ไขผู้ป่วย', 'مریض میں ترمیم کریں', 'रोगी को संपादित', 'recensere patientes', 'mengedit pasien', '患者を編集', '환자를 편집'),
(151, 'appointment_list', 'appointment list', 'অ্যাপয়েন্টমেন্ট তালিকা', 'lista de citas', 'قائمة التعيين', 'afsprakenlijst', 'Назначение списка', '任命名单', 'randevu listesi', 'lista de compromissos', 'kinevezés lista', 'liste des rendez-vous', 'κατάλογο διοριστέων', 'Terminliste', 'Lista appuntamento', 'รายการได้รับการแต่งตั้ง', 'تقرری کی فہرست', 'नियुक्ति सूची', 'Nominatio album', 'Daftar janji', 'アポイントメントリスト', '약속 목록'),
(152, 'add_appointment', 'add appointment', 'অ্যাপয়েন্টমেন্ট যোগ করুন', 'añadir cita', 'إضافة موعد', 'voegen afspraak', 'добавить назначения', '加预约', 'randevu eklemek', 'adicionar nomeação', 'hozzá találkozó', 'ajouter rendez-vous', 'προσθέστε το διορισμό', 'neuen Termin', 'aggiungere appuntamento', 'เพิ่มการแต่งตั้ง', 'تقرری شامل', 'नियुक्ति जोड़', 'adde constitutio', 'menambahkan penunjukan', '予定を追加', '약속 추가'),
(153, 'edit_appointment', 'edit appointment', 'অ্যাপয়েন্টমেন্ট সম্পাদনা', 'editar nombramiento', 'تعديل موعد', 'bewerk afspraak', 'редактировать назначения', '编辑预约', 'randevu düzenleme', 'editar nomeação', 'szerkesztés találkozó', 'modifier les rendez-vous', 'επεξεργαστείτε ραντεβού', 'Termin bearbeiten', 'modificare appuntamento', 'แก้ไขการแต่งตั้ง', 'تقرری میں ترمیم کریں', 'नियुक्ति संपादित', 'recensere constitutio', 'mengedit janji', '任命を編集', '약속을 편집합니다'),
(154, 'prescription_list', 'prescription list', 'প্রেসক্রিপশন তালিকা', 'Lista de prescripción', 'قائمة وصفة طبية', 'recept lijst', 'рецепт список', '药物名单', 'reçete listesi', 'Lista de prescrição', 'recept lista', 'liste prescription', 'συνταγή λίστα', 'Rezept Liste', 'Lista prescrizione', 'รายการใบสั่งยา', 'نسخے کی فہرست', 'पर्चे की सूची', 'praescriptio album', 'Daftar resep', '処方リスト', '처방전 목록'),
(155, 'add_prescription', 'add prescription', 'প্রেসক্রিপশন যোগ করুন', 'añadir receta', 'إضافة وصفة طبية', 'add recept', 'добавить рецепт', '将处方', 'reçete ekleyin', 'adicionar prescrição', 'hozzá recept', 'ajouter prescription', 'προσθήκη συνταγή', 'Rezept hinzufügen', 'aggiungere prescrizione', 'เพิ่มตามใบสั่งแพทย์', 'نسخے شامل', 'पर्चे जोड़', 'adde praescriptione', 'menambahkan resep', '処方箋を追加', '처방전을 추가'),
(156, 'case_history', 'case history', 'রোগীর স্বাস্থ্যাদির বিবরণ', 'historia clínica', 'تاريخ الحالة', 'anamnese', 'история болезни', '病历', 'geçmiş', 'história do caso', 'kórtörténet', 'anamnèse', 'ιατρικό ιστορικό ασθενούς', 'Anamnese', 'case history', 'ประวัติผู้ป่วย', 'کیس کی تاریخ', 'पूर्ववृत्त', 'ita history', 'hal ihwal', '病歴', '병력'),
(157, 'add_description', 'add description', 'বিবরণ যুক্ত করুন', 'añadir una descripción', 'إضافة الوصف', 'add omschrijving', 'добавить описание', '添加描述', 'Açıklama eklemek', 'adicionar uma descrição', 'Leírás hozzáadása', 'ajouter une description', 'προσθέσετε την περιγραφή', 'Beschreibung hinzufügen', 'aggiungere descrizione', 'เพิ่มรายละเอียด', 'تفصیل شامل', 'विवरण जोड़ें', 'adde descriptionem', 'menambahkan deskripsi', '説明を追加', '설명을 추가'),
(158, 'medication', 'medication', 'চিকিত্সা', 'medicación', 'دواء', 'geneesmiddel', 'лекарство', '药物治疗', 'ilaç', 'medicação', 'gyógyszer', 'médication', 'φάρμακο', 'Behandlung', 'medicazione', 'การรักษาด้วยยา', 'ادویات', 'इलाज', 'medication', 'obat', '投薬', '약물 치료'),
(159, 'medication_from_pharmacist', 'medication from pharmacist', 'ফার্মাসিস্টের কাছ থেকে ঔষধ', 'medicamento del farmacéutico', 'الدواء من الصيدلي', 'medicatie van apotheker', 'лекарство от фармацевта', '从药师用药', 'eczacıdan ilaç', 'medicação de farmacêutico', 'gyógyszert gyógyszerész', 'médicaments de pharmacien', 'φάρμακα από τον φαρμακοποιό', 'Medikamente von Apotheker', 'farmaci da farmacista', 'ยาจากเภสัชกร', 'فارماسسٹ سے ادویات', 'फार्मासिस्ट से दवा', 'medication a pharmacopola', 'obat dari apoteker', '薬剤師から薬', '약사의 약물 치료'),
(160, 'edit_prescription', 'edit prescription', 'প্রেসক্রিপশন সম্পাদনা', 'editar prescripción', 'تحرير وصفة طبية', 'bewerk recept', 'редактировать рецепту', '编辑处方', 'reçete düzenlemek', 'editar prescrição', 'szerkesztés recept', 'modifier prescription', 'επεξεργαστείτε συνταγή', 'bearbeiten Rezept', 'modificare prescrizione', 'แก้ไขใบสั่งยา', 'نسخے میں ترمیم کریں', 'पर्चे संपादित', 'recensere praescriptione', 'mengedit resep', '処方箋を編集', '처방전을 편집합니다'),
(161, 'diagnosis_report', 'diagnosis report', 'রোগ নির্ণয়ের রিপোর্ট', 'informe de diagnóstico', 'تقرير التشخيص', 'diagnose rapport', 'Диагноз отчет', '诊断报告', 'tanı raporu', 'relatório de diagnóstico', 'diagnózis jelentés', 'rapport de diagnostic', 'Έκθεση διάγνωση', 'Diagnose Bericht', 'rapporto di diagnosi', 'รายงานการวินิจฉัย', 'تشخیص کی رپورٹ', 'निदान रिपोर्ट', 'fama diagnosis', 'Laporan diagnosis', '診断レポート', '진단 보고서'),
(162, 'report_type', 'report type', 'টাইপ প্রতিবেদন', 'informar de tipo', 'نوع التقرير', 'Type melden', 'Тип отчета', '报告类型', 'türlü rapor', 'denunciar o tipo', 'Jelentés típusa', 'Type de rapport', 'Αναφορά Ειδών', 'berichten Art', 'Tipo di rapporto', 'แจ้งประเภท', 'قسم کی رپورٹ', 'प्रकार रिपोर्ट', 'type referrent', 'melaporkan jenis', 'レポートの種類', '유형을보고'),
(163, 'document_type', 'document type', 'নথির ধরণ', 'tipo de documento', 'نوع الوثيقة', 'documenttype', 'тип документа', '文件类型', 'belge türü', 'tipo de documento', 'dokumentum típusa', 'type de document', 'Τύπος εγγράφου', 'Belegart', 'tipo di documento', 'ประเภทของเอกสาร', 'دستاویز کی قسم', 'दस्तावेज़ प्रकार', 'genus scripti', 'Jenis dokumen', 'ドキュメントタイプ', '문서 유형'),
(164, 'download', 'download', 'ডাউনলোড', 'descargar', 'تحميل', 'downloaden', 'скачать', '下载', 'indir', 'baixar', 'letöltés', 'télécharger', 'κατεβάστε', 'downloaden', 'caricare', 'ดาวน์โหลด', 'ڈاؤن لوڈ، اتارنا', 'डाउनलोड', 'download', 'mendownload', 'ダウンロード', '다운로드'),
(165, 'manage_bed_allotment', 'manage bed allotment', 'বিছানা অ্যালটমেন্ট পরিচালনা', 'gestionar adjudicación cama', 'إدارة المخصصات السرير', 'beheren bed toewijzing', 'управлять кроватью выделение', '管理床配发', 'yatak tahsis yönetmek', 'gerenciar cama loteamento', 'kezelni ágy elosztás', 'gérer l''attribution de lit', 'διαχείριση κατανομής κρεβάτι', 'verwalten Bett Zuteilung', 'gestire letto riparto', 'บริหารจัดการการจัดสรรเตียง', 'بستر الاٹمنٹ کا انتظام', 'बिस्तर आवंटन का प्रबंधन', 'partem stratum curo', 'mengelola tidur penjatahan', 'ベッドの割当てを管理する', '침대 부담금 관리'),
(166, 'bed_allotment_list', 'bed allotment list', 'বিছানা আবণ্টন তালিকা', 'lista de adjudicación cama', 'قائمة تخصيص سرير', 'bed toewijzing lijst', 'Список кровать выделение', '床上配发清单', 'yatak tahsis liste', 'lista loteamento cama', 'ágy elosztás lista', 'liste d''attribution de lit', 'κρεβάτι λίστα κατανομής', 'Bett Zuteilung Liste', 'Lista riparto letto', 'รายการจัดสรรเตียง', 'بستر الاٹمنٹ کی فہرست', 'बिस्तर आवंटन सूची', 'partem stratum album', 'daftar tempat tidur penjatahan', 'ベッド割当一覧', '침대 할당 목록'),
(167, 'add_bed_allotment', 'add bed allotment', 'বিছানা অ্যালটমেন্ট যোগ করুন', 'añadir adjudicación cama', 'إضافة تخصيص سرير', 'add bed toewijzing', 'добавить кровать выделение', '加床上配发', 'yatak tahsis ekleyin', 'adicionar cama loteamento', 'hozzá ágy elosztás', 'ajouter attribution de lit', 'προσθήκη κατανομής κρεβάτι', 'hinzufügen Bett Zuteilung', 'aggiungere letto riparto', 'เพิ่มการจัดสรรเตียง', 'بستر الاٹمنٹ شامل', 'बिस्तर आवंटन जोड़', 'adde lectum sorti', 'tambahkan tidur penjatahan', 'ベッド割当てを追加', '침대 할당을 추가'),
(168, 'allotment_date_time', 'allotment date time', 'অ্যালটমেন্ট তারিখ সময়', 'Fecha y hora de adjudicación', 'تخصيص وقت التسجيل', 'toewijzing datum tijd', 'Время выделения дате', '配发日期时间', 'tahsis tarih saat', 'atribuição de data e hora', 'elosztás dátum időpont', 'lotissement date heure', 'κατανομή του χρόνου ημερομηνία', 'Zuteilung Datum Zeit', 'riparto data ora', 'วันที่เวลาจัดสรร', 'الاٹمنٹ تاریخ وقت', 'आवंटन की तारीख समय', 'sortitio date tempore', 'penjatahan waktu tanggal', '割当日の時間', '부담금 날짜 시간'),
(169, 'discharge_date_time', 'discharge date time', 'স্রাব তারিখ সময়', 'Fecha y hora de descarga', 'تصريف الوقت التسجيل', 'ontslagdatum tijd', 'время разряда дате', '出院日期时间', 'deşarj tarih saat', 'descarga de data e hora', 'kisülési dátum időpont', 'temps de décharge de la date', 'Απαλλαγή ημερομηνίας και ώρας', 'Entlastung Datum Zeit', 'tempo di scarico data', 'เวลาวันที่ปลดประจำการ', 'خارج ہونے والے مادہ تاریخ وقت', 'मुक्ति दिनांक समय', 'date tempore missionem', 'discharge waktu tanggal', '放電日時', '방전 된 날짜와 시간'),
(170, 'operation', 'operation', 'অপারেশন', 'operación', 'عملية', 'operatie', 'операция', '手术', 'operasyon', 'operação', 'működés', 'opération', 'λειτουργία', 'Betrieb', 'operazione', 'การทำงาน', 'آپریشن', 'आपरेशन', 'Operatio', 'operasi', '操作', '운전'),
(171, 'birth', 'birth', 'আমার', 'nacimiento', 'الولادة', 'geboorte', 'рождение', '分娩', 'doğum', 'nascimento', 'szülés', 'naissance', 'γέννηση', 'Geburt', 'nascita', 'กำเนิด', 'پیدائش', 'जन्म', 'Nativitas', 'kelahiran', '出産', '출생'),
(172, 'death', 'death', 'মৃতু্য', 'muerte', 'الموت', 'dood', 'смерть', '死亡', 'ölüm', 'morte', 'halál', 'décès', 'θάνατος', 'Sterben', 'scomparsa', 'ความตาย', 'موت', 'मौत', 'mortem', 'kematian', '死', '죽음'),
(173, 'other', 'other', 'অন্য', 'otro', 'آخر', 'ander', 'другой', '其他', 'diğer', 'outro', 'más', 'autre', 'άλλος', 'andere', 'altro', 'อื่น ๆ', 'دیگر', 'अन्य', 'aliud', 'lain', 'その他', '다른'),
(174, 'add_report', 'add report', 'প্রতিবেদনে যোগ', 'agregar informe', 'إضافة تقرير', 'verslag toe te voegen', 'Добавить отчет', '加报告', 'rapor ekleyin', 'adicionar relatório', 'hozzá jelentés', 'Ajouter un rapport', 'προσθέστε την έκθεση', 'Bericht hinzufügen', 'aggiungere rapporto', 'เพิ่มรายงาน', 'رپورٹ میں شامل', 'रिपोर्ट जोड़', 'adde auditui', 'menambahkan laporan', 'レポートを追加', '보고서를 추가'),
(175, 'patient_dashboard', 'patient dashboard', 'রোগীর ড্যাশবোর্ড', 'tablero paciente', 'لوحة أجهزة القياس المريض', 'patiënt dashboard', 'Пациент приборной панели', '病人的仪表板', 'Hasta tablosu', 'dashboard paciente', 'beteg műszerfal', 'tableau de bord patients', 'ασθενούς ταμπλό', 'Patienten Armaturenbrett', 'cruscotto paziente', 'แผงควบคุมผู้ป่วย', 'مریض ڈیش بورڈ', 'रोगी डैशबोर्ड', 'Patientes Dashboard', 'dashboard pasien', '患者ダッシュ', '환자의 대시 보드'),
(176, 'view_prescription', 'view prescription', 'প্রেসক্রিপশন দেখতে', 'ver receta', 'عرض وصفة طبية', 'bekijk recept', 'просмотр рецепта', '查看处方', 'tanımını görüntülemek', 'ver prescrição', 'megtekintéséhez recept', 'voir prescription', 'δείτε συνταγή', 'Rezept ansehen', 'visualizzare prescrizione', 'ดูตามใบสั่งแพทย์', 'نسخے دیکھنے کے', 'पर्चे देखने', 'considerabit praescriptione', 'lihat resep', '処方箋を見る', '처방보기'),
(177, 'view_doctor', 'view doctor', 'ডাক্তার দেখতে', 'ver médico', 'عرض الطبيب', 'bekijk arts', 'просмотреть врача', '查看医生', 'doktor görmek', 'vista médico', 'megtekintéséhez orvos', 'voir un médecin', 'δείτε το γιατρό', 'Arzt sehen', 'vista medico', 'ดูหมอ', 'ڈاکٹر کو دیکھنے کے', 'चिकित्सक देखने', 'considerabit medicum', 'lihat dokter', 'ビュー医者', '의사보기'),
(178, 'admit_history', 'admit history', 'ইতিহাস সত্য বলিয়া স্বীকার করা', 'admitir la historia', 'أعترف التاريخ', 'toegeven geschiedenis', 'признать историю', '承认历史', 'tarihi itiraf', 'admitir história', 'elismerem történelem', 'admettre histoire', 'παραδέχονται ιστορία', 'zugeben Geschichte', 'ammettere storia', 'ยอมรับประวัติศาสตร์', 'تاریخ کا اعتراف', 'इतिहास मानता', 'fatentur historiam', 'mengakui sejarah', '歴史を認める', '역사를 인정'),
(179, 'operation_history', 'operation history', 'অপারেশন ইতিহাস', 'historial de operaciones', 'تاريخ العملية', 'bedieningsgeschiedenis', 'истории операций', '手术史', 'operasyon öyküsü', 'histórico de operação', 'működés történelem', 'historique de fonctionnement', 'Ιστορικό λειτουργίας', 'Betrieb Geschichte', 'storia operazione', 'ประวัติศาสตร์การดำเนินงาน', 'آپریشن کی تاریخ', 'आपरेशन इतिहास', 'operatio history', 'sejarah operasi', '運転履歴', '작업 내역'),
(180, 'view_invoice', 'view invoice', 'চালান দেখতে', 'ver la factura', 'عرض الفاتورة', 'bekijk factuur', 'Просмотреть счет', '查看发票', 'fatura görmek', 'ver fatura', 'megtekintéséhez számla', 'voir facture', 'δείτε το τιμολόγιό', 'anzuzeigen Rechnung', 'visualizzare fattura', 'ดูใบแจ้งหนี้', 'انوائس کے لئیے', 'चालान देखने', 'considerabit cautionem', 'lihat faktur', '請求書を表示', '송장보기'),
(181, 'payment_history', 'payment history', 'অর্থ প্রদান ইতিহাস', 'historial de pago', 'تاريخ الدفع', 'betaling geschiedenis', 'История платежей', '付款历史', 'ödeme tarihi', 'histórico de pagamento', 'Fizetési előzmények', 'l''historique des paiements', 'ιστορικό πληρωμών', 'Zahlungsverhalten', 'storia di pagamento', 'ประวัติการชำระเงิน', 'ادائیگی کی تاریخ', 'भुगतान इतिहास', 'solucionis history', 'riwayat pembayaran', '支払歴', '결제 내역'),
(182, 'view_admit_history', 'view admit history', 'ইতিহাস মানা দেখতে', 'ver admitir historia', 'عرض أعترف التاريخ', 'bekijk toegeven geschiedenis', 'просмотреть признать историю', '查看承认历史', 'tarih kabul görmek', 'ver admitir história', 'megtekintéséhez elismerem történelem', 'voir admettre histoire', 'δείτε παραδέχονται ιστορία', 'sehen zugeben Geschichte', 'visualizzare ammettere storia', 'ดูยอมรับประวัติศาสตร์', 'تاریخ تسلیم دیکھنے کے', 'इतिहास मानता देखने', 'considerabit historiae fatentur', 'lihat mengakui sejarah', '認める履歴を表示', '역사를 인정보기'),
(183, 'view_operation_history', 'view operation history', 'অপারেশন ইতিহাস দেখতে', 'ver el historial de operación', 'عرض تاريخ العملية', 'bekijk bedieningsgeschiedenis', 'просмотр истории операций', '查看操作历史记录', 'işlem geçmişini görüntüleyebilirsiniz', 'visualizar o histórico de operação', 'megtekinteni működés történelem', 'voir l''historique des opérations', 'δείτε το ιστορικό λειτουργίας', 'Betrieb anzuzeigen Geschichte', 'visualizzare la cronologia delle operazioni', 'ดูประวัติการทำงาน', 'آپریشن کی تاریخ دیکھیں', 'ऑपरेशन के इतिहास को देखने', 'considerabit operationis historiam,', 'melihat riwayat operasi', '操作履歴を表示する', '작업 기록을 보려면'),
(184, 'invoice_list', 'invoice list', 'চালান তালিকা', 'lista de facturas', 'قائمة الفاتورة', 'factuurlijst', 'счет-фактура список', '发票清单', 'fatura listesi', 'lista fatura', 'számla lista', 'liste des factures', 'τιμολογίου λίστα', 'Rechnung Liste', 'Lista fattura', 'รายการใบแจ้งหนี้', 'انوائس کی فہرست', 'चालान सूची', 'cautionem album', 'daftar faktur', '送り状リスト', '송장 목록'),
(185, 'creation_timestamp', 'creation timestamp', 'সৃষ্টি টাইমস্ট্যাম্প', 'fecha y hora de creación', 'الطابع الزمني خلق', 'creatie timestamp', 'Создание метки', '创建时间戳', 'oluşturma zaman damgası', 'timestamp criação', 'létrehozása timestamp', 'horodatage de création', 'timestamp δημιουργία', 'Schaffung Zeitstempel', 'creazione timestamp', 'เวลาสร้าง', 'تخلیق ٹائمسٹیمپ', 'निर्माण टाइमस्टैम्प', 'timestamp creatio', 'penciptaan timestamp', '作成タイムスタンプ', '생성 타임 스탬프'),
(186, 'nurse_dashboard', 'nurse dashboard', 'নার্স ড্যাশবোর্ড', 'dashboard enfermera', 'لوحة أجهزة القياس ممرضة', 'verpleegkundige dashboard', 'Медсестра приборной панели', '护士的仪表板', 'hemşire paneli', 'dashboard enfermeira', 'ápoló műszerfal', 'infirmière tableau de bord', 'ταμπλό νοσοκόμα', 'Krankenschwester Armaturenbrett', 'cruscotto infermiera', 'แผงควบคุมพยาบาล', 'نرس ڈیش بورڈ', 'नर्स डैशबोर्ड', 'nutrix Dashboard', 'dashboard perawat', '看護師のダッシュボード', '간호사 대시 보드'),
(187, 'bed_ward', 'bed ward', 'বিছানা ওয়ার্ড', 'sala de cama', 'جناح السرير', 'bed ward', 'кровать палате', '床病房', 'yatak koğuş', 'cama de enfermaria', 'ágy osztályon', 'salle de lit', 'Ward κρεβάτι', 'Bettenhaus', 'Ward letto', 'หอผู้ป่วยเตียง', 'بستر وارڈ', 'बिस्तर वार्ड', 'stratum pupillo', 'tidur bangsal', 'ベッド病棟', '침대 구'),
(188, 'manage_bed', 'manage bed', 'বিছানা পরিচালনা', 'gestión de la cama', 'إدارة السرير', 'beheren bed', 'управлять кроватью', '管理床', 'yatak yönetmek', 'gerenciar cama', 'kezelni ágy', 'gérer lit', 'διαχείριση κρεβάτι', 'verwalten Bett', 'gestire letto', 'บริหารจัดการเตียง', 'بستر کا انتظام', 'बिस्तर का प्रबंधन', 'stratum curo', 'mengelola tidur', 'ベッドを管理', '침대 관리'),
(189, 'manage_blood_bank', 'manage blood bank', 'ব্লাড ব্যাঙ্ক পরিচালনা', 'gestión de bancos de sangre', 'إدارة بنك الدم', 'beheren bloedbank', 'управлять банком крови', '管理血库', 'kan bankası yönetmek', 'gerenciar banco de sangue', 'kezelni vér bank', 'gérer la banque de sang', 'διαχείριση τράπεζα αίματος', 'verwalten Blutbank', 'gestire banca del sangue', 'จัดการธนาคารเลือด', 'بلڈ بینک کا انتظام', 'ब्लड बैंक का प्रबंधन', 'curo sanguine ripam Iordanis', 'mengelola bank darah', '血液銀行の管理', '혈액 은행 관리'),
(190, 'manage_blood_donor', 'manage blood donor', 'রক্ত দাতা পরিচালনা', 'gestión de donantes de sangre', 'إدارة للمتبرعين بالدم', 'beheren bloeddonor', 'управлять донорской крови', '管理献血', 'kan donör yönetmek', 'gerenciar doador de sangue', 'kezelni véradó', 'gérer les donneurs de sang', 'διαχείριση αιμοδότης', 'verwalten Blutspender', 'gestire donatore di sangue', 'จัดการผู้บริจาคโลหิต', 'بلڈ ڈونر کا انتظام', 'रक्त दाता प्रबंधन', 'curo sanguine donator', 'mengelola donor darah', '供血者を管理する', '혈액 기증자 관리'),
(191, 'add_bed', 'add bed', 'বিছানা যোগ করুন', 'añadir cama', 'إضافة السرير', 'add bed', 'добавить кровать', '加床', 'yatak', 'adicionar cama', 'hozzá ágy', 'ajouter un lit', 'προσθήκη κρεβατιού', 'hinzufügen Bett', 'aggiungere letto', 'เพิ่มเตียง', 'بستر میں شامل کریں', 'बिस्तर जोड़', 'adde cubile', 'tambahkan tidur', 'ベッドを追加', '침대를 추가'),
(192, 'ward', 'ward', 'ওয়ার্ড', 'sala', 'جناح', 'afdeling', 'палата', '病房', 'koğuş', 'enfermaria', 'kórterem', 'Ward', 'πτέρυγα', 'Ward', 'Ward', 'ท้องที่', 'وارڈ', 'परवरिश', 'pupillus', 'bangsal', '病棟', '구'),
(193, 'cabin', 'cabin', 'কেবিন', 'cabina', 'قمرة', 'cabine', 'кабина', '机舱', 'kabin', 'cabine', 'kabin', 'cabine', 'καμπίνα', 'Kabine', 'cabina', 'กระต๊อบ', 'کیبن', 'केबिन', 'Cameram', 'kabin', 'キャビン', '선실'),
(194, 'icu', 'icu', 'ICU', 'icu', 'وحدة العناية المركزة', 'icu', 'ICU', 'ICU', 'icu', 'UTI', 'ICU', 'ICU', 'ΜΕΘ', 'ICU', 'icu', 'ไอซียู', 'آایسییو', 'आईसीयू', 'ICU', 'icu', 'ICU', 'ICU'),
(195, 'edit_bed', 'edit bed', 'বিছানা সম্পাদনা', 'editar cama', 'تعديل سرير', 'bewerk bed', 'редактировать кровать', '编辑床', 'yatak düzenleme', 'editar cama', 'szerkesztés ágy', 'modifier lit', 'επεξεργαστείτε κρεβάτι', 'bearbeiten Bett', 'modificare letto', 'แก้ไขเตียง', 'بستر میں ترمیم کریں', 'बिस्तर संपादित', 'Duis lectus', 'mengedit tidur', 'ベッドを編集', '침대를 편집');
INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `bengali`, `spanish`, `arabic`, `dutch`, `russian`, `chinese`, `turkish`, `portuguese`, `hungarian`, `french`, `greek`, `german`, `italian`, `thai`, `urdu`, `hindi`, `latin`, `indonesian`, `japanese`, `korean`) VALUES
(196, 'edit_bed_allotment', 'edit bed allotment', 'বিছানা অ্যালটমেন্ট সম্পাদনা', 'editar adjudicación cama', 'تعديل المخصصات السرير', 'bewerk bed toewijzing', 'редактировать кровать выделение', '编辑床配发', 'yatak tahsis düzenleme', 'editar cama loteamento', 'szerkesztés ágy elosztás', 'modifier l''attribution de lit', 'επεξεργαστείτε κατανομής κρεβάτι', 'bearbeiten Bett Zuteilung', 'modificare letto riparto', 'แก้ไขการจัดสรรเตียง', 'بستر الاٹمنٹ میں ترمیم کریں', 'बिस्तर आवंटन संपादित', 'Duis lectus sorti', 'mengedit tidur penjatahan', 'ベッド割当てを編集', '침대 할당을 편집합니다'),
(197, 'blood_bank_list', 'blood bank list', 'ব্লাড ব্যাঙ্ক তালিকা', 'lista de bancos de sangre', 'قائمة بنك الدم', 'bloedbank lijst', 'Список банков крови', '血库列表', 'kan bankası listesi', 'Lista de banco de sangue', 'vér bank lista', 'liste de banques de sang', 'αίμα λίστα τράπεζας', 'Blutbank Liste', 'elenco banca del sangue', 'รายการธนาคารเลือด', 'بلڈ بینک کی فہرست', 'ब्लड बैंक की सूची', 'sanguinem ripam album', 'Daftar bank darah', '血液銀行のリスト', '혈액 은행 목록'),
(198, 'edit_blood_bank', 'edit blood bank', 'ব্লাড ব্যাঙ্ক সম্পাদনা', 'editar banco de sangre', 'تعديل بنك الدم', 'bewerk bloedbank', 'редактировать банка крови', '编辑血库', 'kan bankası düzenleme', 'editar banco de sangue', 'szerkesztés vér bank', 'modifier banque de sang', 'επεξεργαστείτε τράπεζα αίματος', 'bearbeiten Blutbank', 'modificare banca del sangue', 'แก้ไขธนาคารเลือด', 'بلڈ بینک میں ترمیم کریں', 'ब्लड बैंक को संपादित', 'sanguinem ripam creare', 'mengedit bank darah', '血液バンクを編集', '혈액 은행을 편집합니다'),
(199, 'add_blood_donor', 'add blood donor', 'রক্ত দাতা যোগ করুন', 'añadir donante de sangre', 'إضافة للمتبرعين بالدم', 'voegen bloeddonor', 'добавить донорской крови', '增加献血者', 'kan donör ekleyin', 'adicionar doador de sangue', 'hozzá véradó', 'ajouter donneurs de sang', 'προσθήκη αιμοδότης', 'hinzufügen Blutspender', 'aggiungere donatore di sangue', 'เพิ่มผู้บริจาคโลหิต', 'بلڈ ڈونر شامل', 'रक्त दाता जोड़', 'Addunt sanguinem donator', 'tambahkan donor darah', '献血を追加', '혈액 기증자 추가'),
(200, 'edit_blood_donor', 'edit blood donor', 'রক্ত দাতা সম্পাদনা', 'editar donante de sangre', 'تعديل للمتبرعين بالدم', 'bewerk bloeddonor', 'редактировать донорской крови', '编辑献血', 'kan donör düzenleme', 'editar doador de sangue', 'szerkesztés véradó', 'modifier les donneurs de sang', 'επεξεργαστείτε αιμοδότης', 'bearbeiten Blutspender', 'modificare donatore di sangue', 'แก้ไขผู้บริจาคโลหิต', 'بلڈ ڈونر ترمیم کریں', 'रक्त दाता संपादित', 'recensere sanguinem donator', 'mengedit donor darah', '献血を編集', '혈액 기증자를 편집'),
(201, 'pharmacist_dashboard', 'pharmacist dashboard', 'ফার্মাসিস্ট ড্যাশবোর্ড', 'tablero farmacéutico', 'لوحة أجهزة القياس الصيدلي', 'apotheker dashboard', 'Фармацевт приборной панели', '药剂师仪表', 'eczacı paneli', 'dashboard farmacêutico', 'gyógyszerész műszerfal', 'tableau de bord du pharmacien', 'ταμπλό του φαρμακοποιού', 'Apotheker Armaturenbrett', 'cruscotto farmacista', 'แผงควบคุมเภสัชกร', 'فارماسسٹ ڈیش بورڈ', 'फार्मासिस्ट डैशबोर्ड', 'pharmacist Dashboard', 'dashboard apoteker', '薬剤師のダッシュボード', '약사 대시 보드'),
(202, 'medicine_category', 'medicine category', 'ঔষধ বিষয়শ্রেণীতে', 'Categoría Medicina', 'الطب فئة', 'geneeskunde categorie', 'медицина категории', '医药类', 'tıp kategori', 'medicina categoria', 'gyógyszer kategória', 'médecine catégorie', 'ιατρικής κατηγορία', 'Medizin Kategorie', 'categoria medicina', 'หมวดหมู่การแพทย์', 'دوا قسم', 'दवा वर्ग', 'medicine praedicamentum', 'kategori obat', '薬カテゴリ', '의학 카테고리'),
(203, 'manage_medicine', 'manage medicine', 'ঔষধ পরিচালনা', 'administrar medicamentos', 'إدارة الطب', 'beheren geneeskunde', 'управлять медициной', '医药管理', 'tıp yönetmek', 'gerenciar medicina', 'kezelésére gyógyszert', 'gérer médecine', 'διαχείριση ιατρικής', 'verwalten Medizin', 'gestire medicina', 'บริหารจัดการยา', 'ادویات کا انتظام', 'दवा का प्रबंधन', 'medicine curo', 'mengelola obat', '薬を管理', '약을 관리'),
(204, 'provide_medication', 'provide medication', 'ঔষধ প্রদান', 'proporcionar la medicación', 'توفير الدواء', 'bieden medicatie', 'обеспечить лекарства', '提供用药', 'ilaç sağlamak', 'fornecer medicamentos', 'biztosít gyógyszert', 'fournir des médicaments', 'παρέχουν φάρμακα', 'bieten Medikamente', 'fornire farmaci', 'ให้การรักษาด้วยยา', 'ادویات فراہم', 'दवा प्रदान', 'medicamento parentur', 'menyediakan pengobatan', '薬を提供する', '약물을 제공'),
(205, 'manage_medicine_category', 'manage medicine category', 'ঔষধ বিষয়শ্রেণীতে পরিচালনা', 'gestionar Categoría Medicina', 'إدارة فئة الطب', 'beheren categorie geneeskunde', 'управлять медициной категории', '医药管理类别', 'tıp kategori yönetmek', 'gerenciar categoria medicina', 'kezelni gyógyszer kategória', 'gérer catégorie de médicaments', 'διαχείριση κατηγορία φαρμάκων', 'verwalten Medizin Kategorie', 'gestire categoria medicina', 'จัดการหมวดหมู่การแพทย์', 'دوا زمرے کا انتظام', 'दवा वर्ग का प्रबंधन', 'aget medicina praedicamentum', 'mengelola kategori obat', '薬カテゴリの管理', '의학 카테고리 관리'),
(206, 'medicine_category_list', 'medicine category list', 'ঔষধ বিষয়শ্রেণীতে তালিকা', 'lista de categorías de la medicina', 'قائمة فئة الطب', 'geneeskunde lijst met categorieën', 'Список категорий медицине', '药品分类列表', 'tıp kategori listesi', 'lista de categorias de medicina', 'gyógyszer kategórialista', 'liste des catégories médecine', 'ιατρική λίστα κατηγοριών', 'Medizin Kategorie Liste', 'medicina lista delle categorie', 'รายการประเภทยา', 'طب زمرہ فہرست', 'दवा वर्ग की सूची', 'medicine genus album', 'Obat daftar kategori', '薬カテゴリリスト', '의학 범주 목록'),
(207, 'add_medicine_category', 'add medicine category', 'ঔষধ বিভাগ যোগ করুন', 'añadir Categoría Medicina', 'إضافة فئة الطب', 'add categorie geneeskunde', 'добавить медицину категории', '加药类别', 'tıp kategori eklemek', 'Adicione uma categoria medicina', 'hozzá gyógyszer kategória', 'ajouter la catégorie de la médecine', 'Προσθήκη κατηγορίας ιατρικής', 'Kategorie hinzufügen Medizin', 'aggiungere categoria medicina', 'เพิ่มประเภทยา', 'طب زمرہ شامل', 'दवा श्रेणी जोड़ने', 'adde medicina praedicamentum', 'menambahkan kategori obat', '薬カテゴリを追加', '의학 카테고리를 추가'),
(208, 'medicine_category_name', 'medicine category name', 'ঔষধ বিষয়শ্রেণীতে নাম', 'medicina nombre de la categoría', 'الطب اسم التصنيف', 'geneeskunde categorie naam', 'медицине название категории', '医药类名称', 'tıp kategori adı', 'medicina nome da categoria', 'orvostudomány kategória nevét', 'médecine nom de la catégorie', 'ιατρικής όνομα κατηγορίας', 'Medizin Kategorie Name', 'medicina di nome categoria', 'ชื่อหมวดหมู่ยา', 'دوا قسم کا نام', 'दवा श्रेणी का नाम', 'medicine nomine praedicamentum', 'Obat nama kategori', '薬カテゴリ名', '의학 카테고리의 이름'),
(209, 'medicine_category_description', 'medicine category description', 'ঔষধ বিষয়শ্রেণীতে বর্ণনা', 'medicina descripción de la categoría', 'الطب التصنيف الوصف', 'geneeskunde categorie omschrijving', 'медицина описание категории', '医药类说明', 'tıp kategori açıklaması', 'medicina descrição da categoria', 'gyógyszer kategória leírás', 'médecine description de catégorie', 'ιατρική περιγραφή της κατηγορίας', 'Medizin Beschreibung der Kategorie', 'medicina descrizione categoria', 'คำอธิบายหมวดหมู่ยา', 'دوا قسم وضاحت', 'दवा वर्ग विवरण', 'medicine genus praedicamenti', 'kategori obat deskripsi', '薬カテゴリの説明', '의학 카테고리 설명'),
(210, 'medicine_list', 'medicine list', 'ঔষধ তালিকা', 'lista de medicamentos', 'قائمة الأدوية', 'geneeskunde lijst', 'список лекарств', '药物目录', 'ilaç listesi', 'lista de medicamentos', 'gyógyszer lista', 'médecine liste', 'Λίστα φαρμάκων', 'Medizin Liste', 'medicina elenco', 'รายการยา', 'دوا کی فہرست', 'दवा सूची', 'medicine album', 'Daftar Obat', '薬リスト', '의학 목록'),
(211, 'add_medicine', 'add medicine', 'ঔষধ যোগ করুন', 'añadir la medicina', 'إضافة الدواء', 'voegen geneeskunde', 'добавить медицине', '加药', 'tıp ekleyin', 'adicionar medicina', 'hozzá gyógyszer', 'ajouter médecine', 'προσθέστε το φάρμακο', 'hinzufügen Medizin', 'aggiungere medicina', 'เพิ่มยา', 'ادویات شامل', 'दवा जोड़ना', 'adde medicamentum', 'tambahkan obat', '薬を追加', '약을 추가'),
(212, 'medicine_name', 'medicine name', 'ঔষধ নাম', 'Nombre del medicamento', 'اسم الدواء', 'Naam van de geneeskunde', 'названия лекарства', '药名', 'tıp adı', 'nome do medicamento', 'orvostudomány név', 'nom du médicament', 'Όνομα ιατρικής', 'Medizin Namen', 'Nome del medicinale', 'ชื่อยา', 'دوا کا نام', 'दवा का नाम', 'medicine nomine', 'Nama obat', '薬名', '약 이름'),
(213, 'medicine_catogory', 'medicine catogory', 'ঔষধ শ্রেণী', 'medicina catogory', 'الطب catogory', 'geneeskunde catogory', 'медицины catogory', '医药catogory', 'tıp Kategorideki', 'medicina catogory', 'gyógyszer catogory', 'médecine catogory', 'ιατρικής catogory', 'Medizin catogory', 'medicina catogory', 'catogory ยา', 'دوا catogory', 'दवा catogory', 'medicine catogory', 'Obat catogory', '医学catogory', '의학 catogory'),
(214, 'edit_medicine_category', 'edit medicine category', 'সম্পাদনা ঔষধ বিষয়শ্রেণীতে', 'edit Categoría Medicina', 'تحرير فئة الطب', 'bewerk geneeskunde categorie', 'Редактировать категорию медицине', '编辑医药类', 'düzenleme tıp kategori', 'edição medicina categoria', 'szerkesztés orvostudomány kategória', 'edit médecine catégorie', 'edit ιατρική κατηγορία', 'edit Medizin Kategorie', 'medicina Modifica categoria', 'หมวดหมู่ยาแก้ไข', 'ترمیم دوا قسم', 'संपादित दवा वर्ग', 'edit medicina praedicamentum', 'sunting obat kategori', '薬カテゴリを編集', '편집 의학 카테고리'),
(215, 'edit_medicine', 'edit medicine', 'সম্পাদনা ঔষধ', 'edit medicina', 'تحرير الطب', 'geneeskunde bewerken', 'Редактировать медицине', '编辑药', 'düzenleme tıp', 'edição medicina', 'szerkesztés orvostudomány', 'médecine édition', 'edit ιατρικής', 'edit Medizin', 'Modifica medicina', 'ยาแก้ไข', 'ترمیم دوا', 'संपादित दवा', 'edit medicamentum', 'sunting Obat', '編集薬', '편집 의학'),
(216, 'laboratorist_dashboard', 'laboratorist dashboard,eo', 'ল্যাবরেটরিস্ট ড্যাশবোর্ড', 'laboratorista salpicadero', 'laboratorist لوحة أجهزة القياس', 'laboratorist dashboard', 'laboratorist приборной панели', 'laboratorist仪表板', 'laboratorist paneli', 'laboratorista dashboard', 'laboratorist műszerfal', 'laboratorist tableau de bord', 'laboratorist ταμπλό', 'laboratorist Armaturenbrett', 'laboratorist cruscotto', 'แผงควบคุม laboratorist', 'laboratorist ڈیش بورڈ', 'laboratorist डैशबोर्ड', 'laboratorist Dashboard', 'laboratorist dashboard', 'laboratoristダッシュ', 'laboratorist 대시 보드'),
(217, 'add_diagnosis_report', 'add diagnosis report', 'রোগ নির্ণয়ের রিপোর্ট যোগ করুন', 'agregar informe diagnóstico', 'إضافة تقرير التشخيص', 'voegen diagnose rapport', 'добавить диагноза отчет', '诊断报告', 'tanı raporu ekleyin', 'adicionar relatório de diagnóstico', 'hozzá diagnózis jelentés', 'Ajouter un rapport de diagnostic', 'προσθέστε την έκθεση διάγνωση', 'hinzufügen Diagnose Bericht', 'aggiungere rapporto diagnostico', 'เพิ่มรายงานการวินิจฉัย', 'تشخیص کی رپورٹ میں شامل', 'निदान रिपोर्ट जोड़', 'adde fama diagnosis', 'menambahkan laporan diagnosis', '診断レポートを追加', '진단 보고서를 추가'),
(218, 'report_status', 'report status', 'প্রতিবেদনের অবস্থা', 'estado del informe', 'تقرير الحالة', 'verslag-status', 'отчет о состоянии', '报告状态', 'rapor durumu', 'status do relatório', 'jelentés állapotát', 'état du rapport', 'αναφορά της κατάστασης', 'Status der Meldung', 'Status Report', 'รายงานสถานะ', 'رپورٹ کی حیثیت', 'स्थिति रिपोर्ट', 'fama status', 'Status laporan', 'レポートのステータス', '보고서 상태'),
(219, 'add_diagnostic_report', 'add diagnostic report', 'ডায়গনিস্টিক প্রতিবেদন যোগ করুন', 'agregar informe de diagnóstico', 'إضافة تقرير التشخيص', 'voegen diagnostisch rapport', 'добавить диагностический отчет', '新增诊断报告', 'tanılama raporu ekleyin', 'adicionar relatório de diagnóstico', 'hozzá diagnosztikai jelentés', 'Ajouter un rapport de diagnostic', 'προσθέσει διαγνωστική έκθεση', 'hinzufügen Diagnosebericht', 'aggiungere report diagnostico', 'เพิ่มรายงานการวินิจฉัย', 'تشخیصی رپورٹ میں شامل', 'नैदानिक ​​रिपोर्ट जोड़', 'adde fama Diagnostic', 'menambahkan laporan diagnostik', '診断レポートを追加', '진단 보고서를 추가'),
(220, 'image', 'image', 'চিত্র', 'imagen', 'صورة', 'afbeelding', 'изображение', '图像', 'görüntü', 'imagem', 'kép', 'Image', 'image', 'Bild', 'immagine', 'ภาพ', 'تصویر', 'छवि', 'simulacrum', 'gambar', '画像', '영상'),
(221, 'doc', 'doc', 'Doc', 'doctor', 'دوك', 'dokter', 'доктор', 'DOC', 'doktor', 'doutor', 'doktor', 'doc', 'doc', 'doc', 'doc', 'คุณหมอ', 'ڈاکٹر', 'डॉक्टर', 'doc', 'dokter', 'DOC', '의사'),
(222, 'pdf', 'pdf', 'পিডিএফ', 'pdf', 'PDF', 'pdf', 'PDF', 'PDF', 'pdf', 'pdf', 'pdf', 'pdf', 'pdf', 'pdf', 'pdf', 'รูปแบบไฟล์ PDF', 'پی ڈی ایف', 'पीडीएफ', 'pdf', 'pdf', 'PDF', 'PDF'),
(223, 'excel', 'excel', 'এক্সেল', 'sobresalir', 'تفوق', 'uitmunten', 'превосходить', '高强', 'sivrilmek', 'sobressair', 'excel', 'excel', 'excel', 'excel', 'excel', 'เก่งกว่า', 'ایکسل', 'एक्सेल', 'præesse', 'unggul', 'エクセル', '뛰어나다'),
(224, 'upload_document', 'upload document', 'ডকুমেন্ট আপলোড', 'Cargar documento', 'تحميل الوثيقة', 'uploaden van documenten', 'Загрузить документ', '上传文件', 'belge yüklemek', 'upload de documento', 'feltöltés dokumentum', 'télécharger le document', 'ανεβάσετε το έγγραφο', 'Dokument hochladen', 'Carica documento', 'อัปโหลดเอกสาร', 'دستاویز اپ لوڈ کریں', 'दस्तावेज़ अपलोड', 'upload document', 'meng-upload dokumen', 'ドキュメントをアップロード', '문서를 업로드'),
(225, 'accountant_dashboard', 'accountant dashboard', 'হিসাবরক্ষক ড্যাশবোর্ড', 'tablero contador', 'لوحة أجهزة القياس محاسب', 'accountant dashboard', 'бухгалтером приборной панели', '会计师仪表', 'muhasebeci paneli', 'dashboard contador', 'könyvelő műszerfal', 'tableau de bord comptable', 'ταμπλό λογιστή', 'Buchhalter Armaturenbrett', 'cruscotto contabile', 'แผงควบคุมบัญชี', 'اکاؤنٹنٹ ڈیش بورڈ', 'लेखाकार डैशबोर्ड', 'Ratiocinatore Dashboard', 'dashboard akuntan', '会計士のダッシュボード', '회계사 대시 보드'),
(226, 'invoice / take_payment', 'invoice / take payment', 'চালান / পেমেন্ট নিতে', 'factura / recibir el pago', 'فاتورة / أخذ الأجرة', 'factuur / rekening betalen', 'счета / принимать оплату', '发票/付款', 'fatura / ödeme almak', 'factura / ter o pagamento', 'számla / veszi fizetés', 'facture / prendre le paiement', 'τιμολόγιο / λαμβάνουν πληρωμές', 'Rechnung / Zahlung nehmen', 'fattura / prendere il pagamento', 'ใบแจ้งหนี้ / ใช้การชำระเงิน', 'انوائس / ادائیگی لینا', 'चालान / भुगतान लेना', 'cautionem / accipe mercedes', 'faktur / mengambil pembayaran', '請求/支払いを取る', '송장 / 지불을'),
(227, 'manage_invoice', 'manage invoice', 'চালান পরিচালনা', 'gestionar factura', 'إدارة الفاتورة', 'beheren factuur', 'управлять счета', '发票管理', 'fatura yönetmek', 'gerenciar fatura', 'kezelni számla', 'gérer facture', 'διαχείριση τιμολόγιο', 'Verwaltung Rechnung', 'gestione fattura', 'การจัดการใบแจ้งหนี้', 'انوائس کے انتظام', 'चालान का प्रबंधन', 'aget cautionem', 'mengelola faktur', '請求書を管理する', '송장 관리'),
(228, 'add_invoice', 'add invoice', 'চালান যোগ করুন', 'añadir factura', 'إضافة فاتورة', 'voegen factuur', 'добавить счет-фактура', '加发票', 'fatura ekleyin', 'adicionar fatura', 'hozzá számla', 'ajouter facture', 'προσθήκη τιμολόγιο', 'Rechnung hinzufügen', 'aggiungere fattura', 'เพิ่มใบแจ้งหนี้', 'انوائس میں شامل کریں', 'चालान जोड़', 'add cautionem', 'tambahkan faktur', '請求書を追加', '송장을 추가'),
(229, 'unpaid', 'unpaid', 'অবৈতনিক', 'no pagado', 'غير مدفوع', 'onbetaald', 'неоплаченный', '未付', 'ödenmemiş', 'não remunerado', 'kifizetetlen', 'non rémunéré', 'απλήρωτη', 'unbezahlte', 'non pagato', 'ไม่ได้ค่าจ้าง', 'بلا معاوضہ', 'अवैतनिक', 'est constitutus,', 'belum dibayar', '未払い', '무급'),
(230, 'take_cash_payment', 'take cash payment', 'নগদ টাকা নিতে', 'tomar el pago en efectivo', 'أخذ الأجرة النقدية', 'neem contante betaling', 'принимать оплату наличными', '以现金支付', 'nakit ödeme almak', 'tomar pagamento em dinheiro', 'hogy készpénzes fizetés', 'prendre le paiement en espèces', 'λαμβάνουν καταβολή μετρητών', 'nehmen Barzahlung', 'prendere il pagamento in contanti', 'ใช้เงินสด', 'نقد ادائیگی لینا', 'नकद भुगतान लेना', 'accipere nummis solutio', 'mengambil pembayaran tunai', '現金支払いを取る', '현금 지불을'),
(231, 'paid', 'paid', 'পরিশোধ', 'pagado', 'مدفوع', 'betaald', 'оплачиваемый', '支付', 'ücretli', 'pago', 'fizetett', 'payé', 'καταβληθεί', 'bezahlt', 'pagato', 'ต้องจ่าย', 'ادا کی', 'प्रदत्त', 'solutis', 'dibayar', '支払われた', '지급'),
(232, 'edit_invoice', 'edit invoice', 'চালান সম্পাদনা', 'editar factura', 'تحرير الفاتورة', 'bewerk factuur', 'редактирования счета', '编辑发票', 'fatura düzenlemek', 'editar fatura', 'szerkesztés számla', 'éditer facture', 'επεξεργαστείτε τιμολόγιο', 'Rechnung bearbeiten', 'modificare fattura', 'แก้ไขใบแจ้งหนี้', 'انوائس میں ترمیم کریں', 'चालान संपादित', 'recensere cautionem', 'mengedit faktur', '請求書を編集', '송장을 편집합니다'),
(233, 'edit_nurse', '', 'নার্স সম্পাদনা', '', 'تعديل ممرضة', 'bewerk verpleegkundige', 'редактировать медсестры', '编辑护士', 'hemşire düzenleme', 'editar enfermeira', 'szerkesztés nővér', 'modifier infirmière', 'επεξεργαστείτε νοσοκόμα', 'bearbeiten Krankenschwester', 'modificare infermiera', 'แก้ไขพยาบาล', 'نرس ترمیم کریں', 'नर्स को संपादित', 'recensere nutricem', 'mengedit perawat', '看護師を編集', '간호사 편집');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `location` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `medicine_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manufacturing_company` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `name`, `medicine_category_id`, `description`, `price`, `manufacturing_company`, `status`) VALUES
(1, 'Aber C 500', 2, 'Vitamin C 500gm', '25', 'Company Cipla', '50');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE IF NOT EXISTS `medicine_category` (
  `medicine_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`medicine_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `medicine_category`
--

INSERT INTO `medicine_category` (`medicine_category_id`, `name`, `description`) VALUES
(1, 'Allergy Liquids', 'Allergic medicines'),
(2, 'Vitamins Tablets', 'Vitamins tablets only');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_from_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_from_id` int(11) NOT NULL,
  `user_to_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

CREATE TABLE IF NOT EXISTS `noticeboard` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `noticeboard`
--

INSERT INTO `noticeboard` (`notice_id`, `notice_title`, `notice`, `create_timestamp`) VALUES
(1, 'Upcoming Personality Awards', '23 Jul is improvements award for board of directors', 1500760800),
(2, 'Upcoming outstanding staff award', '17 Jul is outstanding staff award for services', 1500242400);

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE IF NOT EXISTS `nurse` (
  `nurse_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nurse_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurse_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Priscilla Alaye', 'palaye@hms.com', 'nurse13305', 'Abuja, Nigeria', '+234800000000');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `account_opening_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `name`, `email`, `password`, `address`, `phone`, `sex`, `birth_date`, `age`, `blood_group`, `account_opening_timestamp`) VALUES
(1, 'Moses Ogbabe', 'mogbebe@hms.com', 'patient13309', 'Abuja, Nigeria', '+23480000000', 'male', '03/04/1981', 34, 'B+', 1448984171);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_type`, `transaction_id`, `invoice_id`, `patient_id`, `method`, `description`, `amount`, `timestamp`) VALUES
(1, 'Fracture', '573319', 2, 2, 'cash', 'Fracture bandage.', 1200, 1448985709);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE IF NOT EXISTS `pharmacist` (
  `pharmacist_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pharmacist_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Grace Achubu', 'gachubu@hms.com', 'pharmacist13313', 'Abuja, Nigeria', '+234800000000');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
  `prescription_id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `case_history` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medication` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medication_from_pharmacist` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`prescription_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `creation_timestamp`, `doctor_id`, `patient_id`, `case_history`, `medication`, `medication_from_pharmacist`, `description`) VALUES
(1, 1448984647, 1, 1, 'Case history details here of patient Michael Umero<br>', 'Medication details here of patient Michael Umero<br>', 'Medication from pharmacist details here of patient Michael Umero<br>', 'Additional description here of patient Michael Umero<br>'),
(2, 1452125702, 1, 1, 'Case history of patient here<br>', 'Medication for patient here<br>', 'medication from pharmacists here<br>', 'Description and notes here');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'operation,birth,death',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'Hospital Management System'),
(7, 'system_email', 'john.sokpo@hotmail.com'),
(2, 'system_title', 'Hospital Management System'),
(3, 'address', 'Abuja, Nigeria'),
(4, 'phone', '+2348138856235'),
(5, 'paypal_email', 'paypal@paypal.com'),
(6, 'currency', 'NGR');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
