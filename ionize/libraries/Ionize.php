<?php

/**
 * Class Ionize
 *
 * @method \Ionize\Partial partial() partial()
 * @method \Ionize\Archive archive() archive()
 * @method \Ionize\Navigation navigation() navigation()
 * @method \Ionize\Article article() article()
 * @method \Ionize\Page page() page()
 * @method \Ionize\Writer writer() writer()
 * @method \Ionize\Media media() media()
 * @method \Ionize\Element element() element()
 * @method \Ionize\Item item() item()
 * @method \Ionize\Pagination pagination() pagination()
 * @method \Ionize\Category category() category()
 * @method \Ionize\User user() user()
 * @method \Ionize\Form form() form()
 */
class Ionize
{
    private static $elapsed_time = 0;
    private static $memory_usage = 0;

    private static $instance = NULL;
    private static $_loaded_ionize_elements = array();

    protected $contents = array();

    /**
     * Ionize constructor
     */
    public function __construct()
    {
        self::$instance = $this;
    }

    /**
     * Static getInstance method
     *
     * @return Ionize|null
     */
    public static function getInstance()
    {
        if( self::$instance instanceof \Ionize\Ionize ) return self::$instance;
        else return new self;
    }

    /**
     * Parse theme view file
     *
     * @param string $view
     * @param array $data
     * @param string $layout
     */
    public function parseNativeView( $view, $data=array(), $layout=NULL )
    {
        ob_start();

        extract($data);

        if(isset($contents)) $this->contents = $contents;

        $acceptedExtensions = array('php','tpl');

        foreach($acceptedExtensions as $i => $ext)
            if( file_exists($view.'.'.$ext) ) { $view = $view.'.'.$ext; break; }

        include( $view );

        $source_code = ob_get_contents();
        ob_end_clean();

        return $source_code;
    }

    /**
     * Parse theme view file
     *
     * @param string $view
     * @param array $data
     * @param string $layout
     */
    public function parseIonizeView( $view, $data=array(), $layout=NULL )
    {

    }

    /**
     * Parse theme view file
     *
     * @param string $view
     * @param array $data
     * @param string $layout
     */
    public function parseTemplateView( $template, $view, $data=array(), $layout=NULL )
    {

    }

    /**
     * Static Magic Method
     *
     * @param string $name
     * @param array $arguments
     * @return mixed
     */
    public static function __callStatic( $name, $arguments=array() )
    {
        if(method_exists(get_class(), $name))
        {
            return call_user_func_array(array(get_class(),$name),$arguments);
        }
        else
        {
            $class_name = ucwords(strtolower($name));

            if( !isset(self::$_loaded_ionize_elements[ $class_name ]) )
            {
                $namespaced_name = "\\Ionize\\{$class_name}";

                require_once("ionize/{$class_name}.php");

                $class = new $namespaced_name( $arguments );
                self::$_loaded_ionize_elements[ $class_name ] = $class;

                return $class;
            }
            else return self::$_loaded_ionize_elements[ $class_name ];
        }
    }
}