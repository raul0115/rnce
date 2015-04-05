<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Bienes */

$this->title = 'Crear Bienes';
$this->params['breadcrumbs'][] = ['label' => 'Bienes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bienes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
