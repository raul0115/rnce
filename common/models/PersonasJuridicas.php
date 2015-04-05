<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "personas_juridicas".
 *
 * @property integer $id
 * @property string $rif
 * @property string $razon_social
 * @property boolean $sys_status
 * @property string $sys_fecha
 * @property integer $creado_por
 *
 * @property EmpresasRelacionadas[] $empresasRelacionadas
 */
class PersonasJuridicas extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'personas_juridicas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rif', 'creado_por'], 'required'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['creado_por'], 'integer'],
            [['rif'], 'string', 'max' => 20],
            [['razon_social'], 'string', 'max' => 255],
            [['rif'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'rif' => Yii::t('app', 'Rif'),
            'razon_social' => Yii::t('app', 'Razon Social'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_fecha' => Yii::t('app', 'Sys Fecha'),
            'creado_por' => Yii::t('app', 'Creado Por'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmpresasRelacionadas()
    {
        return $this->hasMany(EmpresasRelacionadas::className(), ['persona_juridica_id' => 'id']);
    }
}
