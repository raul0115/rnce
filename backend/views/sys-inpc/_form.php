<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
use kartik\form\ActiveForm;
/* @var $this yii\web\View */
/* @var $model common\models\SysInpc */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-inpc-form">

    <?php $form = ActiveForm::begin([
       // 'id' => 'login-form-inline', 
        'type' => ActiveForm::TYPE_INLINE,
        'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_SMALL]
    ]); ?>

    <?= $form->field($model, 'mes')->textInput() ?>

    <?= $form->field($model, 'indice')->textInput() ?>

    <?= $form->field($model, 'anho')->textInput() ?>

    <?php
        /* $form->field($model, 'sys_status')->checkbox()
         $form->field($model, 'sys_fecha')->textInput() */
    ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
