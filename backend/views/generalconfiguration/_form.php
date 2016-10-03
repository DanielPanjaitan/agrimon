<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Generalconfiguration */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="generalconfiguration-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'library_list')->textarea(['rows' => 10]) ?>

    <?= $form->field($model, 'global_configuration')->textarea(['rows' => 10]) ?>

    <?= $form->field($model, 'setup_function')->textarea(['rows' => 10]) ?>

    <?= $form->field($model, 'open_loop_function')->textarea(['rows' => 10]) ?>

    <?= $form->field($model, 'close_loop_function')->textarea(['rows' => 10]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Edit', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
