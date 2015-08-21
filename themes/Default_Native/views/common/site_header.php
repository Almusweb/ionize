<div id="site_navigation_container">
	<nav id="site_navigation" class="top-bar" data-topbar role="navigation">
		<ul class="title-area">
			<li class="name"> <h1><a href="#"><?=$site_title?></a></h1> </li>
			<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
		</ul>

		<section class="top-bar-section">
			<ul class="right">
			<?php foreach(Ionize::Navigation( $navigations->main )->items() as $page): ?>
				<li class="<?=($page->isActive() ? 'active' : '')?> <?=($page->has_children ? 'has-dropdown' : '')?>">
					<a href="<?=$page->url;?>"> <?=$page->title;?> </a> 
					<?php if($page->has_children): ?>
					<ul class="dropdown">
						<?php foreach($page->items as $article): ?>
						<li class=""> <a href="<?=$article->url;?>"> <?=$article->title;?> </a> </li>
						<?php endforeach; ?>
					</ul>
					<?php endif; ?>
				</li>
			<?php endforeach; ?>
			</ul>
		</section>
	</nav>
</div>

<div id="header_container">
	<header id="site_header">
		<h1><?=$title?></h1>
	</header>
</div>
