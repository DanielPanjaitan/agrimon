<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use wbraganca\dynamicform\DynamicFormWidget;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model backend\models\FinalConfiguration */
/* @var $form yii\widgets\ActiveForm */
$script = <<< JS
$(document).ready(function(){
    $("#finalconfiguration-token_id").each(function(){
        $(this).add($(this).next()).wrapAll('<div class="input-group"></div></div>');
    });
    $('<div class="input-group-btn"><button type="button" class="btn btn-success" id="generate-key">Generate Token</button>').insertBefore("#finalconfiguration-token_id");
    $( "#generate-key" ).click(function(e) {
        e.preventDefault();
        $.ajax({
           type: "POST",
           url: "generate-primary-key",
           dataType: "text",
           success: function (data) {
                $("#finalconfiguration-token_id").val(data);
           }
       });
    });
});
JS;
$this->registerJs($script, \yii\web\View::POS_END);
?>


<div class="final-configuration-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'identifier')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'token_id')->textInput(['maxlength' => true]) ?>
    
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
