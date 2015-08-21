<?php echo Ionize::Partial()->View('common/html_header'); ?>
<?php echo Ionize::Partial()->View('common/site_header'); ?>

<div id="content_container">
	<div id="content">
		<h2><?=$content->subtitle?></h2>
		<?=$content->content?>
	</div>
</div>

<?php echo Ionize::Partial()->View('common/site_footer'); ?>
<?php echo Ionize::Partial()->View('common/html_footer'); ?>
