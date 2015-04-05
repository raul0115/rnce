<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\SysInpc */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-inpc-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'mes')->textInput() ?>

    <?= $form->field($model, 'indice')->textInput() ?>

    <?= $form->field($model, 'anho')->textInput() ?>

    <?= $form->field($model, 'sys_status')->checkbox() ?>

    <?= $form->field($model, 'sys_fecha')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
