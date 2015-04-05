<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.facturas".
 *
 * @property integer $id
 * @property string $num_factura
 * @property integer $proveedor_id
 * @property string $fecha_emision
 * @property integer $imprenta_id
 * @property string $fecha_emision_talonario
 * @property integer $comprador_id
 * @property string $base_imponible_gravable
 * @property string $execto
 * @property string $iva
 * @property integer $contratista_id
 * @property integer $bien_id
 *
 * @property PersonasJuridicas $proveedor
 * @property PersonasJuridicas $imprenta
 * @property PersonasJuridicas $comprador
 * @property PersonasJuridicas $contratista
 * @property Bienes $bien
 */
class Facturas extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.facturas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['num_factura', 'proveedor_id', 'fecha_emision', 'imprenta_id', 'fecha_emision_talonario', 'comprador_id', 'base_imponible_gravable', 'iva', 'contratista_id', 'bien_id'], 'required'],
            [['proveedor_id', 'imprenta_id', 'comprador_id', 'contratista_id', 'bien_id'], 'integer'],
            [['fecha_emision', 'fecha_emision_talonario'], 'safe'],
            [['base_imponible_gravable', 'execto', 'iva'], 'number'],
            [['num_factura'], 'string', 'max' => 255],
            [['proveedor_id', 'num_factura'], 'unique', 'targetAttribute' => ['proveedor_id', 'num_factura'], 'message' => 'The combination of Num Factura and Proveedor ID has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'num_factura' => 'Num Factura',
            'proveedor_id' => 'Proveedor ID',
            'fecha_emision' => 'Fecha Emision',
            'imprenta_id' => 'Imprenta ID',
            'fecha_emision_talonario' => 'Fecha Emision Talonario',
            'comprador_id' => 'Comprador ID',
            'base_imponible_gravable' => 'Base Imponible Gravable',
            'execto' => 'Execto',
            'iva' => 'Iva',
            'contratista_id' => 'Contratista ID',
            'bien_id' => 'Bien ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProveedor()
    {
        return $this->hasOne(PersonasJuridicas::className(), ['id' => 'proveedor_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getImprenta()
    {
        return $this->hasOne(PersonasJuridicas::className(), ['id' => 'imprenta_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComprador()
    {
        return $this->hasOne(PersonasJuridicas::className(), ['id' => 'comprador_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContratista()
    {
        return $this->hasOne(PersonasJuridicas::className(), ['id' => 'contratista_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBien()
    {
        return $this->hasOne(Bienes::className(), ['id' => 'bien_id']);
    }
}
