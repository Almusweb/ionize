<?php echo Ionize::partial()->view('common/header'); ?>

<?php foreach($contents as $content): ?>
<article id="content_<?php echo $content->id; ?>">
    <h3><?php echo $content->title; ?></h3>
    <?php echo $content->content; ?>
</article>
<?php endforeach; ?>

<pre><?php print_r($this); ?></pre>

<?php echo Ionize::partial()->view('common/footer'); ?>