<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.sys_gremios".
 *
 * @property integer $id
 * @property integer $persona_juridica_id
 * @property string $direccion
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property PersonasJuridicas $personaJuridica
 * @property Avaluos[] $avaluos
 */
class SysGremios extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_gremios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['persona_juridica_id'], 'required'],
            [['persona_juridica_id'], 'integer'],
            [['direccion'], 'string'],
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
            'persona_juridica_id' => 'Persona Juridica ID',
            'direccion' => 'Direccion',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaJuridica()
    {
        return $this->hasOne(PersonasJuridicas::className(), ['id' => 'persona_juridica_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAvaluos()
    {
        return $this->hasMany(Avaluos::className(), ['gremio_id' => 'id']);
    }
}
