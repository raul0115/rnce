<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sys_inpc".
 *
 * @property integer $id
 * @property integer $mes
 * @property string $indice
 * @property integer $anho
 * @property boolean $sys_status
 * @property string $sys_fecha
 */
class SysInpc extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sys_inpc';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mes', 'indice', 'anho'], 'required'],
            [['mes', 'anho'], 'integer'],
            [['indice'], 'number'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['mes', 'anho'], 'unique', 'targetAttribute' => ['mes', 'anho'], 'message' => 'The combination of Mes and Anho has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'mes' => 'Mes',
            'indice' => 'Indice',
            'anho' => 'Año',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }
}
