<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\searchModels\SensordataSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Data Hasil';
$this->params['breadcrumbs'][] = $this->title;
?>
<section class="content-header"> </section>
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"> <h1><?= Html::encode($this->title) ?></h1></h3>

        <div class="box-tools pull-right">

        </div>
    </div>
    <div class="box-body">

        <div class="sensor-data-index">

            
            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
            
    <!--<p>
            <?= Html::a('Create Sensor Data', ['create'], ['class' => 'btn btn-success']) ?>
    </p>-->

            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
//            'id',
                    'token_id',
//            'data',
                    'created_at',
                    ['class' => 'yii\grid\ActionColumn'],
                ],
            ]);
            ?>

        </div>
    </div>
</div>
