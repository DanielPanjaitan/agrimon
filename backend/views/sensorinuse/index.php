<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\searchModels\SensorinuseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Sensor yang digunakan';
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
        <div class="sensorinuse-index">

            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

<!--            <p>
                <?= Html::a('Create Sensorinuse', ['create'], ['class' => 'btn btn-success']) ?>
            </p>
-->
            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
//                    'id',
                    'token_id',
                    'sensor_name',
//                    'pin_in_use:ntext',
                    ['class' => 'yii\grid\ActionColumn'],
                ],
            ]);
            ?>

        </div>
    </div>
</div>
