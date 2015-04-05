<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SysTiposBienesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Sys Tipos Bienes');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sys-tipos-bienes-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Sys Tipos Bienes'), ['create'], ['class' => 'btn btn-success']) ?>
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
            'descripcion',
            // 'sys_clasificacion_bien_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
