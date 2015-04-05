<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SysGremios */

$this->title = 'Create Sys Gremios';
$this->params['breadcrumbs'][] = ['label' => 'Sys Gremios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-gremios-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
