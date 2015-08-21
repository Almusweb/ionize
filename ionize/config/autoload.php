<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
| ---------------------------------------------------------------------------------------------------------------------
| AUTO-LOADER
| ---------------------------------------------------------------------------------------------------------------------
| This file specifies which systems should be loaded by default.
|
| In order to keep the framework as light-weight as possible only the
| absolute minimal resources are loaded by default. For example,
| the database is not connected to automatically since no assumption
| is made regarding whether you intend to use it.  This file lets
| you globally define which systems you would like loaded with every
| request.
|
| ---------------------------------------------------------------------------------------------------------------------
| Instructions
| ---------------------------------------------------------------------------------------------------------------------
|
| These are the things you can load automatically:
|
| 1. Packages
| 2. Libraries
| 3. Drivers
| 4. Helper files
| 5. Custom config files
| 6. Language files
| 7. Models
|
*/

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Drivers
| ---------------------------------------------------------------------------------------------------------------------
| These classes are located in system/libraries/ or in your
| application/libraries/ directory, but are also placed inside their
| own subdirectory and they extend the CI_Driver_Library class. They
| offer multiple interchangeable driver options.
|
| Prototype:
|
|	$autoload['drivers'] = array('cache');
*/
$autoload['drivers'] = array('cache');

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Helper Files
| ---------------------------------------------------------------------------------------------------------------------
| Prototype:
|
|	$autoload['helper'] = array('url', 'file');
*/
$autoload['helper'] = array('url','file','directory','html','form','language','lang');

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Config files
| ---------------------------------------------------------------------------------------------------------------------
| Prototype:
|
|	$autoload['config'] = array('config1', 'config2');
|
| NOTE: This item is intended for use ONLY if you have created custom
| config files.  Otherwise, leave it blank.
|
*/
$autoload['config'] = array();

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Language files
| ---------------------------------------------------------------------------------------------------------------------
| Prototype:
|
|	$autoload['language'] = array('lang1', 'lang2');
|
| NOTE: Do not include the "_lang" part of your file.  For example
| "codeigniter_lang.php" would be referenced as array('codeigniter');
|
*/
$autoload['language'] = array();

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Interfaces
| ---------------------------------------------------------------------------------------------------------------------
| Prototype:
|
|   $autoload['interfaces'] = array('interface1', 'interface2');
|
*/
$autoload['interfaces'] = array('DataModel','IonizeLibrary');

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Namespaces
| ---------------------------------------------------------------------------------------------------------------------
| Prototype:
|
|   $autoload['namespaces'] = array('namespace1', 'namespace2');
|
*/
$autoload['namespaces'] = array('Model');

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Libraries
| ---------------------------------------------------------------------------------------------------------------------
| These are the classes located in system/libraries/ or your
| application/libraries/ directory, with the addition of the
| 'database' library, which is somewhat of a special case.
|
| Prototype:
|
|	$autoload['libraries'] = array('database', 'email', 'session');
|
| You can also supply an alternative library name to be assigned
| in the controller:
|
|	$autoload['libraries'] = array('user_agent' => 'ua');
*/
$autoload['libraries'] = array('session','theme','renderer','tagmanager','ionize');
$autoload['libraries']['user_agent'] = "client";

/*
| ---------------------------------------------------------------------------------------------------------------------
|  Auto-load Models
| ---------------------------------------------------------------------------------------------------------------------
| Prototype:
|
|	$autoload['model'] = array('first_model', 'second_model');
|
| You can also supply an alternative model name to be assigned
| in the controller:
|
|	$autoload['model'] = array('first_model' => 'first');
*/
$autoload['model'] = array();

// Base abstract model
$autoload['model']['Base'] 						= "base_model"; 

// Settings model and class
$autoload['model']['database/Settings'] 		= 'settings_model';
$autoload['model']['data/Settings'] 			= 'settings_data';

// Content model and class
$autoload['model']['database/Content'] 			= 'content_model';
$autoload['model']['data/Content'] 				= 'content_data';

// Content model and class
$autoload['model']['database/Navigation'] 		= 'navigation_model';
$autoload['model']['data/navigation/Item'] 		= 'navigation_item_data';
$autoload['model']['data/Navigation'] 			= 'navigation_data';


/* End of file: autoload.php */
/* Location: ./ionize/config/autoload.php */
