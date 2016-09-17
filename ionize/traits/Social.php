<?php
namespace Traits;

require_once "social/Facebook.php";
require_once "social/Google.php";
require_once "social/Twitter.php";

trait Social
{
    use Traits\Social\Facebook;
    use Traits\Social\Google;
    use Traits\Social\Twitter;

    public function share( $content, $social )
    {

    }

    public function like( $content, $social )
    {

    }

    public function login( $social )
    {
        
    }
}