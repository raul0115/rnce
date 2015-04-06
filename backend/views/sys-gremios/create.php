<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\SysGremios */

$this->title = Yii::t('app', 'Create Sys Gremios');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Sys Gremios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-gremios-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
