<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\SysTiposBienes */

$this->title = Yii::t('app', 'Create Sys Tipos Bienes');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Sys Tipos Bienes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-tipos-bienes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
