<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\PersonasJuridicas */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Personas Juridicas',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Personas Juridicas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="personas-juridicas-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
