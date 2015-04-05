<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SysTipoDocumento */

$this->title = 'Create Sys Tipo Documento';
$this->params['breadcrumbs'][] = ['label' => 'Sys Tipo Documentos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-tipo-documento-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
