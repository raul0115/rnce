<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.sys_paises".
 *
 * @property integer $id
 * @property string $nombre
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property DatosImportacion[] $datosImportacions
 * @property SysEstados[] $sysEstados
 */
class SysPaises extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_paises';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre'], 'string', 'max' => 255],
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
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDatosImportacions()
    {
        return $this->hasMany(DatosImportacion::className(), ['pais_origen_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysEstados()
    {
        return $this->hasMany(SysEstados::className(), ['sys_pais_id' => 'id']);
    }
}
