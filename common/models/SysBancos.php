<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sys_bancos".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $rif
 * @property string $codigo_sudeban
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property BancosContratistas[] $bancosContratistas
 */
class SysBancos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sys_bancos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'rif', 'codigo_sudeban'], 'required'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre'], 'string', 'max' => 255],
            [['rif'], 'string', 'max' => 25],
            [['codigo_sudeban'], 'string', 'max' => 10],
            [['rif'], 'unique'],
            [['codigo_sudeban'], 'unique']
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
            'rif' => 'Rif',
            'codigo_sudeban' => 'Codigo Sudeban',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBancosContratistas()
    {
        return $this->hasMany(BancosContratistas::className(), ['banco_id' => 'id']);
    }
}
