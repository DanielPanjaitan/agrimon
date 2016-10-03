<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\SensorAvailable */

$this->title = 'Create Sensor Available';
$this->params['breadcrumbs'][] = ['label' => 'Sensor Availables', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sensor-available-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
