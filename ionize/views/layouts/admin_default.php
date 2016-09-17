<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8" />
	<title> Admin </title>
	
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
	<link rel="stylesheet" href="<?php echo base_url('assets/ionize_dashboard.css'); ?>" />
	<link rel="import" href="<?php echo base_url('components/ion-logo/ion-logo.html'); ?>" />
</head>
<body>
	
</body>
</html>
