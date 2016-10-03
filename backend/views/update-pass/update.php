<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var backend\models\UpdatePass $model
 */

$this->title = 'Ganti Password  ' ;
//$this->params['breadcrumbs'][] = ['label' => 'Update Passes', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="update-pass-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <h2><strong><?php echo 'User '. Yii::$app->user->identity->username?></strong></h2>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
