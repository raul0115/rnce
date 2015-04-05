<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.sys_clasificaciones_bien".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $descripcion
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property SysTiposBienes[] $sysTiposBienes
 */
class SysClasificacionesBien extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_clasificaciones_bien';
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
            [['nombre', 'descripcion'], 'string', 'max' => 255]
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
            'descripcion' => 'Descripcion',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysTiposBienes()
    {
        return $this->hasMany(SysTiposBienes::className(), ['sys_clasificacion_bien_id' => 'id']);
    }
}
