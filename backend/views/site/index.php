<?php
/* @var $this yii\web\View */

use hscstudio\chart\ChartNew;
use miloschuman\highcharts\Highcharts;

$this->title = 'Agrimon';
?>
<div class="site-index">
    <?php if (Yii::$app->session->hasFlash('sukses')): ?>
        <div class="alert alert-success">
            <?php
            echo Yii::$app->session->getFlash('sukses');
            Yii::$app->session->removeFlash('sukses');
            ?>
        </div>
    <?php endif; ?>


    <div class="jumbotron">

        <h2><strong>Aplikasi Manajemen Mikrokontroller</strong></h2>
        <p class="lead">Aplikasi ini digunakan untuk melakukan manajemen penggunaan sensor dan konfigurasi penggunaan sensor pada Mikrokontroller yang digunakan</p>

        <?php
        echo Highcharts::widget([
            'scripts' => [
                'highcharts-more', // enables supplementary chart types (gauge, arearange, columnrange, etc.)
                'modules/exporting', // adds Exporting button/menu to chart
//                'themes/grid'        // applies global 'grid' theme to all charts
            ],
            'options' => [
                 'chart' => [
                        'type' => 'line', 
//                        'width' => 800,
//                        'height' => 700,
                        'zoomType' => 'x',
                ],
                'title' => ['text' => 'Data Hasil Observasi'],
                'xAxis' => [
                    'categories' => ['20042016', '20042016', '20042016', '20042016', '20042016', '20042016']
                ],
                'yAxis' => [
                    'title' => ['text' => 'Intensitas']
                ],
                'series' => [
//                    ['name' => 'DHT11 Temperature', 'data' => [25, 25, 26, 27, 28, 29]],
//                    ['name' => 'DHT11 Humidity', 'data' => [50, 41, 32, 20, 12, 61]],
                    ['name' => 'Soil Humidity', 'data' => [50, 51, 52, 40, 42, 61]],
//                    ['name' => 'LM35 Temperature', 'data' => [35, 35, 36, 37, 38, 39]],
                ]
            ]
        ]);
        ?>
    </div>
</div>
