<h2><?=lang('title_system_check') ?></h2>

<!-- PHP Version -->
<ul class="check">
	<li class="<?php if($php_version) :?>ok<?php else :?>fail<?php endif ;?>"><?php echo lang('php_version')?> (<b><?php echo phpversion() ?></b>)</li>
	<li class="<?php if($mysql_support) :?>ok<?php else :?>fail<?php endif ;?>"><?php echo lang('mysql_support')?> </li>
	<li class="<?php if($safe_mode) :?>ok<?php else :?>fail<?php endif ;?>"> <?php echo lang('safe_mode_off')?> </li>
	<li class="<?php if($file_uploads) :?>ok<?php else :?>fail<?php endif ;?>"><?php echo lang('file_uploads')?></li>
	<li class="<?php if($gd_lib) :?>ok<?php else :?>fail<?php endif ;?>"><?php echo lang('gd_lib')?></li>
</ul>

<h2><?php echo lang('title_folder_check') ?></h2>

<ul class="check">
	<?php foreach($check_folders as $folder => $result) :?>
		<li class="<?php if($result) :?>ok<?php else :?>fail<?php endif ;?>"> <span class="div">/</span> <?php echo str_replace('/',' / ',$folder) ?> <span class="div">/</span> </li>
	<?php endforeach ;?>
</ul>

<h2><?php echo lang('title_files_check') ?></h2>

<ul class="check">
	<?php foreach($check_files as $file => $result) :?>
		<li class="<?php if($result) :?>ok<?php else :?>fail<?php endif ;?>"> <span class="div">/</span> <?php echo str_replace('/',' <span class="div">/</span> ',$file) ?></li>
	<?php endforeach ;?>
</ul>

<?php if($next_step): ?> <?=anchor('setup/database', lang('next_step'), 'class="next_step"')?> <?php endif; ?>
