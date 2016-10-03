<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Generalconfiguration */

$this->title = 'Create Generalconfiguration';
$this->params['breadcrumbs'][] = ['label' => 'Generalconfigurations', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="generalconfiguration-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
