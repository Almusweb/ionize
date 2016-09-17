<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8" />
	<title> Login </title>
	
	<script>
		window.baseURL = "<?php echo base_url(); ?>";
	
		// Polymer settings
		window.Polymer = {
			dom: 'shadow',
			lazyRegister: true,
			useNativeCSSProperties: true,
			noUrlSettings: true
		};
		
		// Load the Webcomponets Polyfill if it's needed
		(function() {
			if('registerElement' in document
				&& 'import' in document.createElement('link')
				&& 'content' in document.createElement('template')) {
				//console.debug('The browser are compatible with webcomponents!');
			} else {
				var e = document.createElement('script');
				e.src = '<?php echo base_url("components/webcomponentsjs/webcomponents-lite.min.js"); ?>';
				document.head.appendChild(e);
			}
		})();
	</script>
	
	<link rel="import" href="<?php echo base_url('assets/interface.html'); ?>" />
	<link rel="stylesheet" href="<?php echo base_url('assets/ionize_login.css'); ?>" />
	
	<link rel="import" href="<?php echo base_url('components/ion-login/ion-login.html'); ?>" />
	<link rel="import" href="<?php echo base_url('components/ion-logo/ion-logo.html'); ?>" />
</head>
<body>
	<div id="overlay"></div>
	<div id="sidebar">
	
		<div id="login">
			<ion-logo></ion-logo>
			<ion-login api="<?php echo base_url('api/auth') ?>"></ion-login>
		</div>
		
		<span class="elapsed_time"><?php echo _('Generated').':' ?> <span>{elapsed_time}s</span></span>
		<span class="memory_usage"><?php echo _('Memory').':' ?> <span>{memory_usage}</span></span>
	</div>
</body>
</html>
