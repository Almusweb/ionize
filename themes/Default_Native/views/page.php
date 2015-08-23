<?php echo Ionize::Partial()->View('common/html_header'); ?>
<?php echo Ionize::Partial()->View('common/site_header'); ?>

<div id="content_container">
	<div id="content" class="narrow">
	
		<?php foreach(Ionize::Page()->get() as $page): ?>
		
			<?=Ionize::tag($page->subtitle, 'h2');?>
			<?=Ionize::tag($page->content, 'div');?>
			
			<?php foreach(Ionize::Articles( $page )->get() as $articles): ?>
			<?php foreach(Ionize::Article( $articles )->get() as $article): ?>
				
			<article>
				<header>
					<?=Ionize::tag($article->title, 'h3');?>
				<header>
			
				<section class="content">
					<?=$article->preview?>
				</section>
			
				<footer>
					<a class="button tiny" href="<?=$article->url?>"> <?=lang('read_more')?> </a>
				</footer>
			</article>
				
			<?php endforeach; ?>
			<?php endforeach; ?>
		
		<?php endforeach; ?>
		
	</div>
</div>

<?php echo Ionize::Partial()->View('common/site_footer'); ?>
<?php echo Ionize::Partial()->View('common/html_footer'); ?>
