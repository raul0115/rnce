<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "activos.sys_tipos_bienes".
 *
 * @property integer $id
 * @property string $nombre
 * @property boolean $sys_status
 * @property string $sys_fecha
 * @property string $descripcion
 * @property integer $sys_clasificacion_bien_id
 *
 * @property SysClasificacionesBien $sysClasificacionBien
 * @property MejorasPropiedades[] $mejorasPropiedades
 */
class SysTiposBienes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_tipos_bienes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'sys_clasificacion_bien_id'], 'required'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['sys_clasificacion_bien_id'], 'integer'],
            [['nombre', 'descripcion'], 'string', 'max' => 255],
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
            'descripcion' => 'Descripcion',
            'sys_clasificacion_bien_id' => 'Sys Clasificacion Bien ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysClasificacionBien()
    {
        return $this->hasOne(SysClasificacionesBien::className(), ['id' => 'sys_clasificacion_bien_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMejorasPropiedades()
    {
        return $this->hasMany(MejorasPropiedades::className(), ['sys_tipo_bien_id' => 'id']);
    }
}
