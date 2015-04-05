<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.mejoras_propiedades".
 *
 * @property integer $id
 * @property string $clasificacion
 * @property integer $sys_tipo_bien_id
 * @property integer $principio_contable_id
 * @property boolean $depreciacion
 * @property boolean $deterioro
 * @property boolean $sys_status
 * @property string $sys_fecha
 * @property integer $bien_id
 * @property string $monto
 * @property string $fecha
 * @property boolean $capitalizable
 *
 * @property SysTiposBienes $sysTipoBien
 * @property SysFormasOrg $principioContable
 * @property Bienes $bien
 */
class MejorasPropiedades extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.mejoras_propiedades';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['clasificacion', 'sys_tipo_bien_id', 'principio_contable_id', 'bien_id', 'monto', 'fecha'], 'required'],
            [['sys_tipo_bien_id', 'principio_contable_id', 'bien_id'], 'integer'],
            [['depreciacion', 'deterioro', 'sys_status', 'capitalizable'], 'boolean'],
            [['sys_fecha', 'fecha'], 'safe'],
            [['monto'], 'number'],
            [['clasificacion'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'clasificacion' => 'Clasificacion',
            'sys_tipo_bien_id' => 'Sys Tipo Bien ID',
            'principio_contable_id' => 'Principio Contable ID',
            'depreciacion' => 'Depreciacion',
            'deterioro' => 'Deterioro',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
            'bien_id' => 'Bien ID',
            'monto' => 'Monto',
            'fecha' => 'Fecha',
            'capitalizable' => 'Capitalizable',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysTipoBien()
    {
        return $this->hasOne(SysTiposBienes::className(), ['id' => 'sys_tipo_bien_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPrincipioContable()
    {
        return $this->hasOne(SysFormasOrg::className(), ['id' => 'principio_contable_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBien()
    {
        return $this->hasOne(Bienes::className(), ['id' => 'bien_id']);
    }
}
