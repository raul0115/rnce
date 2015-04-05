<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SysInpcSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Sys Inpcs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-inpc-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Sys Inpc', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'mes',
            'indice',
            'anho',
            'sys_status:boolean',
            // 'sys_fecha',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
