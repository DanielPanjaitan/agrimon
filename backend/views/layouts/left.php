<?php

use yii\bootstrap\Nav;
use yii\widgets\Menu;
?>


<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= Yii::$app->homeUrl ?>/img/person.png" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p><?= Yii::$app->user->identity->username ?></p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>



        <?php
        echo Menu::widget([
            'options' => ['class' => 'sidebar-menu'],
            'submenuTemplate' => "\n<ul class=\"treeview-menu\">\n{items}\n</ul>\n",
            'activateParents' => true,
            'activateItems' => true,
            'encodeLabels' => false,
            'items' => [

                [
                    'label' => '<i class="glyphicon glyphicon-home"></i><span> Home</span> ',
                    'url' => ['site/index']
                ],
                [
                    'label' => '<i class="fa  fa-gears"></i><span> Manajemen </span><i class="fa fa-angle-left pull-right"></i>',
                    'url' => ['#'],
                    'items' => [
                        [
                            'label' => '<i class="fa  fa-list-alt"></i><span> Daftar Sensor</span> ',
                            'url' => ['sensoravailable/index'],
                            'active' => Yii::$app->controller->id == "sensoravailable",
                        ],
                        [
                            'label' => '<i class="fa  fa-list-alt"></i><span> Daftar Aktuator</span> ',
                            'url' => ['actuatoravailable/index'],
                            'active' => Yii::$app->controller->id == "actuatoravailable",
                        ],
                        [
                            'label' => '<i class="fa  fa-wrench"></i><span> Konfigurasi Utama</span> ',
                            'url' => ['/generalconfiguration/view', 'id' => base64_encode(Yii::$app->generalConf->confid())],
                            'active' => Yii::$app->controller->id == "generalconfiguration",
                        ],
//                        [
//                            'label' => '<i class="fa   fa-bar-chart"></i><span> Data Hasil </span>',
//                            'url' => ['sensordata/index'],
//                            'active' => Yii::$app->controller->id == "sensordata",
//                        ],
                        [
                            'label' => '<i class="fa  fa-user"></i><span> Ganti Password',
                            'url' => ['/update-pass/changepass', 'id' => base64_encode(Yii::$app->user->id)],
                            'active' => Yii::$app->controller->id == "update-pass",
                        ],
                    ]
                ],
//                [
//                    'label' => '<i class="glyphicon glyphicon-saved"></i><span> Gunakan Sensor </span>',
//                    'url' => ['sensorinuse/index'],
//                    'active' => Yii::$app->controller->id == "sensorinuse",
//                ],
//                [
//                    'label' => '<i class="fa   fa-bar-chart"></i><span> Data Hasil </span>',
//                    'url' => ['sensordata/index'],
//                    'active' => Yii::$app->controller->id == "sensordata",
//                ],
                [
                    'label' => '<i class="fa  fa-wrench"></i><span> Manajemen Sensor</span>',
                    'url' => ['finalconfiguration/index'],
                    'active' => Yii::$app->controller->id == "finalconfiguration",
                ],
            ],
        ]);
        ?>




    </section>

</aside>
