<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTf-8" />
	<title> <?=lang('setup_title')?> </title>
	
	<link rel="stylesheet" href="<?=site_url('ionize/assets/font-awesome.css')?>" />
	<link rel="stylesheet" href="<?=site_url('ionize/assets/setup.css')?>" />
	
</head>
<body>

	<section id="installer_wizard">
		<header id="installer_header">
			<img src="<?=site_url('ionize/assets/images/ionize_logo_install.png')?>" alt="Ionize" />
		</header>
		
		<nav id="installer_navigation">
			<?=anchor('setup/checkconfig', 		lang('check_config'), 	$checkconfig_cls)?>
			<?=anchor('setup/database', 		lang('database'), 		$database_cls)?>
			<?=anchor('setup/migration', 		lang('migration'), 		$migration_cls)?>
			<?=anchor('setup/user', 			lang('user'), 			$user_cls)?>
			<?=anchor('setup/data', 			lang('sample_data'), 	$data_cls)?>
			<?=anchor('setup/finish', 			lang('finish'), 		$finish_cls)?>
		</nav>
		
		<section id="installer_content">

