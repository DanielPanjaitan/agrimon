<?php

namespace backend\controllers;

use Yii;
use backend\models\UpdatePass;
use backend\searchModels\Update_pass;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\User;
/**
 * UpdatePassController implements the CRUD actions for UpdatePass model.
 */
class UpdatePassController extends Controller {

    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all UpdatePass models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new UpdatePassSearch;
        $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

        return $this->render('index', [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
        ]);
    }

    /**
     * Displays a single UpdatePass model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id) {
        $id = base64_decode($id);
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('view', ['model' => $model]);
        }
    }

    /**
     * Creates a new UpdatePass model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new UpdatePass;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing UpdatePass model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionChangepass($id) {        
        $model = new UpdatePass();
        
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->getUser()->setPassword($model->new_password);
            if($model->getUser()->save())
            {
                $user = new User();
                $user = User::findOne(Yii::$app->user->id);
                $user->is_change=1;
                $user->save();
                
                Yii::$app->session->setFlash('sukses', "Change Password success");
                return $this->redirect(['site/index']); 
            }
        }
        else {
            return $this->render('update', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing UpdatePass model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the UpdatePass model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return UpdatePass the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = UpdatePass::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    protected function findModela($id) {
        if (($model = UpdatePass::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
