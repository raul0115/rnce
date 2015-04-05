<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.desincorporacion_activos".
 *
 * @property integer $id
 * @property integer $sys_motivo_id
 * @property string $fecha
 * @property string $precio_venta
 * @property string $valor_neto_libro
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property SysMotivios $sysMotivo
 */
class DesincorporacionActivos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.desincorporacion_activos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sys_motivo_id', 'fecha', 'valor_neto_libro'], 'required'],
            [['sys_motivo_id'], 'integer'],
            [['fecha', 'sys_fecha'], 'safe'],
            [['precio_venta', 'valor_neto_libro'], 'number'],
            [['sys_status'], 'boolean']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sys_motivo_id' => 'Sys Motivo ID',
            'fecha' => 'Fecha',
            'precio_venta' => 'Precio Venta',
            'valor_neto_libro' => 'Valor Neto Libro',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysMotivo()
    {
        return $this->hasOne(SysMotivios::className(), ['id' => 'sys_motivo_id']);
    }
}
