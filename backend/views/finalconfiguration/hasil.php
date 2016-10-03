<?php

use yii\helpers\Html;
use yii\grid\GridView;
use miloschuman\highcharts\Highcharts;

/* @var $this yii\web\View */
/* @var $searchModel backend\searchModels\FinalConfigurationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Data Hasil Observasi';
$this->params['breadcrumbs'][] = $this->title;
?>
<section class="content-header"> </section>
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"> <p>
                <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span> Kembali', ['view', 'id' => $id], ['class' => 'btn btn-success']) ?>
                &nbsp;<?= Html::a('<span class="glyphicon glyphicon-refresh"></span> Refresh Data ', ['hasil', 'id' => $id], ['class' => 'btn btn-success']) ?>

            </p>
        </h3>

        <div class="box-tools pull-right">

        </div>
    </div>
    <div class="box-body">
        <div class="final-configuration-index">
            <?php
            $iterator = 0;
            $datas = Yii::$app->db->createCommand("SELECT * FROM sensor_data WHERE token_id='$id' ORDER BY id DESC LIMIT 10")->queryAll();
	$datas = array_reverse($datas);
            //echo '<pre>';
            //print_r($datas);
            //$testing[0]["name"]="pembunuh";
            //$testing[0]["data"]=[12,11,23,12];
            //$testing[1]["name"]="pelaut";
            //$testing[1]["data"]=[20,11,26,22];
            // echo '<pre>';
            //print_r($testing);
//die();

            foreach ($datas as $index => $data) {
                $xAxis[$iterator] = $data['created_at'];
                $jsonDatas[$iterator] = $data['data'];
                $iterator++;
            }

            $temp = json_decode($jsonDatas[0]);
            $i = 0;
            foreach ($temp as $index => $data) {
                if ($index != "location" && $index != "Token") {
                    $testing[$i]["name"] = $index;
                    $i++;
                }
            }
            $cntr = 0;
            foreach ($jsonDatas as $index => $data) {
                $tempJson = json_decode($data);
                $b = 0;
                foreach ($tempJson as $indexA => $dataA) {
                    if ($indexA != "location" && $indexA != "Token") {
                        $testing[$b]["data"][$cntr] = (int) $dataA;
                        $b++;
                    }
                }
                $cntr++;
            }
            foreach ($testing as $key => $value) {
                ?>

                <div class="col-lg-6 col-xs-6">
                    <div class="box box-success">
                        <div class="box-header with-border">
                           <center>  <h3 class="box-title"><?php echo "Data ".$value['name'];?></h3></center>
                            <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="chart">
                                <?php
                                echo Highcharts::widget([
                                    'scripts' => [
                                        'highcharts-more', // enables supplementary chart types (gauge, arearange, columnrange, etc.)
//                    'modules/exporting', // adds Exporting button/menu to chart
                                    ],
                                    'options' => [
                                        'chart' => [
                                            'type' => 'line',
                                            'zoomType' => 'x',
                                        ],
                                        'title' => ['text' => 'Data Hasil Observasi'],
                                        'xAxis' => [
                                            'categories' => $xAxis
                                        ],
                                        'yAxis' => [
                                            'title' => ['text' => 'Intensitas ']
                                        ],
                                        'series' => [
                                            ['name' => $value['name'], 'data' => $value['data']],
                                        ],
//                                        'series' => $value['data']
                                    ]
                                ]);
                                ?>
                            </div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div>


                <?php
            }

//            die();
            ?>





<div class="container"> </div>



            <div class="sensor-data-index">


<?php // echo $this->render('_search', ['model' => $searchModel]);    ?>

<!--<p>
                <?= Html::a('Create Sensor Data', ['create'], ['class' => 'btn btn-success']) ?>
</p>-->
                <br><br><br>
                <br><hr><hr>            <?=
                GridView::widget([
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],
//            'id',
//                    'token_id',
                        'data',
                        'created_at',
//                    ['class' => 'yii\grid\ActionColumn'],
                    ],
                ]);
                ?>

            </div>
        </div>
    </div>
</div>
