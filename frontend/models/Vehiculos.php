<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.vehiculos".
 *
 * @property integer $id
 * @property integer $mueble_id
 * @property integer $anho
 * @property integer $uso
 * @property string $num_certificado
 * @property string $placa
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Muebles $mueble
 */
class Vehiculos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.vehiculos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mueble_id', 'anho', 'uso', 'num_certificado', 'placa'], 'required'],
            [['mueble_id', 'anho', 'uso'], 'integer'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['num_certificado'], 'string', 'max' => 255],
            [['placa'], 'string', 'max' => 15]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'mueble_id' => 'Mueble ID',
            'anho' => 'Anho',
            'uso' => 'Uso',
            'num_certificado' => 'Num Certificado',
            'placa' => 'Placa',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMueble()
    {
        return $this->hasOne(Muebles::className(), ['id' => 'mueble_id']);
    }
}
