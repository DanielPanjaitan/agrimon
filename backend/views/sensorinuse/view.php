<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Sensorinuse */

$this->title = $model->identifier;
$this->params['breadcrumbs'][] = ['label' => $model->token_id, 'url' => ['/finalconfiguration/view', 'id' => $model->token_id]];
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
        <div class="sensorinuse-view">



            <p>
                <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                <?=
                Html::a('Delete', ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Are you sure you want to delete this item?',
                        'method' => 'post',
                    ],
                ])
                ?>
            </p>

            <?=
            DetailView::widget([
                'model' => $model,
                'attributes' => [
                    'identifier',
                    'token_id',
                    [
                        'attribute' => 'Jenis Sensor',
                        'value' => $model->sensorName->sensor_name,
                    ],
//                    'sensor_name',
                    'pin_in_use:ntext',
                ],
            ])
            ?>

        </div>
    </div>
</div>