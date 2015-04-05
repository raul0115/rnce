<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.deterioros".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $valor_razonable
 * @property string $costo_disposicion
 * @property string $valor_uso
 * @property string $acumulado_ejer_ant
 * @property string $ejercicios_anteriores
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 */
class Deterioros extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.deterioros';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'valor_razonable', 'costo_disposicion', 'valor_uso'], 'required'],
            [['bien_id'], 'integer'],
            [['valor_razonable', 'costo_disposicion', 'valor_uso', 'acumulado_ejer_ant', 'ejercicios_anteriores'], 'number'],
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
            'valor_razonable' => 'Valor Razonable',
            'costo_disposicion' => 'Costo Disposicion',
            'valor_uso' => 'Valor Uso',
            'acumulado_ejer_ant' => 'Acumulado Ejer Ant',
            'ejercicios_anteriores' => 'Ejercicios Anteriores',
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
