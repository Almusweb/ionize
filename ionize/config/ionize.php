<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| Cache Time for Data Models
|--------------------------------------------------------------------------
|
| Data models cache time
|
*/
$config['data_model_cache'] = 3600;

/*
|--------------------------------------------------------------------------
| Cacheing Selects
|--------------------------------------------------------------------------
|
| Using database cache or not
|
*/
$config['select_cache'] = TRUE;

/*
|--------------------------------------------------------------------------
| Cache Time for Views
|--------------------------------------------------------------------------
|
| Loaded views cache time
|
*/
$config['views_cache'] = 3600;

/*
|--------------------------------------------------------------------------
| Cache Time for Output
|--------------------------------------------------------------------------
|
| Loaded views output time
|
*/
$config['output_cache'] = 3600;

/*
|--------------------------------------------------------------------------
| Active Theme
|--------------------------------------------------------------------------
|
| Active Theme name which is equal the theme folder name.
|
*/
$config['theme'] = 'Default_Native';

/*
|--------------------------------------------------------------------------
| Active Languages
|--------------------------------------------------------------------------
|
| Active languages array. The items must be the ISO language code.
|
*/
$config['languages'] = array('en_US');
