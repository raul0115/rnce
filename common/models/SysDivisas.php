<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sys_divisas".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $codigo
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property SysTasasDivisas[] $sysTasasDivisas
 */
class SysDivisas extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sys_divisas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'codigo', 'sys_status'], 'required'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre'], 'string', 'max' => 255],
            [['codigo'], 'string', 'max' => 20],
            [['nombre'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre',
            'codigo' => 'Codigo',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysTasasDivisas()
    {
        return $this->hasMany(SysTasasDivisas::className(), ['sys_divisa_id' => 'id']);
    }
}
