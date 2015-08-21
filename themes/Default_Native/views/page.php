<?php echo Ionize::Partial()->View('common/html_header'); ?>
<?php echo Ionize::Partial()->View('common/site_header'); ?>

<div id="content_container">
	<div id="content">
	
		<?=Ionize::tag($content->subtitle, 'h2');?>
		<?=$content->content?>
		
		<?php foreach($content->items as $article): ?>
		
		<article>
			<header>
				<h3><?=$article->title?></h3>
			<header>
			
			<section class="content">
				<?=$article->content?>
			</section>
			
			<footer>
				<a class="button tiny" href="<?=$article->url?>"> <?=lang('read_more')?> </a>
			</footer>
		</article>
		
		<?php endforeach; ?>
		
	</div>
</div>

<?php echo Ionize::Partial()->View('common/site_footer'); ?>
<?php echo Ionize::Partial()->View('common/html_footer'); ?>
