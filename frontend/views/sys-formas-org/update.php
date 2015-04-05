<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SysFormasOrg */

$this->title = 'Update Sys Formas Org: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Sys Formas Orgs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="sys-formas-org-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
