<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PersonasNaturalesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Personas Naturales';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="personas-naturales-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Personas Naturales', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nombre',
            'apellido',
            'rif',
            'ci',
            // 'sys_status:boolean',
            // 'sys_fecha',
            // 'creado_por',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
