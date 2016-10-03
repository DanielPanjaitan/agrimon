<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Sensorinuse */

$this->title = 'Update Sensor';
$this->params['breadcrumbs'][] = ['label' => $model->token_id, 'url' => ['finalconfiguration/view','id'=>$model->token_id]];
$this->params['breadcrumbs'][] = ['label' => $model->identifier, 'url' => ['view','id'=>$model->id]];
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
        <div class="sensorinuse-update">

          

            <?=
            $this->render('_form', [
                'model' => $model,
            ])
            ?>

        </div>
    </div>
</div>
