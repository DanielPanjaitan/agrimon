<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\SensorData */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sensor-data-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'token_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'data')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
