<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sys_naturales_juridicas".
 *
 * @property integer $id
 * @property string $rif
 * @property boolean $juridica
 * @property boolean $sys_status
 * @property string $sys_fecha
 * @property string $denominacion
 *
 * @property Accionistas[] $accionistas
 * @property Clientes[] $clientes
 * @property Contratistas[] $contratistas
 */
class SysNaturalesJuridicas extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sys_naturales_juridicas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rif', 'juridica', 'denominacion'], 'required'],
            [['juridica', 'sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['rif'], 'string', 'max' => 20],
            [['denominacion'], 'string', 'max' => 255],
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
            'juridica' => Yii::t('app', 'Juridica'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_fecha' => Yii::t('app', 'Sys Fecha'),
            'denominacion' => Yii::t('app', 'Denominacion'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccionistas()
    {
        return $this->hasMany(Accionistas::className(), ['natural_juridica_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClientes()
    {
        return $this->hasMany(Clientes::className(), ['natural_juridico_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContratistas()
    {
        return $this->hasMany(Contratistas::className(), ['natural_juridica_id' => 'id']);
    }
}
