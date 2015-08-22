<div id="site_navigation_container">
	<nav id="site_navigation" class="top-bar" data-topbar role="navigation">
		<ul class="title-area">
			<li class="name"> <h1><a href="#"><?=$site_title?></a></h1> </li>
			<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
		</ul>

		<section class="top-bar-section">
		
			<ul id="site_languages" class="right">
			<?php foreach(Ionize::Language( $languages )->items() as $lang): ?>
				<li class="<?=($lang->isActive() ? 'active' : '')?>">
					<a href="<?=$lang->url?>"> <?=strtoupper($lang->code)?> </a>
				</li>
			<?php endforeach; ?>
			</ul>
		
			<ul class="right navigation">
			<?php foreach(Ionize::Navigation( $navigations->main )->items() as $nav): ?>
				<li class="<?=($nav->item->isActive() ? 'active' : '')?> <?=($nav->hasItems() ? 'has-dropdown' : '')?>">
					<a href="<?=$nav->item->url;?>"> <?=$nav->item->title;?> </a> 
					<?php if($nav->hasItems()): ?>
					<ul class="dropdown">
						<?php foreach($nav->items as $subnav): ?>
						<li class=""> <a href="<?=$subnav->item->url;?>"> <?=$subnav->item->title;?> </a> </li>
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
