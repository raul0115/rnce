<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\SysClasificacionesBien;
/* @var $this yii\web\View */
/* @var $model common\models\SysTiposBienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-tipos-bienes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'descripcion')->textArea(['maxlength' => 255]) ?>

    <?php // $form->field($model, 'sys_clasificacion_bien_id')->textInput()

        $clasificacionBien = ArrayHelper::map(SysClasificacionesBien::find()->all(), 'id', 'nombre');

    ?>
    <?= $form->field($model, 'sys_clasificacion_bien_id')->dropDownList(
            $clasificacionBien,
            ['prompt'=>'Seleccione la clasificacion del bien']
        );
    ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
