<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\PersonasJuridicas;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\SysGremios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sys-gremios-form">

    <?php $form = ActiveForm::begin(); 

    	$personaJuridica = ArrayHelper::map(PersonasJuridicas::find()->all(), 'id', 'razon_social');

    ?>

    <?= $form->field($model, 'persona_juridica_id')->dropDownList(
            $personaJuridica,
            ['prompt'=>'Seleccione persona juridica']
        );
    ?>

    <?= $form->field($model, 'direccion')->textarea(['rows' => 6]) ?>

    <?php /* $form->field($model, 'sys_status')->checkbox()

    $form->field($model, 'sys_fecha')->textInput() */?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
