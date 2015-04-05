<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.sys_tipo_documento".
 *
 * @property integer $id
 * @property string $nombre
 * @property boolean $estado
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property DocumentosRegistrados[] $documentosRegistrados
 */
class SysTipoDocumento extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_tipo_documento';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['estado', 'sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre'], 'string', 'max' => 255],
            [['nombre'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre',
            'estado' => 'Estado',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentosRegistrados()
    {
        return $this->hasMany(DocumentosRegistrados::className(), ['sys_tipo_documento_id' => 'id']);
    }
}
