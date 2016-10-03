<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Actuatorinuse */

$this->title = 'Create Actuatorinuse';
$this->params['breadcrumbs'][] = ['label' => 'Actuatorinuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="actuatorinuse-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
