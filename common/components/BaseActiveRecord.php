<?php

namespace common\components;

use yii\db\ActiveRecord;

class BaseActiveRecord extends ActiveRecord
{
    public function init() {
        parent::init();
    }

    public function probando() {
        exit();
    }
}