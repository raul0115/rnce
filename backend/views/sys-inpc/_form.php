<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\SysInpc */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-inpc-form">

    <?php $form = ActiveForm::begin(); 

        $itemsM = array('1' => 'Enero', '2' => 'Febrero', '3' => 'Marzo', '4' => 'Abril', '5' => 'Mayo', '6' => 'Junio', '7' => 'Julio', '8' => 'Agosto', '9' => 'Septiembre', '10' => 'Octubre', '11' => 'Nomviembre', '12' => 'Diciembre');

        $itemsA = array('2010' => 2010, '2011' => 2011, '2012' => 2012, '2013' => 2013, '2014' => 2014, '2015' => 2015);

    ?>

    <?= $form->field($model, 'anho')->dropDownList(
                $itemsA,
                ['prompt'=>'Seleccione el Año']
            );
    ?>


    <?= $form->field($model, 'mes')->dropDownList(
            $itemsM,       
            ['prompt'=>'Seleccione el Mes'] 
        );
    ?>

    <?= $form->field($model, 'indice')->textInput() ?> 

    <?php /*$form->field($model, 'sys_status')->checkbox() ?>

    <?= $form->field($model, 'sys_fecha')->textInput() */?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
