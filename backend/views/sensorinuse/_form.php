<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Sensorinuse */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sensorinuse-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'token_id')->textInput(['maxlength' => true,'readonly' => true]) ?>
    
    <?= $form->field($model, 'identifier')->textInput(['maxlength' => true]) ?>

    <!--<?= $form->field($model, 'sensor_name')->textInput() ?>-->

    <?= $form->field($model, 'pin_in_use')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
