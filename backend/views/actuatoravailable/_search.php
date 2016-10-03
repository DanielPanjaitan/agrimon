<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\searchModels\ActuatoravailableSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="actuator-available-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'actuator_name') ?>

    <?= $form->field($model, 'pin_name') ?>

    <?= $form->field($model, 'pin_assignment') ?>

    <?= $form->field($model, 'setup_code') ?>

    <?php // echo $form->field($model, 'actuation_code') ?>

    <?php // echo $form->field($model, 'json_code') ?>

    <?php // echo $form->field($model, 'pin_options') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
