<?php

interface DataModel
{
    public function is( $type );
    public static function get_instance();
}
