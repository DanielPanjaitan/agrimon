<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\UpdatePass $model
 */

$this->title = 'Create Update Pass';
$this->params['breadcrumbs'][] = ['label' => 'Update Passes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="update-pass-create">
    <div class="page-header">
        <h1><?= Html::encode($this->title) ?></h1>
    </div>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
