<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SysFormasOrg */

$this->title = 'Create Sys Formas Org';
$this->params['breadcrumbs'][] = ['label' => 'Sys Formas Orgs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-formas-org-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
