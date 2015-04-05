<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SysPaisesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Sys Paises';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-paises-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Sys Paises', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nombre',
            'sys_status:boolean',
            'sys_fecha',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
