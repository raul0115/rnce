<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SysClasificacionesBien */

$this->title = 'Create Sys Clasificaciones Bien';
$this->params['breadcrumbs'][] = ['label' => 'Sys Clasificaciones Biens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-clasificaciones-bien-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
