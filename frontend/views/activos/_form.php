<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
//use yii\jui\DatePicker;
use kartik\datetime\DateTimePicker;
use yii\helpers\ArrayHelper;
use common\models\SysFormasOrg;
use common\models\SysTiposBienes;
use common\models\SysClasificacionesBien;
use kartik\form\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Bienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="activos-form">

    <?php $form = ActiveForm::begin(); 
            $clasificacionBien = ArrayHelper::map(SysClasificacionesBien::find()->all(), 'id', 'nombre');
            $tipoBien = array();
            if(!empty($model->sys_clasificacion_bien_id))
              $tipoBien = ArrayHelper::map(SysTiposBienes::find()->where(['sys_clasificacion_bien_id'=>$model->sys_clasificacion_bien_id])->all(), 'id', 'nombre');
        ?>

    <?= $form->field($model, 'sys_clasificacion_bien_id')->dropDownList(
            $clasificacionBien,
            ['prompt'=>'Seleccione la clasificacion del bien',
              'onchange'=>'
                $.post( "'.Yii::$app->urlManager->createUrl('activos/listasTiposBien?id=').'"+$(this).val(), function( data ) {
                  $( "select#sys_tipo_bien_id" ).html( data );
                });
            '
            ]
        );
    ?>

    <?= $form->field($model, 'sys_tipo_bien_id')->dropDownList(
            $tipoBien,
            ['prompt'=>'Seleccione tipo de bien']
        );
    ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
