<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use wbraganca\dynamicform\DynamicFormWidget;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use backend\models\ActuatorAvailable;

/* @var $this yii\web\View */
/* @var $model backend\models\Actuatorinuse */
/* @var $form yii\widgets\ActiveForm */
$this->title = 'Tambah Aktuator';
$this->params['breadcrumbs'][] = ['label' => $id, 'url' => ['view', 'id' => $id]];
$this->params['breadcrumbs'][] = $this->title;
?>
<section class="content-header"> </section>

<!--<section class="content">-->

<!-- Default box -->
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title"><h1>Tambah Aktuator</h1></h3>

        <div class="box-tools pull-right">

        </div>
    </div>
    <div class="box-body">
        <div class="actuatorinuse-form">

            <?php $form = ActiveForm::begin(['id' => 'dynamic-form']); ?>

            <div class="col-sm-6">  <?=
                $form->field($model, 'actuator_name')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(ActuatorAvailable::find()->all(), 'id', 'actuator_name'), 'options' => ['placeholder' => 'Pilih Aktuator'],
                    'options' => ['placeholder' => 'Pilih Aktuator ...', 'id' => 'actuator_name'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
                ?>
            </div>

            <div class="col-sm-6"> <?= $form->field($model, 'pin_in_use')->textInput() ?></div>



            <div class="rows">

                <div class="panel panel-default">
                    <div class="panel-heading"><h4><i class="glyphicon glyphicon-envelope"></i> Kondisi Aktuator </h4></div>
                    <div class="panel-body">
                        <?php
                        DynamicFormWidget::begin([
                            'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                            'widgetBody' => '.container-items', // required: css class selector
                            'widgetItem' => '.item', // required: css class
                            'limit' => 20, // the maximum times, an element can be cloned (default 999)
                            'min' => 1, // 0 or 1 (default 1)
                            'insertButton' => '.add-item', // css class
                            'deleteButton' => '.remove-item', // css class
                            'model' => $modelsDetail[0],
                            'formId' => 'dynamic-form',
                            'formFields' => [
                                'sensor_name',
                                'constraint',
                            ],
                        ]);
                        ?>

                        <div class="container-items"><!-- widgetContainer -->
                            <?php foreach ($modelsDetail as $i => $modelDetail): ?>
                                <div class="item panel panel-default"><!-- widgetBody -->
                                    <div class="panel-heading">
                                        <!--                                <h3 class="panel-title pull-left">Kondisi Aktuator</h3>-->
                                        <div class="pull-right">
                                            <button type="button" class="add-item btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i></button>
                                            <button type="button" class="remove-item btn btn-danger btn-xs"><i class="glyphicon glyphicon-minus"></i></button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">
                                        <?php
                                        // necessary for update action.
                                        if (!$modelDetail->isNewRecord) {
                                            echo Html::activeHiddenInput($modelDetail, "[{$i}]id");
                                        }
                                        ?>

                                        <div class="col-sm-11">
                                            <?=
                                                    $form->field($modelDetail, "[{$i}]sensor_name")
                                                    ->dropDownList(
                                                            ArrayHelper::map(backend\models\Sensorinuse::findAll(['token_id' => $id]), 'identifier', 'identifier'), ['prompt' => '- Nama Sensor -'], ['maxlength' => true]
                                                    )
                                            ?>
                                        </div>
                                        <div class="col-sm-11">
                                            <?= $form->field($modelDetail, "[{$i}]constraint")->textInput() ?>
                                        </div>
                                    </div><!-- .row -->

                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <?php DynamicFormWidget::end(); ?>
                </div>
            </div>





            <div class="form-group">
                <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>
