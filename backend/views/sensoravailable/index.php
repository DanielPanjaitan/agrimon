<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\searchModels\SensoravailableSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Daftar Sensor';
$this->params['breadcrumbs'][] = $this->title;
?>
<section class="content-header"> </section>

<!--<section class="content">-->

<!-- Default box -->
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"><h1><?= Html::encode($this->title) ?></h1></h3>

        <div class="box-tools pull-right">

        </div>
    </div>
    <div class="box-body">
        <div class="sensor-available-index">

           
            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

            <p>
                <?= Html::a('Tambah Sensor ', ['create'], ['class' => 'btn btn-success']) ?>
            </p>

            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
//            'id',
                    'sensor_name',
//            'variable_type',
//            'pin_options:ntext',
                    'created_at',
                    ['class' => 'yii\grid\ActionColumn'],
                ],
            ]);
            ?>

        </div>
    </div>
</div>
