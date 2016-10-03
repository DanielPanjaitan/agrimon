<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Generalconfiguration */

$this->title = "Konfigurasi Utama";
$this->params['breadcrumbs'][] = ['label' => 'Konfigurasi Utama'];
?>
<section class="content-header"> </section>

<!--<section class="content">-->

    <!-- Default box -->
    <div class="box">
        <div class="box-header with-border">
         <h1><?= Html::encode($this->title) ?></h1>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body">
            
<div class="generalconfiguration-view">

    

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <!--<?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>-->
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'library_list:ntext',
            'global_configuration:ntext',
            'setup_function:ntext',
            'open_loop_function:ntext',
            'close_loop_function:ntext',
        ],
    ]) ?>

</div>
            </div>
    </div>
