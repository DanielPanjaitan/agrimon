<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Actuatorinuse */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="actuatorinuse-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'token_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'actuator_name')->textInput() ?>

    <?= $form->field($model, 'pin_in_use')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
