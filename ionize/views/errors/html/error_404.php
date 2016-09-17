<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>404 Page Not Found</title>

<link rel="stylesheet" href="<?php echo base_url('assets/html_errors.css'); ?>" />

</head>
<body>
	<div id="container">
		<h1><?php echo $heading; ?></h1>
		<?php echo $message; ?>
		
		<p>Bootstrap file: <?php echo $_SERVER['SCRIPT_NAME']; ?></p>
		
		<?php if (defined('ENVIRONMENT') && ENVIRONMENT === 'development'): ?>
		<div class="backtrace">
			<h3>Router:</h3>
			
			<?php $CI =& get_instance(); ?>
			<p><?php echo ($CI->router->directory != '' ? $CI->router->directory : '' ).$CI->router->class.'/'.$CI->router->method; ?></p>
		
			<h3>Backtrace:</h3>

			<ul>
			<?php
			foreach (debug_backtrace() as $error):
			if (isset($error['file']) && strpos($error['file'], realpath(BASEPATH)) !== 0):
			//echo '<pre>'.print_r($error, true).'</pre>';
			echo '<li><span style="display: inline-block; width: 350px">'.@$errYor['class'].@$error['type'].$error['function'].'():</span> '.$error['file'].':'.$error['line'].'</li>';
			endif;
			endforeach;
			?>
			</ul>
		</div>
		<?php endif; ?>
	</div>
</body>
</html>
