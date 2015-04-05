<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.documentos_registrados".
 *
 * @property integer $id
 * @property integer $contratista_id
 * @property integer $sys_tipo_documento_id
 * @property integer $sys_tipo_registro_id
 * @property string $circunscripcion
 * @property string $num_registro_notaria
 * @property string $tomo
 * @property string $folio
 * @property string $fecha_registro
 * @property string $valor_adquisicion
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Contratistas $contratista
 * @property SysTipoDocumento $sysTipoDocumento
 * @property SysTiposRegistros $sysTipoRegistro
 */
class DocumentosRegistrados extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.documentos_registrados';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['contratista_id', 'sys_tipo_documento_id', 'sys_tipo_registro_id', 'circunscripcion', 'num_registro_notaria', 'tomo', 'folio', 'fecha_registro', 'valor_adquisicion'], 'required'],
            [['contratista_id', 'sys_tipo_documento_id', 'sys_tipo_registro_id'], 'integer'],
            [['fecha_registro', 'sys_fecha'], 'safe'],
            [['valor_adquisicion'], 'number'],
            [['sys_status'], 'boolean'],
            [['circunscripcion', 'num_registro_notaria'], 'string', 'max' => 255],
            [['tomo', 'folio'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'contratista_id' => 'Contratista ID',
            'sys_tipo_documento_id' => 'Sys Tipo Documento ID',
            'sys_tipo_registro_id' => 'Sys Tipo Registro ID',
            'circunscripcion' => 'Circunscripcion',
            'num_registro_notaria' => 'Num Registro Notaria',
            'tomo' => 'Tomo',
            'folio' => 'Folio',
            'fecha_registro' => 'Fecha Registro',
            'valor_adquisicion' => 'Valor Adquisicion',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
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
    public function getSysTipoDocumento()
    {
        return $this->hasOne(SysTipoDocumento::className(), ['id' => 'sys_tipo_documento_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysTipoRegistro()
    {
        return $this->hasOne(SysTiposRegistros::className(), ['id' => 'sys_tipo_registro_id']);
    }
}
