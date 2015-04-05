<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SysTiposBienes */

$this->title = 'Create Sys Tipos Bienes';
$this->params['breadcrumbs'][] = ['label' => 'Sys Tipos Bienes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-tipos-bienes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
