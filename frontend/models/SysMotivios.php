<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "activos.sys_motivios".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $descripcion
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property DesincorporacionActivos[] $desincorporacionActivos
 */
class SysMotivios extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_motivios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
            [['nombre', 'descripcion'], 'string', 'max' => 255],
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
            'descripcion' => 'Descripcion',
            'sys_status' => 'Sys Status',
            'sys_fecha' => 'Sys Fecha',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDesincorporacionActivos()
    {
        return $this->hasMany(DesincorporacionActivos::className(), ['sys_motivo_id' => 'id']);
    }
}
