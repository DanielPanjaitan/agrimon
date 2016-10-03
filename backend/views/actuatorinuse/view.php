<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model backend\models\Actuatorinuse */

$this->title = $model->actuatorName->actuator_name." (".$model->token_id.")";
$this->params['breadcrumbs'][] = ['label' => $model->token_id, 'url' => ['/finalconfiguration/view','id'=>$model->token_id]];
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
<div class="actuatorinuse-view">

    

    <p>
       <!-- <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>-->
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'id',
            'token_id',
            [
                        'attribute' => 'Jenis Aktuator',
                        'format' => 'raw',
                        'value' => '<i class="btn-primary btn-xs">' . $model->actuatorName->actuator_name. '</i>',
                    ],
//            'actuator_name',
            'pin_in_use:ntext',
        [
                        'attribute' => 'Pin yang digunakan',
                        'format' => 'raw',
                        'value' =>  "Pin ".$model->pin_in_use,
                    ],
            ],
    ]) ?>

    
    <div class="actcondition-index">

 

  

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
//            'actuator_in_use_id',
            'sensor_name',
            'constraint',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
    
</div>
</div>
</div>
