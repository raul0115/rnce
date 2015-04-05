<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "estatus_contratistas".
 *
 * @property integer $id
 * @property string $descripcion
 * @property string $informacion_adicional
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Contratistas[] $contratistas
 */
class EstatusContratistas extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'estatus_contratistas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descripcion', 'sys_status'], 'required'],
            [['descripcion', 'informacion_adicional'], 'string'],
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
            'id' => Yii::t('app', 'ID'),
            'descripcion' => Yii::t('app', 'Descripcion'),
            'informacion_adicional' => Yii::t('app', 'Informacion Adicional'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_fecha' => Yii::t('app', 'Sys Fecha'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContratistas()
    {
        return $this->hasMany(Contratistas::className(), ['estatus_contratista_id' => 'id']);
    }
}
