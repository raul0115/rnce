<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Bienes */

$this->title = Yii::t('app', 'Create Bienes');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Bienes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bienes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
