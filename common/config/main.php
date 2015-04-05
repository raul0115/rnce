<?php
return [
	'id' => 'RNC',
    'language' => 'es-VE',
    //'sourceLanguage' => 'es-LA',
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
		'i18n' => [
		    'translations' => [
		        'frontend*' => [
		            'class' => 'yii\i18n\PhpMessageSource',
		            'basePath' => '@common/messages',
		             //'sourceLanguage' => 'en-US',
		        ],
		        'backend*' => [
		            'class' => 'yii\i18n\PhpMessageSource',
		            'basePath' => '@common/messages',
		             //'sourceLanguage' => 'en-US',
		        ],
		    ],
		],
		'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
        ],
    ],
];
