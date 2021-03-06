<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "activos.sys_formas_org".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $descripcion
 * @property boolean $sys_status
 * @property string $sys_fecha
 *
 * @property Bienes[] $bienes
 * @property MejorasPropiedades[] $mejorasPropiedades
 */
class SysFormasOrg extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.sys_formas_org';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['descripcion'], 'string'],
            [['sys_status'], 'boolean'],
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
            'id' => Yii::t('app', 'ID'),
            'nombre' => Yii::t('app', 'Nombre'),
            'descripcion' => Yii::t('app', 'Descripcion'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_fecha' => Yii::t('app', 'Sys Fecha'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBienes()
    {
        return $this->hasMany(Bienes::className(), ['principio_contable' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMejorasPropiedades()
    {
        return $this->hasMany(MejorasPropiedades::className(), ['principio_contable_id' => 'id']);
    }
}
