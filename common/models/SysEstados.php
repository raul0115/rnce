<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "activos.sys_estados".
 *
 * @property integer $id
 * @property integer $sys_pais_id
 * @property string $nombre
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property SysPaises $sysPais
 * @property SysCiudades[] $sysCiudades
 */
class SysEstados extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_estados';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sys_pais_id', 'nombre'], 'required'],
            [['sys_pais_id'], 'integer'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sys_pais_id' => 'Sys Pais ID',
            'nombre' => 'Nombre',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysPais()
    {
        return $this->hasOne(SysPaises::className(), ['id' => 'sys_pais_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysCiudades()
    {
        return $this->hasMany(SysCiudades::className(), ['sys_estado_id' => 'id']);
    }
}
