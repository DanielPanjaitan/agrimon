<?php

use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
    </head>
    <body>
        <?php $this->beginBody() ?>
        <div class="wrap">
            <?php
            NavBar::begin([
                'brandLabel' => 'Aplikasi Manajemen Mikrokontroller',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
            $menuItems = [
                [
                    'label' => 'Home',
                    'url' => ['/site/index'],
                ],
            ];
            if (Yii::$app->user->isGuest) {
                $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
            } else {
                $menuItems[] = [
                    'label' => 'Manajemen',
//                    'url' => ['#'],
//                    'linkOptions' => ['data-method' => 'post'],
                    'items' => [
                        [
                            'label' => 'Daftar Sensor ',
                            'url' => ['sensoravailable/index'],
                            'active' => Yii::$app->controller->id == "sensoravailable",
                        ],
                        [
                            'label' => 'Konfigurasi Utama ',
                            'url' => ['/generalconfiguration/view','id'=> base64_encode(Yii::$app->generalConf->confid())],
                            'active' => Yii::$app->controller->id == "generalconfiguration",
                        ],
                        [
                            'label' => 'Gunakan Sensor ',
                            'url' => ['sensorinuse/index'],
                            'active' => Yii::$app->controller->id == "sensorinuse",
                        ],
                        [
                            'label' => 'Data Hasil ',
                            'url' => ['sensordata/index'],
                            'active' => Yii::$app->controller->id == "sensordata",
                        ],
                        [
                            'label' => 'Ganti Password',
                            'url' => ['/update-pass/changepass','id'=> base64_encode(Yii::$app->user->id)],
                            'active' => Yii::$app->controller->id == "update-pass",
                        ],
                    ]
                ];
                $menuItems[] = [
                    'label' => 'Logout (' . Yii::$app->user->identity->username . ')',
                    'url' => [ '/site/logout'],
                    'linkOptions' => ['data-method' => 'post']
                ];
            }
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => $menuItems,
            ]);
            NavBar::end();
            ?>

            <div class="container">
                <?=
                Breadcrumbs::widget([
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                ])
                ?>
                <?= $content ?>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <p class="pull-left">&copy; TK 01/13 <?= date('Y') ?></p>
                <p class="pull-right"><?= Yii::powered() ?>, Arduino </p>
            </div>
        </footer>

        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
