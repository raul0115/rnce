<?php
return [
    'components' => [
        // Configuración de Urls Managers //
/*        'urlManager' => [
            'enablePrettyUrl' => true,
            'suffix'=>'.html',
            'showScriptName' => false,
            'rules' => [
                // your rules go here
            ],
        ],
        'urlManagerFrontend' => [
            // here is your frontend URL manager config
            'class' => 'yii\web\urlManager',
            //'baseUrl' => '/a/frontend/web',
            'enablePrettyUrl' => true,
            'suffix'=>'.html',
            'showScriptName' => false,
            'rules' => [
                // your rules go here
            ],
        ],*/
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'pgsql:host=localhost;dbname=rnc',
            'username' => 'eureka',
            'password' => 'eureka',
            'charset' => 'utf8',
        ],
/*        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],*/
        // Configuración Correo Electronico //
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'useFileTransport'=>false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'username' => 'your email account',
                'password' => 'your password account',
                'host' => '127.0.0.1',
                'port' => '25'
            ],
        ],
    ],
];
