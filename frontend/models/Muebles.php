<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.muebles".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $marca
 * @property string $modelo
 * @property string $serial
 * @property integer $cantiad
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 * @property Vehiculos[] $vehiculos
 */
class Muebles extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.muebles';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'marca', 'modelo', 'serial', 'cantiad'], 'required'],
            [['bien_id', 'cantiad'], 'integer'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['marca', 'modelo', 'serial'], 'string', 'max' => 255]
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
            'marca' => 'Marca',
            'modelo' => 'Modelo',
            'serial' => 'Serial',
            'cantiad' => 'Cantiad',
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculos()
    {
        return $this->hasMany(Vehiculos::className(), ['mueble_id' => 'id']);
    }
}
