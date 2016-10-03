<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\searchModels\FinalConfigurationSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="final-configuration-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'token_id') ?>

    <?= $form->field($model, 'library_list') ?>

    <?= $form->field($model, 'global_configuration') ?>

    <?= $form->field($model, 'setup_function') ?>

    <?= $form->field($model, 'open_loop_function') ?>

    <?php // echo $form->field($model, 'close_loop_function') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
