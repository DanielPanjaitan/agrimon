<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Actcondition */

$this->title = 'Create Actcondition';
$this->params['breadcrumbs'][] = ['label' => 'Actconditions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="actcondition-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
