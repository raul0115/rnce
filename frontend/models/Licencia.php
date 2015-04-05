<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.licencia".
 *
 * @property integer $id
 * @property integer $activo_intangible_id
 * @property string $numero
 * @property string $fecha_adquisicion
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property ActivosIntangibles $activoIntangible
 */
class Licencia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.licencia';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['activo_intangible_id'], 'required'],
            [['activo_intangible_id'], 'integer'],
            [['fecha_adquisicion', 'sys_fecha'], 'safe'],
            [['sys_status'], 'boolean'],
            [['numero'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'activo_intangible_id' => 'Activo Intangible ID',
            'numero' => 'Numero',
            'fecha_adquisicion' => 'Fecha Adquisicion',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActivoIntangible()
    {
        return $this->hasOne(ActivosIntangibles::className(), ['id' => 'activo_intangible_id']);
    }
}
