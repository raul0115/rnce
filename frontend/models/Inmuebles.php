<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.inmuebles".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $descripcion
 * @property string $direccion_ubicacion
 * @property string $ficha_catastral
 * @property string $zonificacion
 * @property string $extension
 * @property string $titulo_supletorio
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 */
class Inmuebles extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.inmuebles';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'direccion_ubicacion', 'ficha_catastral', 'zonificacion', 'extension'], 'required'],
            [['bien_id'], 'integer'],
            [['descripcion'], 'string'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['direccion_ubicacion', 'ficha_catastral', 'zonificacion', 'extension', 'titulo_supletorio'], 'string', 'max' => 255]
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
            'descripcion' => 'Descripcion',
            'direccion_ubicacion' => 'Direccion Ubicacion',
            'ficha_catastral' => 'Ficha Catastral',
            'zonificacion' => 'Zonificacion',
            'extension' => 'Extension',
            'titulo_supletorio' => 'Titulo Supletorio',
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
