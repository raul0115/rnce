<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\SysFormasOrg */

$this->title = Yii::t('app', 'Create Sys Formas Org');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Sys Formas Orgs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-formas-org-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
