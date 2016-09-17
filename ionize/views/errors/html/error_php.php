<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<div style="
	width: 900px;
	border: 1px solid #640000;
	padding: 10px 10px 10px 80px;
	background: #ED3434 url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAFN++nkAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3wkdDwUhup1KTwAABHlJREFUaN7tm09oHFUcxz+77m5ao2mbRptNUDSFaj1ERemhoIi3tidBqhcRpIKChR4EtQeX9FDxJngwFFFBEY1n9ayIhyJWcokEYgoSY6VE0qrtJoHpYX6jw3Pem/dvtxuYLyzszsx7v9/3/fn9e7PgiGeB07qbHflk34cB6rmWKl7NPzCl6zZ74KzugVru+3DWrWCGYNyi/H4TaADL+YsnFe6dvOajBb0O1Q0iHzDdvFBTxjwiVxNqBddOatgBnANWdY07yu8Z0/W6Mvq2OKROXwO4W3noCfmo+FRtvAwsAo8o6n2jdDBjGrB/px94ENgELjBQ0Kl9ADgGjMi8fijqlzbuaDpMgDNFO72o4ayywGtqx/nGr7ssELXxkGXjIzq1nWBqnJQ1bhjuvewieUW5N6sxJ28VNX7fQu0N+WgXyWvAjoLrC8CczfIEuA/YK1t1lQq9MgUqpoGjlltnpWDFOAs+DTQDiH0M/OIieBp4ytDhLHDJwuYBXAfetrEDB0qEumIHcMpG8LEerKVdsj+Ngkd6tJD3llnNVaBd0slLHoKXyxZX0xRRC94F1iwXF8AS8EnZUG+KiTc5GZcttqAKtdnHU8BznnO6kfdHvpYriwIOywo1Delc3odVqFAFAjqj8TiwHxiT3wlwVczsj5JHRRV8Api0eK4LfAXMhwqeEKE1x5FcE3vuJTjEXGY2/6yrYLWkgiZ1B9hncJNa5roU6JVIi3dU4jcrwYc0eYgvjtoKPhx5yw5JAGkUPFTi9nzxcJnge3pkqCbKBO/qkeDbywQ3+mWaVcHXPDpNLI2JkeHvlsI6jspdLmPcq9R/yab+siSuD0uTOUpaRjXhWxsDMufIpiy4Xyma47omEF+INMSJrjqgcxIuQblpVZ/zDQTeAFqxyxDw/3MHFd+Jv73DQeB14B3gjxgxVws4XrLa14HvgfOxo8wMbWAc2AlsicCLEuhVqFChwgAlxyHR/ChpgfRWcd5Z9LEljvof4IokWt3tRLgFPCTpylhAjL4uweEi8BMRi3UxCA+T1tXvjZxgqu59GfgS+PtmEZ4CngkIinyxAXxuCqhiE54Anvcg+p4hALsTi5PbAuIfuaY9runoceB+z4GqRR74FvAi8LNL1lN36PwEcLBPlt1lEA+Kbq1YhLMQfpLBxaTo2IxB+DGL7HwQsJ+0iB5EuL1NyOZJt0MIj0sAsV0wJjp7E95J2HsQ/UZTdPYmvIVdcXJQkIjO3n54nfTkbCTScksK3FoScdtcFZ29CV+USCYG4af7MMO/ic7ehLukZ6LjhJ9O/AD8pZnh24BHA/tfJ31dtRsaWi4Cu4EnsX/hUkf4kubevkDCXdLaZelhtW0sfV5StCM9TAFDUsevsTgYd00e5knPRF5A/6p4v7EGfOCSI/smAlOk/3y4WT56E/jMJycOzXzaYn339CGLSoA/gS+wP3OMTjiPadL3CMYCjZtqjC6LDZmP0WGvZqVJWuO6i/+KecMS9jVycrPI6Jrsw6x49ytpDWuTChUqVMjhBiA3yXzaD8JtAAAAAElFTkSuQmCC')
	no-repeat 10px 10px;
	text-shadow: 0 0 5px #C00000;
	margin:5px auto;
	color: #000;
	font-family: Verdana, Arial, sans-serif;
	min-height: 60px;">

	<h1 style="margin: 5px 2px; font-size: 20px;">A PHP <?php echo $severity; ?> was encountered</h1>
	<h2 style="margin: 5px 2px; font-size: 14px; font-weight: normal"><?php echo $message; ?></h2>
	
	<p style="font-size: 12px; margin: 20px 2px;"><b>File:</b> <?php echo $filepath; ?>:<?php echo $line; ?></p>

	<?php if (defined('SHOW_DEBUG_BACKTRACE') && SHOW_DEBUG_BACKTRACE === TRUE): ?>
	<h3 style="margin: 2px; font-size: 12px;">Backtrace:</h3>

	<ul style="font-size: 12px;">
	<?php
	foreach (debug_backtrace() as $error):
	if (isset($error['file']) && strpos($error['file'], realpath(BASEPATH)) !== 0):
	//echo '<pre>'.print_r($error, true).'</pre>';
	echo '<li><span style="display: inline-block; width: 350px">'.@$errYor['class'].@$error['type'].$error['function'].'():</span> '.$error['file'].':'.$error['line'].'</li>';
	endif;
	endforeach;
	?>
	</ul>
	
	<?php endif; ?>

</div>
