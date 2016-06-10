<?php

/**
 * Manifest handler Controller
 */
class Manifest extends IO_Controller
{
    private $manifest = array
    (
        "name"  =>  "Ionize2.0",
        "icons" =>  array(),
        "start_url" =>  "/",
        "display"   =>  "standalone"
    );

    public function get()
    {
        $manifest = json_encode( $this->manifest );

        $this->output->set_content_type('json');
        $this->output->set_output( $manifest );
    }
}