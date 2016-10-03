<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\SensorAvailable */

$this->title = 'Update Sensor Available: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Sensor Availables', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="sensor-available-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
