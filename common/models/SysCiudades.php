<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "activos.sys_ciudades".
 *
 * @property integer $id
 * @property integer $sys_estado_id
 * @property string $nombre
 * @property string $codigo_postal
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property SysEstados $sysEstado
 */
class SysCiudades extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_ciudades';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sys_estado_id', 'nombre', 'codigo_postal'], 'required'],
            [['sys_estado_id'], 'integer'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre', 'codigo_postal'], 'string', 'max' => 255],
            [['sys_estado_id', 'nombre'], 'unique', 'targetAttribute' => ['sys_estado_id', 'nombre'], 'message' => 'The combination of Sys Estado ID and Nombre has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sys_estado_id' => 'Sys Estado ID',
            'nombre' => 'Nombre',
            'codigo_postal' => 'Codigo Postal',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysEstado()
    {
        return $this->hasOne(SysEstados::className(), ['id' => 'sys_estado_id']);
    }
}
