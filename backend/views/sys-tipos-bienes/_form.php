<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SysTiposBienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-tipos-bienes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'sys_status')->checkbox() ?>

    <?= $form->field($model, 'sys_fecha')->textInput() ?>

    <?= $form->field($model, 'descripcion')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'sys_clasificacion_bien_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
