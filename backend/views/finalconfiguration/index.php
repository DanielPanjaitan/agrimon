<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel backend\searchModels\FinalConfigurationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Konfigurasi Sensor ';
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
        <div class="final-configuration-index">

           
            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
            <?= Html::a('<i class="glyphicon glyphicon-saved"></i><span> Gunakan Sensor </span>', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
                    'identifier',
//                    'token_id',
//            'library_list:ntext',
//            'global_configuration:ntext',
//            'setup_function:ntext',
//            'open_loop_function:ntext',
                    // 'close_loop_function:ntext',
                    'created_at',
                    ['class' => 'yii\grid\ActionColumn',
                                'header' =>
                                'Action',
                                'template' => '{view}',
                                'buttons' => [
                                    'view' => function($url, $model) {

                                        return Html::a('<center><span class="fa  fa-wrench"></span><center>', $url, [
                                                    'title' => Yii::t('app', 'view'),
//                                            'class' => 'btn btn-primary btn-xs',
                                                    'data-method' => 'post',
                                        ]);
                                    },
                                        ],
                                        'urlCreator' => function ($action, $model, $key, $index) {
                                    if ($action === 'view') {
                                        $url = Url::toRoute(['/finalconfiguration/view', 'id' => $model->token_id], ['data-method' => 'post',]);
                                        return $url;
                                    }
                                }
                                    ],
                ],
            ]);
            ?>

        </div>
    </div>
</div>
