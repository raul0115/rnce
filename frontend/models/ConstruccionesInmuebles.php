<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.construcciones_inmuebles".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $area_construccion
 * @property string $porcentaje_ejecucion
 * @property string $monto_ejecutado
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 */
class ConstruccionesInmuebles extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.construcciones_inmuebles';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'area_construccion', 'porcentaje_ejecucion', 'monto_ejecutado'], 'required'],
            [['bien_id'], 'integer'],
            [['porcentaje_ejecucion', 'monto_ejecutado'], 'number'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['area_construccion'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'bien_id' => 'Bien ID',
            'area_construccion' => 'Area Construccion',
            'porcentaje_ejecucion' => 'Porcentaje Ejecucion',
            'monto_ejecutado' => 'Monto Ejecutado',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBien()
    {
        return $this->hasOne(Bienes::className(), ['id' => 'bien_id']);
    }
}
