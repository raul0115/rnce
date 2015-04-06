<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SysInpcSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-inpc-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'mes') ?>

    <?= $form->field($model, 'indice') ?>

    <?= $form->field($model, 'anho') ?>

    <?= $form->field($model, 'sys_status')->checkbox() ?>

    <?php // echo $form->field($model, 'sys_fecha') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
