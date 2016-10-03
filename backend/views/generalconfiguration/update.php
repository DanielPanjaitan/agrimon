<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Generalconfiguration */

$this->title = 'Edit Konfigurasi Utama  ';
$this->params['breadcrumbs'][] = ['label' => 'Konfigurasi Utama ', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Edit';
?>
<div class="generalconfiguration-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
