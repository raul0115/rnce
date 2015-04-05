<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.bienes".
 *
 * @property integer $id
 * @property integer $sys_tipo_bien_id
 * @property integer $principio_contable
 * @property boolean $depreciable
 * @property boolean $deterioro
 * @property string $detalle
 * @property string $origen
 * @property string $fecha_origen
 * @property integer $contratista_id
 * @property boolean $propio
 *
 * @property DatosImportacion[] $datosImportacions
 * @property Inmuebles[] $inmuebles
 * @property Contratistas $contratista
 * @property SysFormasOrg $principioContable
 * @property ActivosIntangibles[] $activosIntangibles
 * @property Muebles[] $muebles
 * @property ActivosBiologicos[] $activosBiologicos
 * @property Facturas[] $facturas
 * @property Deterioros[] $deterioros
 * @property Avaluos[] $avaluos
 * @property DepresiacionesAmortizaciones[] $depresiacionesAmortizaciones
 * @property Medicion[] $medicions
 * @property MejorasPropiedades[] $mejorasPropiedades
 * @property FabricacionesMuebles[] $fabricacionesMuebles
 * @property ConstruccionesInmuebles[] $construccionesInmuebles
 */
class Bienes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.bienes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sys_tipo_bien_id', 'principio_contable', 'origen', 'fecha_origen'], 'required'],
            [['sys_tipo_bien_id', 'principio_contable', 'contratista_id'], 'integer'],
            [['depreciable', 'deterioro', 'propio'], 'boolean'],
            [['fecha_origen'], 'safe'],
            [['detalle', 'origen'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sys_tipo_bien_id' => 'Tipo Bien',
            'principio_contable' => 'Principio Contable',
            'depreciable' => 'Depreciable',
            'deterioro' => 'Deterioro',
            'detalle' => 'Detalle',
            'origen' => 'Origen',
            'fecha_origen' => 'Fecha Origen',
            'contratista_id' => 'Contratista ID',
            'propio' => 'Propio',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDatosImportacions()
    {
        return $this->hasMany(DatosImportacion::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInmuebles()
    {
        return $this->hasMany(Inmuebles::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContratista()
    {
        return $this->hasOne(Contratistas::className(), ['id' => 'contratista_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPrincipioContable()
    {
        return $this->hasOne(SysFormasOrg::className(), ['id' => 'principio_contable']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActivosIntangibles()
    {
        return $this->hasMany(ActivosIntangibles::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMuebles()
    {
        return $this->hasMany(Muebles::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActivosBiologicos()
    {
        return $this->hasMany(ActivosBiologicos::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFacturas()
    {
        return $this->hasMany(Facturas::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDeterioros()
    {
        return $this->hasMany(Deterioros::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAvaluos()
    {
        return $this->hasMany(Avaluos::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDepresiacionesAmortizaciones()
    {
        return $this->hasMany(DepresiacionesAmortizaciones::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMedicions()
    {
        return $this->hasMany(Medicion::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMejorasPropiedades()
    {
        return $this->hasMany(MejorasPropiedades::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFabricacionesMuebles()
    {
        return $this->hasMany(FabricacionesMuebles::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConstruccionesInmuebles()
    {
        return $this->hasMany(ConstruccionesInmuebles::className(), ['bien_id' => 'id']);
    }
}
