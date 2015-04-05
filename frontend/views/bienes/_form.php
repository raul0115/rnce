<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;
use yii\helpers\ArrayHelper;
use app\models\SysFormasOrg;
use app\models\SysTiposBienes;

/* @var $this yii\web\View */
/* @var $model app\models\Bienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bienes-form">

    <?php $form = ActiveForm::begin(); 
        $principioContable = ArrayHelper::map(SysFormasOrg::find()->all(), 'id', 'nombre');
        $tipoBien = ArrayHelper::map(SysTiposBienes::find()->all(), 'id', 'nombre');
    ?>

    <?= $form->field($model, 'sys_tipo_bien_id')->dropDownList(
            $tipoBien,
            ['prompt'=>'Seleccione tipo de bien']
        );
    ?>

    <?= $form->field($model, 'principio_contable')->dropDownList(
            $principioContable,
            ['prompt'=>'Seleccione el principio contable']
        );
    ?>

    <?= $form->field($model, 'depreciable')->checkbox() ?>

    <?= $form->field($model, 'deterioro')->checkbox() ?>

    <?= $form->field($model, 'detalle')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'origen')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'fecha_origen')->widget(\yii\jui\DatePicker::classname(), [
        'language' => 'es',
        'dateFormat' => 'dd-MM-yyyy',
    ])?>


    <?= $form->field($model, 'propio')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>