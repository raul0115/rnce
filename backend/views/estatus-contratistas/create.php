<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\EstatusContratistas */

$this->title = Yii::t('app', 'Create Estatus Contratistas');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Estatus Contratistas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="estatus-contratistas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
