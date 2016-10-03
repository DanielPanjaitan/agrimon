<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ActuatorAvailable */

$this->title = 'Tambah Aktuator';
$this->params['breadcrumbs'][] = ['label' => 'Actuator Availables', 'url' => ['index']];
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
        <div class="actuator-available-create">


            <?=
            $this->render('_form', [
                'model' => $model,
            ])
            ?>

        </div>
    </div>
</div>
