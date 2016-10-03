<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\SensorAvailable */

$this->title = $model->sensor_name;
$this->params['breadcrumbs'][] = ['label' => 'Daftar Sensor ', 'url' => ['index']];
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
        <div class="sensor-available-view">

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
//                    'id',
                    'sensor_name',
                    'variable_type',
                    'pin_options:ntext',
                    'created_at',
                ],
            ])
            ?>

        </div>
    </div>
</div>
