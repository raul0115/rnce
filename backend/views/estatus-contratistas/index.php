<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\EstatusContratistasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Estatus Contratistas');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="estatus-contratistas-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Estatus Contratistas'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'descripcion:ntext',
            'informacion_adicional:ntext',
            'sys_status:boolean',
            'sys_fecha',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
