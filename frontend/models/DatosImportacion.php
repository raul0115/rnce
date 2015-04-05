<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.datos_importacion".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $num_guia_nac
 * @property string $costo_adquisicion
 * @property string $gastos_mon_extranjera
 * @property integer $sys_moneda_id
 * @property string $tasa_cambio
 * @property string $gastos_imp_nacional
 * @property string $otros_costros_imp_instalacion
 * @property string $total_costo_adquisicion
 * @property boolean $sys_status
 * @property string $sys_fecha
 * @property integer $pais_origen_id
 *
 * @property Bienes $bien
 * @property SysDivisas $sysMoneda
 * @property SysPaises $paisOrigen
 */
class DatosImportacion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.datos_importacion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'num_guia_nac', 'costo_adquisicion', 'gastos_mon_extranjera', 'sys_moneda_id', 'tasa_cambio', 'gastos_imp_nacional', 'otros_costros_imp_instalacion', 'total_costo_adquisicion', 'pais_origen_id'], 'required'],
            [['bien_id', 'sys_moneda_id', 'pais_origen_id'], 'integer'],
            [['costo_adquisicion', 'gastos_mon_extranjera', 'tasa_cambio', 'gastos_imp_nacional', 'otros_costros_imp_instalacion', 'total_costo_adquisicion'], 'number'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['num_guia_nac'], 'string', 'max' => 100]
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
            'num_guia_nac' => 'Num Guia Nac',
            'costo_adquisicion' => 'Costo Adquisicion',
            'gastos_mon_extranjera' => 'Gastos Mon Extranjera',
            'sys_moneda_id' => 'Sys Moneda ID',
            'tasa_cambio' => 'Tasa Cambio',
            'gastos_imp_nacional' => 'Gastos Imp Nacional',
            'otros_costros_imp_instalacion' => 'Otros Costros Imp Instalacion',
            'total_costo_adquisicion' => 'Total Costo Adquisicion',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
            'pais_origen_id' => 'Pais Origen ID',
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
    public function getSysMoneda()
    {
        return $this->hasOne(SysDivisas::className(), ['id' => 'sys_moneda_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPaisOrigen()
    {
        return $this->hasOne(SysPaises::className(), ['id' => 'pais_origen_id']);
    }
}
