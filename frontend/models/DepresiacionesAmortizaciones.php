<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.depresiaciones_amortizaciones".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $costo_adquisicion_avaluo
 * @property string $fecha_adquisicion_avaluo
 * @property integer $vida_util
 * @property string $valor_residual
 * @property string $valor_depreciar
 * @property string $tasa_anual
 * @property integer $unidades_estimadas
 * @property string $bs_unidad
 * @property integer $unidades_producidas_periodo
 * @property integer $unidades_consumidas
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 */
class DepresiacionesAmortizaciones extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.depresiaciones_amortizaciones';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'costo_adquisicion_avaluo', 'fecha_adquisicion_avaluo', 'vida_util', 'valor_residual', 'valor_depreciar', 'tasa_anual', 'unidades_estimadas', 'bs_unidad', 'unidades_producidas_periodo', 'unidades_consumidas'], 'required'],
            [['bien_id', 'vida_util', 'unidades_estimadas', 'unidades_producidas_periodo', 'unidades_consumidas'], 'integer'],
            [['costo_adquisicion_avaluo', 'valor_residual', 'valor_depreciar', 'tasa_anual', 'bs_unidad'], 'number'],
            [['fecha_adquisicion_avaluo', 'sys_fecha'], 'safe'],
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
            'bien_id' => 'Bien ID',
            'costo_adquisicion_avaluo' => 'Costo Adquisicion Avaluo',
            'fecha_adquisicion_avaluo' => 'Fecha Adquisicion Avaluo',
            'vida_util' => 'Vida Util',
            'valor_residual' => 'Valor Residual',
            'valor_depreciar' => 'Valor Depreciar',
            'tasa_anual' => 'Tasa Anual',
            'unidades_estimadas' => 'Unidades Estimadas',
            'bs_unidad' => 'Bs Unidad',
            'unidades_producidas_periodo' => 'Unidades Producidas Periodo',
            'unidades_consumidas' => 'Unidades Consumidas',
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
