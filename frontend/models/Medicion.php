<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.medicion".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property boolean $medicion_activo
 * @property integer $sys_metodo_medicion_id
 * @property boolean $sys_status
 * @property string $sys_fecha
 * @property boolean $aplica_deterioro
 * @property boolean $vinculado_proceso_productivo
 * @property boolean $vinculado_proceso_ventas
 *
 * @property Bienes $bien
 * @property SysMetodoMedicion $sysMetodoMedicion
 */
class Medicion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.medicion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'sys_metodo_medicion_id'], 'required'],
            [['bien_id', 'sys_metodo_medicion_id'], 'integer'],
            [['medicion_activo', 'sys_status', 'aplica_deterioro', 'vinculado_proceso_productivo', 'vinculado_proceso_ventas'], 'boolean'],
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
            'medicion_activo' => 'Medicion Activo',
            'sys_metodo_medicion_id' => 'Sys Metodo Medicion ID',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
            'aplica_deterioro' => 'Aplica Deterioro',
            'vinculado_proceso_productivo' => 'Vinculado Proceso Productivo',
            'vinculado_proceso_ventas' => 'Vinculado Proceso Ventas',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBien()
    {
        return $this->hasOne(Bienes::className(), ['id' => 'bien_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysMetodoMedicion()
    {
        return $this->hasOne(SysMetodoMedicion::className(), ['id' => 'sys_metodo_medicion_id']);
    }
}
