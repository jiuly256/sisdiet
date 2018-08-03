<?php
Yii::setPathOfAlias('bootstrap', dirname(__FILE__).'/../extensions/bootstrap');

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');
 
// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
    
    
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
         'name'=>'SISDIET',

	// preloading 'log' component
	'preload'=>array('log',
        'bootstrap', // preload the bootstrap component
            ),

	// autoloading model and component classes

	'import' => array(
        'application.models.*',
        'application.components.*',
        'application.extensions.jtogglecolumn.*',
        'application.modules.admin.models.*',
    ),

        'theme'=>'abound', // requires you to copy the theme under your themes directory
	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'sisdiet',
		 	// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
                      'generatorPaths' => array(
                'bootstrap.gii', // since 0.9.1
            ),
		),
            'admin',
		
	),

	// application components
	'components'=>array(
            
             'bootstrap'=>array(
                'class'=>'bootstrap.components.Bootstrap',
                ),
            
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
		// uncomment the following to enable URLs in path-format
		
		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		
		'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),
		// uncomment the following to use a MySQL database
		

		'db'=>array(
			'connectionString' => 'pgsql:host=localhost;dbname=sisdiet',
			'emulatePrepare' => FALSE,
			'username' => 'postgres',
			'password' => '123456',
			'charset' => 'utf8',
		),
               
             'authManager'=>array(
                        'class'=>'CDbAuthManager',
                        'connectionID'=>'db',
                        'itemTable'=>'AuthItem', // Tabla que contiene los elementos de autorizacion
                        'itemChildTable'=>'AuthItemChild', // Tabla que contiene los elementos padre-hijo
                        'assignmentTable'=>'AuthAssignment', // Tabla que contiene la signacion usuario-autorizacion
                    ),
            
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				
//				array(
//					'class'=>'CWebLogRoute',
//				),
				
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
	),
    
    
       'language'=>'es', // Este es el lenguaje en el que querés que muestre las cosas
       'sourceLanguage'=>'en', //  este es el lenguaje por default de los archivos
       'defaultController'=>'usuario/admin'
);
