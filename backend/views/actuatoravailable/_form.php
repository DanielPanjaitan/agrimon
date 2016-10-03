<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ActuatorAvailable */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="actuator-available-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'actuator_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pin_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pin_assignment')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'setup_code')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'actuation_code')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'json_code')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'pin_options')->textarea(['rows' => 6]) ?>

    <!--<?= $form->field($model, 'created_at')->textInput() ?>-->

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
