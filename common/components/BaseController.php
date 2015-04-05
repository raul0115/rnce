<?php

namespace common\components;

use yii\web\Controller;

class BaseController extends Controller
{
    public function init() {
        parent::init();
    }

    public function probando() {
        exit();
    }
}