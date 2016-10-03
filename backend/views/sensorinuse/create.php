<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Sensorinuse */

$this->title = 'Create Sensorinuse';
$this->params['breadcrumbs'][] = ['label' => 'Sensorinuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sensorinuse-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
