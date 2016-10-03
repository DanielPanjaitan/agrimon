<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
/**
 * @var yii\web\View $this
 * @var backend\models\UpdatePass $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="update-pass-form">

    <?php if (Yii::$app->session->hasFlash('sukses')): ?>
        <div class="alert alert-success">
            <?php
            echo Yii::$app->session->getFlash('sukses');
            Yii::$app->session->removeFlash('sukses');
            ?>
        </div>
    <?php endif; ?>
    <div class="container">
        <div class="col-sm-5">
            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'old_password')->passwordInput(['maxlength' => true, 'placeholder' => 'Enter old password']) ?>
            <?= $form->field($model, 'new_password')->passwordInput(['rows' => 20, 'placeholder' => 'Enter new password']) ?>
            <?= $form->field($model, 'repeat_new_password')->passwordInput(['rows' => 20, 'placeholder' => 'Repeat new password']) ?>
            <div class="form-group">
                <?= Html::submitButton(Yii::t('app', 'Change'), ['class' => 'btn btn-primary']) ?>
            </div>

            <?php ActiveForm::end(); ?>





        </div>
    </div>
</div>
