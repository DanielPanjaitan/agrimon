<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\searchModels\GeneralconfigurationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Konfigurasi Utama';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="generalconfiguration-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <!--<p>
        <?= Html::a('Create Generalconfiguration', ['create'], ['class' => 'btn btn-success']) ?>
    </p>-->

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'library_list:ntext',
            'global_configuration:ntext',
            'setup_function:ntext',
            'open_loop_function:ntext',
            // 'close_loop_function:ntext',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
