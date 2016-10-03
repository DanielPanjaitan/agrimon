<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\searchModels\ActconditionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Actconditions';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="actcondition-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Actcondition', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'actuator_in_use_id',
            'sensor_name',
            'constraint',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
