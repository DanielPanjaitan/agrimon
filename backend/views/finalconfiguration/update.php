<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\FinalConfiguration */

$this->title = 'Update Final Configuration: ' . ' ' . $model->token_id;
$this->params['breadcrumbs'][] = ['label' => 'Final Configurations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->token_id, 'url' => ['view', 'id' => $model->token_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="final-configuration-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
