<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
//use yii\jui\DatePicker;
use kartik\datetime\DateTimePicker;
use yii\helpers\ArrayHelper;
use common\models\SysFormasOrg;
use common\models\SysTiposBienes;
use kartik\form\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Bienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="activos-form">

    <?php $form = ActiveForm::begin(); 
            $principioContable = ArrayHelper::map(SysFormasOrg::find()->all(), 'id', 'nombre');
            //$tipoBien = ArrayHelper::map(SysTiposBienes::find()->all(), 'id', 'nombre');
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

 
    <?php /*$form->field($model, 'deterioro')->checkbox()*/ ?>
 
     <?php /*echo $form->field($model, 'fecha_origen')->widget(\yii\jui\DatePicker::classname(), [
        'language' => 'es',
        'dateFormat' => 'dd-MM-yyyy',
    ]) */?> 
     

    

    <?= $form->field($model, 'origen')->textArea(['maxlength' => 255]) ?>

    <?= $form->field($model, 'fecha_origen')->widget(DateTimePicker::classname(), [
/*        'language' => 'es',
        'dateFormat' => 'dd-MM-yyyy',*/
                'options' => ['placeholder' => 'Seleccionar fecha origen'],
                'convertFormat' => true,
                'pluginOptions' => [
                    'format' => 'd-M-yyyy',
                    'startDate' => date('d-m-Y'),//'01-Mar-2014 12:00 AM',
                    'todayHighlight' => true
                ]
    ]) ?>


    <?= $form->field($model, 'detalle')->textArea(['maxlength' => 255]) ?>

    <?php //$form->field($model, 'contratista_id')->textInput() ?>

    <?= $form->field($model, 'propio')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
