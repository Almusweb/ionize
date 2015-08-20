
<div id="site_navigation_container">
	<nav id="site_navigation" class="top-bar" data-topbar role="navigation">
		<ul class="title-area">
			<li class="name"> <h1><a href="#"><?=$site_title?></a></h1> </li>
			<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
		</ul>

		<section class="top-bar-section">
			<ul class="right">
			<?php foreach(Ionize::Navigation( $navigations->main )->items() as $item): ?>
				<li> <a href="<?=$item->url;?>"> <?=$item->title;?> </a> </li>
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
