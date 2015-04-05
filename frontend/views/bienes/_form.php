<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Bienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bienes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'sys_tipo_bien_id')->textInput() ?>

    <?= $form->field($model, 'principio_contable')->textInput() ?>

    <?= $form->field($model, 'depreciable')->checkbox() ?>

    <?= $form->field($model, 'deterioro')->checkbox() ?>

    <?= $form->field($model, 'detalle')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'origen')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'fecha_origen')->textInput() ?>

    <?= $form->field($model, 'contratista_id')->textInput() ?>

    <?= $form->field($model, 'propio')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
