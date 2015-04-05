<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "contratistas".
 *
 * @property integer $id
 * @property integer $natural_juridica_id
 * @property integer $estatus_contratista_id
 *
 * @property ReprLegales[] $reprLegales
 * @property EmpresasRelacionadas[] $empresasRelacionadas
 * @property NombresCajas[] $nombresCajas
 * @property Accionistas[] $accionistas
 * @property Clientes[] $clientes
 * @property SysNaturalesJuridicas $naturalJuridica
 * @property EstatusContratistas $estatusContratista
 * @property BancosContratistas[] $bancosContratistas
 * @property NotasRevelatorias[] $notasRevelatorias
 */
class Contratistas extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'contratistas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['natural_juridica_id', 'estatus_contratista_id'], 'required'],
            [['natural_juridica_id', 'estatus_contratista_id'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'natural_juridica_id' => Yii::t('app', 'Natural Juridica ID'),
            'estatus_contratista_id' => Yii::t('app', 'Estatus Contratista ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReprLegales()
    {
        return $this->hasMany(ReprLegales::className(), ['contratista_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmpresasRelacionadas()
    {
        return $this->hasMany(EmpresasRelacionadas::className(), ['contratista_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNombresCajas()
    {
        return $this->hasMany(NombresCajas::className(), ['contratistas_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccionistas()
    {
        return $this->hasMany(Accionistas::className(), ['contratista_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClientes()
    {
        return $this->hasMany(Clientes::className(), ['contratista_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNaturalJuridica()
    {
        return $this->hasOne(SysNaturalesJuridicas::className(), ['id' => 'natural_juridica_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEstatusContratista()
    {
        return $this->hasOne(EstatusContratistas::className(), ['id' => 'estatus_contratista_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBancosContratistas()
    {
        return $this->hasMany(BancosContratistas::className(), ['contratista_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNotasRevelatorias()
    {
        return $this->hasMany(NotasRevelatorias::className(), ['contratista_id' => 'id']);
    }
}
