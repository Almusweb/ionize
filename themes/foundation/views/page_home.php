<ion:partial view="common/header" />

<ion:page>
    <ion:articles>
        <ion:article>
            <article id="content_<ion:id />">
                <ion:title tag="h3" />
                <ion:content />
            </article>
        </ion:article>
    </ion:articles>

</ion:page>

<pre><?php print_r($this); ?></pre>

<ion:partial view="common/footer" />