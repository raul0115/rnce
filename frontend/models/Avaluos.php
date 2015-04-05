<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.avaluos".
 *
 * @property integer $id
 * @property integer $bien_id
 * @property string $valor
 * @property string $fecha_informe
 * @property integer $perito_id
 * @property integer $gremio_id
 * @property string $num_inscripcion_gremio
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes $bien
 * @property PersonasNaturales $perito
 * @property SysGremios $gremio
 */
class Avaluos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.avaluos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bien_id', 'valor', 'fecha_informe', 'perito_id', 'gremio_id', 'num_inscripcion_gremio'], 'required'],
            [['bien_id', 'perito_id', 'gremio_id'], 'integer'],
            [['valor'], 'number'],
            [['fecha_informe', 'sys_fecha'], 'safe'],
            [['sys_status'], 'boolean'],
            [['num_inscripcion_gremio'], 'string', 'max' => 255]
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
            'valor' => 'Valor',
            'fecha_informe' => 'Fecha Informe',
            'perito_id' => 'Perito ID',
            'gremio_id' => 'Gremio ID',
            'num_inscripcion_gremio' => 'Num Inscripcion Gremio',
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
    public function getPerito()
    {
        return $this->hasOne(PersonasNaturales::className(), ['id' => 'perito_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGremio()
    {
        return $this->hasOne(SysGremios::className(), ['id' => 'gremio_id']);
    }
}
