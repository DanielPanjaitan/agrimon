<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\SensorData */

$this->title = 'Create Sensor Data';
$this->params['breadcrumbs'][] = ['label' => 'Sensor Datas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sensor-data-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
