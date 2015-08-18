<?php echo Ionize::Partial()->View('common/html_header'); ?>
<?php echo Ionize::Partial()->View('common/site_header'); ?>

<div id="content_container">
	<div id="content">
		<pre><?php print_r($content); ?></pre>
		<pre><?php print_r(\Model\Data\Settings::get_instance()); ?></pre>
	</div>
</div>

<?php echo Ionize::Partial()->View('common/site_footer'); ?>
<?php echo Ionize::Partial()->View('common/html_footer'); ?>
