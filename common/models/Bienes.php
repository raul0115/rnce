<?php

namespace common\models;

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
 * @property ActivosBiologicos[] $activosBiologicos
 * @property Inmuebles[] $inmuebles
 * @property Deterioros[] $deterioros
 * @property FabricacionesMuebles[] $fabricacionesMuebles
 * @property Facturas[] $facturas
 * @property Muebles[] $muebles
 * @property MejorasPropiedades[] $mejorasPropiedades
 * @property ActivosIntangibles[] $activosIntangibles
 * @property ConstruccionesInmuebles[] $construccionesInmuebles
 * @property Avaluos[] $avaluos
 * @property Medicion[] $medicions
 * @property DatosImportacion[] $datosImportacions
 * @property DepresiacionesAmortizaciones[] $depresiacionesAmortizaciones
 * @property Contratistas $contratista
 * @property SysFormasOrg $principioContable
 */
class Bienes extends \common\components\BaseActiveRecord
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
            [['sys_tipo_bien_id', 'principio_contable', 'origen', 'fecha_origen', 'contratista_id'], 'required'],
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
            'id' => Yii::t('app', 'ID'),
            'sys_tipo_bien_id' => Yii::t('app', 'Sys Tipo Bien ID'),
            'principio_contable' => Yii::t('app', 'Principio Contable'),
            'depreciable' => Yii::t('app', 'Depreciable'),
            'deterioro' => Yii::t('app', 'Deterioro'),
            'detalle' => Yii::t('app', 'Detalle'),
            'origen' => Yii::t('app', 'Origen'),
            'fecha_origen' => Yii::t('app', 'Fecha Origen'),
            'contratista_id' => Yii::t('app', 'Contratista ID'),
            'propio' => Yii::t('app', 'Propio'),
        ];
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
    public function getInmuebles()
    {
        return $this->hasMany(Inmuebles::className(), ['bien_id' => 'id']);
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
    public function getFabricacionesMuebles()
    {
        return $this->hasMany(FabricacionesMuebles::className(), ['bien_id' => 'id']);
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
    public function getMuebles()
    {
        return $this->hasMany(Muebles::className(), ['bien_id' => 'id']);
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
    public function getActivosIntangibles()
    {
        return $this->hasMany(ActivosIntangibles::className(), ['bien_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConstruccionesInmuebles()
    {
        return $this->hasMany(ConstruccionesInmuebles::className(), ['bien_id' => 'id']);
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
    public function getMedicions()
    {
        return $this->hasMany(Medicion::className(), ['bien_id' => 'id']);
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
    public function getDepresiacionesAmortizaciones()
    {
        return $this->hasMany(DepresiacionesAmortizaciones::className(), ['bien_id' => 'id']);
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
}
