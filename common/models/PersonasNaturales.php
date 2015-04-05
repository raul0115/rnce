<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "personas_naturales".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $apellido
 * @property string $rif
 * @property integer $ci
 * @property boolean $sys_status
 * @property string $sys_fecha
 * @property integer $creado_por
 *
 * @property Directores[] $directores
 * @property ReprLegales[] $reprLegales
 */
class PersonasNaturales extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'personas_naturales';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'apellido', 'rif', 'ci', 'creado_por'], 'required'],
            [['ci', 'creado_por'], 'integer'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre', 'apellido'], 'string', 'max' => 255],
            [['rif'], 'string', 'max' => 20],
            [['ci'], 'unique'],
            [['rif'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'rif' => 'Rif',
            'ci' => 'Ci',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
            'creado_por' => 'Creado Por',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDirectores()
    {
        return $this->hasMany(Directores::className(), ['persona_natural_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReprLegales()
    {
        return $this->hasMany(ReprLegales::className(), ['persona_natural_id' => 'id']);
    }
}
