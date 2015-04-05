<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Contratistas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="contratistas-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'natural_juridica_id')->textInput() ?>

    <?= $form->field($model, 'estatus_contratista_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
