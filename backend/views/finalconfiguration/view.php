<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use backend\models\Sensorinuse;
use backend\models\Actuatorinuse;
use backend\models\ActuatorAvailable;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use backend\models\SensorAvailable;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\bootstrap\Modal;

//use sjaakp\bandoneon\Bandoneon;

/* @var $this yii\web\View */
/* @var $model backend\models\FinalConfiguration */

$this->title = $model->identifier;
$this->params['breadcrumbs'][] = ['label' => 'Final Configurations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$script = <<< JS
$(document).ready(function(){
    $("#sensorinuse-pin_in_use").each(function(){
        $(this).add($(this).next()).wrapAll('<div class="input-group"></div></div>');
    });
    $('<div class="input-group-btn"><button type="button" class="btn btn-primary" id="generate-key">Help (?)</button>').insertBefore("#sensorinuse-pin_in_use");
    $( "#generate-key" ).click(function(e) {
        
        var id =$('#sensor_name').val();
        //alert (id);
         $.get('ajax-filler',{id : id },function(data){
            var data =$.parseJSON(data);
           alert(data.pin_options);
             });
        });
});
JS;
$this->registerJs($script, \yii\web\View::POS_END);
?>

<section class="content-header"> </section>
<?php if (Yii::$app->session->hasFlash('sukses')): ?>
    <div class="alert alert-success"><center>
            <?php
            echo Yii::$app->session->getFlash('sukses');
            Yii::$app->session->removeFlash('sukses');
            ?>
        </center></div>
<?php endif; ?>
<?php if (Yii::$app->session->hasFlash('warning')): ?>
    <div class="alert alert-warning"><center>
            <?php
            echo Yii::$app->session->getFlash('warning');
            Yii::$app->session->removeFlash('warning');
            ?>
        </center></div>
<?php endif; ?>
<!--<section class="content">-->

<!-- Default box -->
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"><h1><?= Html::encode($this->title) ?></h1></h3>

        <div class="box-tools pull-right">

        </div>
    </div>
    <div class="box-body">
        <div class="final-configuration-view">



            <p>
                <?= Html::a('<span class="glyphicon glyphicon-ok-circle"> </span> Generate  ', ['gen', 'id' => $model->token_id], ['class' => 'btn btn-success']) ?>
                <?= Html::a('<span class="glyphicon glyphicon-ok-circle"></span> Upload ', ['upload', 'id' => $model->token_id], ['class' => 'btn btn-warning']) ?>
                <?= Html::a('<span class="glyphicon glyphicon-eye-open"></span> Lihat Data Observasi ', ['hasil', 'id' => $model->token_id], ['class' => 'btn btn-primary']) ?>

                <!--  <?=
                Html::a('Delete', ['delete', 'id' => $model->token_id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Are you sure you want to delete this item?',
                        'method' => 'post',
                    ],
                ])
                ?>-->
            </p>

            <?=
            DetailView::widget([
                'model' => $model,
                'attributes' => [
                    'identifier',
                    'token_id',
                    //'library_list:ntext',
                    //'global_configuration:ntext',
                    //'setup_function:ntext',
                    //'open_loop_function:ntext',
                    //'close_loop_function:ntext',
                    'created_at',
                    [
                        'attribute' => 'Jumlah Sensor',
                        'format' => 'raw',
                        'value' => '<i class="btn-primary btn-xs">' . Sensorinuse::find()->where(['token_id' => $model->token_id])->count() . '</i>',
                    ],
                    [
                        'attribute' => 'Jumlah Aktuator',
                        'format' => 'raw',
                        'value' => '<i class="btn-primary btn-xs">' . Actuatorinuse::find()->where(['token_id' => $model->token_id])->count() . '</i>',
                    ],
                ],
            ])
            ?>

        </div>

        <br><br><hr><hr><br>    
        <div class="col-sm-14">
            <div class="col-sm-6">
                <div class="sensorinuse-form">
                    <?php $form = ActiveForm::begin(); ?>
                    <div class="container-items"><!-- widgetContainer -->
                        <div class="item panel panel-default"><!-- widgetBody -->
                            <div class="panel-heading">
                                <h1 class="panel-title pull-left">Tambah Sensor</h1>

                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-body">

                                <div class="row">
                                    <div class="col-sm-11">
                                        <?= $form->field($modelSensor, 'identifier')->textInput() ?>
                                    </div>
                                    <div class="col-sm-11">
                                        <?=
                                        $form->field($modelSensor, 'sensor_name')->widget(Select2::classname(), [
                                            'data' => ArrayHelper::map(SensorAvailable::find()->all(), 'id', 'sensor_name'), 'options' => ['placeholder' => 'Pilih Sensor'],
                                            'options' => ['placeholder' => 'Pilih Sensor ...', 'id' => 'sensor_name'],
                                            'pluginOptions' => [
                                                'allowClear' => true
                                            ],
                                        ]);
                                        ?>
                                    </div>
                                    <div class="col-sm-11">
                                        <?= $form->field($modelSensor, 'pin_in_use')->textInput() ?>
                                    </div>

                                </div><!-- .row -->
                                <div class="form-group">
                                    <?= Html::submitButton($modelSensor->isNewRecord ? 'Tambah Sensor' : 'Update', ['class' => $modelSensor->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                                </div>
                            </div>
                        </div>

                    </div>


                    <?php ActiveForm::end(); ?>
                </div>
            </div>


            <!--<br><br>-->
            <div class="col-sm-6">
                <div class="sensorinuse-index">
                    <!--<h3 class="box-title"><h4>Daftar Sensor</h4></h3>-->
                    <?php // echo $this->render('_search', ['model' => $searchModel]);       ?>

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
//                    'token_id',
                            'identifier',
                            //[
                              //  'attribute' => 'sensor_name',
                                //'value' => 'sensorName.sensor_name',
//                        'filterType' => GridView::FILTER_SELECT2,
//                        'filter' => ArrayHelper::map(backend\models\Anggota::find()->asArray()->all(), 'id', 'nama'),
//                        'filterInputOptions' => ['placeholder' => 'Search Anggota'],
                            //],
//                    'sensor_name',
                            'pin_in_use:ntext',
                            ['class' => 'yii\grid\ActionColumn',
                                        'header' => 'Action',
                                        'template' => '{download}{view}',
                                        'buttons' => [
                                            //view button
                                            'view' => function($url, $model) {
                                                return Html::a('<span class="glyphicon glyphicon-remove-circle"></span> ', $url, [
                                                            'title' => Yii::t('app', 'Delete'),
//                                                            'class' => 'btn btn-primary btn-xs',
                                                    'data-method' => 'post',
                                                ]);
                                            },
                                            'download' => function($url, $model) {

                                                return Html::a('<span class="fa  fa-wrench"></span> ', $url, [
                                                            'title' => Yii::t('app', 'Configure'),
//                                                            'class' => 'btn btn-primary btn-xs',
                                                    
                                                ]);
                                            },
                                                ],
                                                'urlCreator' => function ($action, $model, $key, $index) {
                                            if ($action === 'view') {
                                                $url = Url::toRoute(['/sensorinuse/delete', 'id' => $model->id],['data-method' => 'post',]);
                                                return $url;
                                            } else if ($action === 'download') {
                                                $url = Url::toRoute(['/sensorinuse/view', 'id' => $model->id]);
                                                return $url;
                                            }
                                        }
                                            ],
//                            ['class' => 'yii\grid\ActionColumn',
//                                'header' =>
//                                'Action',
//                                'template' => '{view}',
//                                'buttons' => [
//                                    'view' => function($url, $model) {
//
//                                        return Html::a('<center><span class="glyphicon glyphicon-remove-circle"></span><center>', $url, [
//                                                    'title' => Yii::t('app', 'delete'),
////                                            'class' => 'btn btn-primary btn-xs',
//                                                    'data-method' => 'post',
//                                        ]);
//                                    },
//                                        ],
//                                        'urlCreator' => function ($action, $model, $key, $index) {
//                                    if ($action === 'view') {
//                                        $url = Url::toRoute(['/sensorinuse/delete', 'id' => $model->id], ['data-method' => 'post',]);
//                                        return $url;
//                                    }
//                                }
//                                    ],
                                ],
                            ]);
                            ?>

                        </div>
                    </div>
                </div>

                <!-- =================================================================-----------------------=====================================-->

                <br><br><hr><hr><br>    
                <div class="row" ></div>

                <div class="col-sm-14 "style="margin-top: 100px">
                    <p>
                        <!--<?= Html::button('<span class="glyphicon glyphicon-plus"> </span> Tambah Aktuator', ['value' => Url::to(['addactuator', 'id' => $model->token_id]), 'class' => 'btn btn-success', 'id' => 'modalButton']) ?>-->
                        <?= Html::a('<span class="glyphicon glyphicon-plus"></span> Tambah Aktuator ', ['addactuator', 'id' => $model->token_id], ['class' => 'btn btn-success']) ?>

                    </p>

                    <!--<br><br>-->
                    <div class="col-sm-11">
                        <div class="sensorinuse-index">
                            <!--<h3 class="box-title"><h4>Daftar Sensor</h4></h3>-->
                            <?php // echo $this->render('_search', ['model' => $searchModel]);       ?>

                                                                                <!--            <p>
                            <?= Html::a('Create Sensorinuse', ['create'], ['class' => 'btn btn-success']) ?>
                                                                                            </p>
                            -->
                            <?=
                            GridView::widget([
                                'dataProvider' => $actuatorDataProvider,
                                'filterModel' => $actuatorSearchModel,
                                'columns' => [
                                    ['class' => 'yii\grid\SerialColumn'],
//                    'id',
//                    'token_id',
                                    [
                                        'attribute' => 'actuator_name',
                                        'value' => 'actuatorName.actuator_name',
//                        'filterType' => GridView::FILTER_SELECT2,
//                        'filter' => ArrayHelper::map(backend\models\Anggota::find()->asArray()->all(), 'id', 'nama'),
//                        'filterInputOptions' => ['placeholder' => 'Search Anggota'],
                                    ],
//                    'sensor_name',
                                    'pin_in_use:ntext',
                                    
                                           ['class' => 'yii\grid\ActionColumn',
                                        'header' => 'Action',
                                        'template' => '{download}{view}',
                                        'buttons' => [
                                            //view button
                                            'view' => function($url, $model) {
                                                return Html::a('<span class="glyphicon glyphicon-remove-circle"></span> ', $url, [
                                                            'title' => Yii::t('app', 'Delete'),
//                                                            'class' => 'btn btn-primary btn-xs',
                                                    'data-method' => 'post',
                                                ]);
                                            },
                                            'download' => function($url, $model) {

                                                return Html::a('<span class="fa  fa-wrench"></span> ', $url, [
                                                            'title' => Yii::t('app', 'Configure'),
//                                                            'class' => 'btn btn-primary btn-xs',
                                                    
                                                ]);
                                            },
                                                ],
                                                'urlCreator' => function ($action, $model, $key, $index) {
                                            if ($action === 'view') {
                                                $url = Url::toRoute(['/actuatorinuse/delete', 'id' => $model->id],['data-method' => 'post',]);
                                                return $url;
                                            } else if ($action === 'download') {
                                                $url = Url::toRoute(['/actuatorinuse/view', 'id' => $model->id]);
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

                                <!-- =================================================================-----------------------=====================================-->
                            </div>
                        </div>

                        <?php
                        Modal::begin([
                            'header' => '<center><h2>Tambah Aktuator</h2></center>',
                            'id' => 'modal',
                            'size' => 'modelModal-lg',
                        ]);
                        echo "<div id='modalContent'></div>";
                        Modal::end();
                        ?>