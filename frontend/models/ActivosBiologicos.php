<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.activos_biologicos".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property integer $catidad
 * @property boolean $certificado
 * @property string $num_certificado
 * @property string $detalles
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 */
class ActivosBiologicos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.activos_biologicos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'catidad', 'detalles'], 'required'],
            [['bien_id', 'catidad'], 'integer'],
            [['certificado', 'sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['num_certificado', 'detalles'], 'string', 'max' => 255]
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
            'catidad' => 'Catidad',
            'certificado' => 'Certificado',
            'num_certificado' => 'Num Certificado',
            'detalles' => 'Detalles',
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
