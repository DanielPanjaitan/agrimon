<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Actcondition */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="actcondition-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'actuator_in_use_id')->textInput() ?>

    <?= $form->field($model, 'sensor_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'constraint')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
