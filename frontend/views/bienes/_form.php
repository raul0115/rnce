<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;
use app\models\SysFormasOrg;

/* @var $this yii\web\View */
/* @var $model app\models\Bienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bienes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php
        $itemsA = array('2010' => 2010, '2011' => 2011, '2012' => 2012, '2013' => 2013, '2014' => 2014, '2015' => 2015);
    ?>
    <!--<?= $form->field($model, 'sys_tipo_bien_id')->textInput() ?>-->

    <?= $form->field($model, 'sys_tipo_bien_id')->dropDownList(
            $itemsA,
            ['prompt'=>'Seleccione tipo de bien']
        );
    ?>

    <?php
        print_r(SysFormasOrg::find()->all());//[0]['nombre']);
    ?>

    <?= $form->field($model, 'principio_contable')->textInput() ?>

    <?= $form->field($model, 'depreciable')->checkbox() ?>

    <?= $form->field($model, 'deterioro')->checkbox() ?>

    <?= $form->field($model, 'detalle')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'origen')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'fecha_origen')->widget(\yii\jui\DatePicker::classname(), [
    'language' => 'es',
    'dateFormat' => 'dd-MM-yyyy',
    ])

       /* DatePicker::widget([
            'model' => $model,
            'attribute' => 'fecha_origen',
            'language' => 'es',
            'dateFormat' => 'dd-MM-yyyy',
        ]);*/

    ?>

    <!--<? $form->field($model, 'contratista_id')->textInput() ?>-->

    <?= $form->field($model, 'propio')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
