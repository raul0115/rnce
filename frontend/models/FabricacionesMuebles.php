<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.fabricaciones_muebles".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $cantidad
 * @property string $porcentaje_fabricacion
 * @property string $monto_ejecutado
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 */
class FabricacionesMuebles extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.fabricaciones_muebles';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'cantidad', 'porcentaje_fabricacion', 'monto_ejecutado'], 'required'],
            [['bien_id'], 'integer'],
            [['cantidad', 'porcentaje_fabricacion', 'monto_ejecutado'], 'number'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe']
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
            'cantidad' => 'Cantidad',
            'porcentaje_fabricacion' => 'Porcentaje Fabricacion',
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
