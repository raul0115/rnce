<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\SysClasificacionesBien */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-clasificaciones-bien-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'descripcion')->textArea(['maxlength' => 255]) ?>

    <?php  /*$form->field($model, 'sys_status')->checkbox()

     $form->field($model, 'sys_fecha')->textInput() */ ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
