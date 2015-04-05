<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.activos_intangibles".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $certificado_registro
 * @property string $fecha_registro
 * @property string $vigencia
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 * @property Licencia[] $licencias
 */
class ActivosIntangibles extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.activos_intangibles';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'vigencia'], 'required'],
            [['bien_id'], 'integer'],
            [['fecha_registro', 'vigencia', 'sys_fecha'], 'safe'],
            [['sys_status'], 'boolean'],
            [['certificado_registro'], 'string', 'max' => 255]
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
            'certificado_registro' => 'Certificado Registro',
            'fecha_registro' => 'Fecha Registro',
            'vigencia' => 'Vigencia',
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
    public function getLicencias()
    {
        return $this->hasMany(Licencia::className(), ['activo_intangible_id' => 'id']);
    }
}
