<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\PersonasJuridicas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="personas-juridicas-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'rif')->textInput(['maxlength' => 20]) ?>

    <?= $form->field($model, 'razon_social')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'sys_status')->checkbox() ?>

    <?= $form->field($model, 'sys_fecha')->textInput() ?>

    <?= $form->field($model, 'creado_por')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
