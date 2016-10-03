<?php

namespace backend\controllers;

use Yii;
use backend\models\Finalconfiguration;
use backend\searchModels\FinalconfigurationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\Model;
use backend\models\Sensorinuse;
use backend\models\SensorAvailable;
use backend\searchModels\SensorinuseSearch;
use yii\helpers\ArrayHelper;
use backend\models\SensorData;
use backend\searchModels\SensordataSearch;
use backend\models\ActuatorAvailable;
use backend\models\Actuatorinuse;
use backend\searchModels\ActuatoravailableSearch;
use backend\searchModels\ActuatorinuseSearch;
use yii\helpers\Json;
use backend\models\Actcondition;

/**
 * FinalConfigurationController implements the CRUD actions for FinalConfiguration model.
 */
class FinalconfigurationController extends Controller {

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
     * Lists all FinalConfiguration models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new FinalConfigurationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single FinalConfiguration model.
     * @param string $id
     * @return mixed
     */
    public function actionHasil($id) {
        if (SensorData::find()->where(['token_id' => $id])->count() == 0) {
            Yii::$app->session->setFlash('warning', "Maaf, Data sensor belum anda, coba tunggu beberapa saat lagi, atau lakukan upload source code ");
            return $this->redirect(['view', 'id' => $id]);
        } else {
            $details = new SensordataSearch();

            $queryParams = array_merge(array(), Yii::$app->request->getQueryParams());
            $queryParams["SensordataSearch"]["token_id"] = $id;
            $dataProvider = $details->search($queryParams);
            return $this->render('hasil', [
                        'id' => $id,
                        'dataProvider' => $dataProvider,
                        'searchModel' => $details,
            ]);
        }
    }

    public function actionUpload($id) {
        //$this->actionGen($id);
        $output = shell_exec("sudo /var/www/html/agrimon/backend/web/executor.sh");
        //echo "<pre>".$output."</pre>";	
        Yii::$app->session->setFlash('warning', "Source Code telah berhasil di upload");
        return $this->redirect(['view', 'id' => $id]);
    }

    public function actionAddactuator($id) {
        $model = new Actuatorinuse();
        $modelsDetail = [new \backend\models\Actcondition];
        $cons = "";
        if ($model->load(Yii::$app->request->post())) {
            $model->token_id = $id;
            $model->save();
            $modelsDetail = Model::createMultiple(\backend\models\Actcondition::classname());
            \backend\models\Model::loadMultiple($modelsDetail, Yii::$app->request->post());



            // validate all models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsDetail) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        foreach ($modelsDetail as $modelDetail) {
                            $modelDetail->actuator_in_use_id = $model->id;
                            if (!($flag = $modelDetail->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        } else {

            return $this->render('addactuator', [
                        'model' => $model,
                        'modelsDetail' => (empty($modelsDetail)) ? [new \backend\models\Sensorinuse] : $modelsDetail,
                        'id' => $id,
                        'cons' => $cons,
            ]);
        }
    }

    public function actionGen($id) {
//        die();
        if (Sensorinuse::find()->where(['token_id' => $id])->count() == 0) {
            Yii::$app->session->setFlash('warning', "Maaf, Anda harus menggunakan minimal satu sensor");
            return $this->redirect(['view', 'id' => $id]);
        } else {
            $model = new Finalconfiguration();
            $model = $this->findModel($id);

            $model->global_configuration = Yii::$app->generalConf->globalconfiguration() . "\n" . 'char token[ ] = "' . $model->token_id . '";';
            $model->open_loop_function = Yii::$app->generalConf->openloop() . "\n" . 'client.print(",\"Token\":\"");' . "\n" . 'client.print(token);' . "\n" . 'client.print("\"");';
            $model->setup_function = Yii::$app->generalConf->setupfunction();

            //Konfigurasi Aktuator
            if (Actuatorinuse::find()->where(['token_id' => $id])->count() != 0) {
                $allAktuator = ArrayHelper::map(Actuatorinuse::findAll(['token_id' => $id]), 'actuator_name', 'pin_in_use', 'id');
                $actuatoriterator = 0;
                foreach ($allAktuator as $indexA => $valueA) {
                    $arrayActuatorID[$actuatoriterator] = $indexA;
                    foreach ($valueA as $actuatorName => $actuatorPin) {
                        $arrayActuatorName[$actuatoriterator] = ActuatorAvailable::findOne($actuatorName);
                        $arrayActuatorPin[$actuatoriterator] = $actuatorPin;
                    }
                    $actuatoriterator++;
                }
//                echo "<pre>";
//                print_r($arrayActuatorID);
//                echo "<pre>";
//                print_r($arrayActuatorName);
//                echo "<pre>";
//                print_r($arrayActuatorPin);
//                echo "<pre>";
//                print_r($allAktuator);

                for ($i = 0; $i < sizeof($arrayActuatorID); $i++) {
                    $allActCondition = ArrayHelper::map(Actcondition::findAll(['actuator_in_use_id' => $arrayActuatorID[$i]]), 'sensor_name', 'constraint');
                    $conditionPerActuator[$i] = "(";
                    foreach ($allActCondition as $nameOfSensor => $constarint) {
                        $conditionPerActuator[$i] = $conditionPerActuator[$i] . "" . $nameOfSensor . " " . $constarint . " && ";
                    }
                    $conditionPerActuator[$i] = substr($conditionPerActuator[$i], 0, -3);
                    $conditionPerActuator[$i] = $conditionPerActuator[$i] . ")";
                }
//                echo "<pre>";
//                print_r($conditionPerActuator);

                for ($i = 0; $i < sizeof($arrayActuatorName); $i++) {
                    $arrayActuatorName[$i]->pin_assignment = str_replace($arrayActuatorName[$i]->pin_name, $arrayActuatorPin[$i], $arrayActuatorName[$i]->pin_assignment);
                    $model->global_configuration = $model->global_configuration . "\n" . $arrayActuatorName[$i]->pin_assignment;
//                    $model->setup_function = Yii::$app->generalConf->setupfunction() . "\n" . $arrayActuatorName[$i]->setup_code;
                    $model->setup_function = $model->setup_function . "\n" . $arrayActuatorName[$i]->setup_code;
                    $arrayActuatorName[$i]->actuation_code = str_replace("kondisiAktuator", $conditionPerActuator[$i], $arrayActuatorName[$i]->actuation_code);
                    $model->open_loop_function = $arrayActuatorName[$i]->actuation_code . "\n" . $model->open_loop_function . "\n" . $arrayActuatorName[$i]->json_code;

//                    echo $model->open_loop_function . "<br><br>";
                }
//                die();
//
//                $actuatoriterator = 0;
//
//                foreach ($allAktuator as $indexA => $valueA) {
//                    $arrayActuatorIndex[$actuatoriterator] = Actuatorinuse::findOne($indexA);
//                    foreach ($valueA as $actuatorName => $actuatorPin) {
//                        $arrayActuator[$actuatoriterator] = ActuatorAvailable::findOne($actuatorName);
//                        $arrayActuatorPin[$actuatoriterator] = $actuatorPin;
//                    }
//                    $actuatoriterator++;
//                }
//                $kondisi = "";
//                for ($iA = 0; $iA < $actuatoriterator; $iA++) {
//                    $kondisi = $kondisi . "(";
//                    if ($arrayActuatorIndex[$iA]->temperature_condition != NULL) {
//                        $kondisi = $kondisi . "" . $arrayActuatorIndex[$iA]->temperature_condition . " && ";
//                    }
//                    if ($arrayActuatorIndex[$iA]->room_humidity_condition != NULL) {
//                        $kondisi = $kondisi . "" . $arrayActuatorIndex[$iA]->room_humidity_condition . " && ";
//                    }
//                    if ($arrayActuatorIndex[$iA]->soil_humidity_condition != NULL) {
//                        $kondisi = $kondisi . "" . $arrayActuatorIndex[$iA]->soil_humidity_condition . " && ";
//                    }
//                    $kondisi = substr($kondisi, 0, -3);
//                    $kondisi = $kondisi . ")";
//                    $arrayActuator[$iA]->pin_assignment = str_replace($arrayActuator[$iA]->pin_name, $arrayActuatorPin[$iA], $arrayActuator[$iA]->pin_assignment);
//
//                    $model->global_configuration = $model->global_configuration . "\n" . $arrayActuator[$iA]->pin_assignment;
//
//                    $model->setup_function = Yii::$app->generalConf->setupfunction() . "\n" . $arrayActuator[$iA]->setup_code;
//
//                    $arrayActuator[$iA]->actuation_code = str_replace("kondisiAktuator", $kondisi, $arrayActuator[$iA]->actuation_code);
//
//                    $model->open_loop_function = $arrayActuator[$iA]->actuation_code . "\n" . $model->open_loop_function . "\n" . $arrayActuator[$iA]->json_code;
//                }
            }
            // echo Actuatorinuse::find()->where(['token_id' => $id])->count();
            //die();
            //Konfigurasi Sensor
            $allSensor = ArrayHelper::map(Sensorinuse::findAll(['token_id' => $id]), 'sensor_name', 'pin_in_use', 'id');

//            echo '<pre>';
//            print_r($allSensor);
//            die();
            $iterator = 0;

            foreach ($allSensor as $index => $value) {
                $arrayIdentifier[$iterator] = Sensorinuse::findOne($index);
                foreach ($value as $sensorName => $pin) {
                    $arraySensor[$iterator] = SensorAvailable::findOne($sensorName);
                    $arrayPin[$iterator] = $pin;
                }
                $iterator++;
            }

            for ($i = 0; $i < $iterator; $i++) {
                //$arraySensor[$i]->pin_assignment = str_replace($arraySensor[$i]->pin_name, $arrayPin[$i], $arraySensor[$i]->pin_assignment);
                //$model->global_configuration = $model->global_configuration . "\n" . $arraySensor[$i]->pin_assignment;
                //if ($i != $iterator - 1) {
                //$model->open_loop_function = $arraySensor[$i]->sense_code . "\n" . $model->open_loop_function . "\n" . $arraySensor[$i]->json_code . "\n" . 'client.print("\"");';
                //} else {
                //    $model->open_loop_function = $arraySensor[$i]->sense_code . "\n" . $model->open_loop_function . "\n" . $arraySensor[$i]->json_code;
                $model->open_loop_function = $arrayIdentifier[$i]->identifier . " = " . $arraySensor[$i]->sensor_name . "Assignment (" . $arrayPin[$i] . ");\n" . $model->open_loop_function . "\n" . $arraySensor[$i]->sensor_name . "Print" . "(client," . "\"" . $arrayIdentifier[$i]->identifier . "\"," . $arrayIdentifier[$i]->identifier . ");" . "";
                $model->global_configuration = $model->global_configuration . "\n" . $arraySensor[$i]->variable_type . " " . $arrayIdentifier[$i]->identifier . ";";
                //}
            }
            if ($model->save()) {
                $sourceCode = $model->library_list . "\n\n" . $model->global_configuration . "\n\n" . "void setup(){\n" . $model->setup_function . "\n}" . "\n\nvoid loop(){\n" . $model->open_loop_function . "\n" . $model->close_loop_function . "\n}\n";
                $my_file = 'sketch/src/sketch.ino';
                $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);
                fwrite($handle, $sourceCode);
                fclose($handle);

                Yii::$app->session->setFlash('sukses', "Source Code berhasil digenerate");
                return $this->redirect(['view', 'id' => $id]);
            } else {
                Yii::$app->session->setFlash('warning', "Maaf, Terjadi kesalahan, coba beberapa saat lagi");
                return $this->redirect(['view', 'id' => $id]);
            }
        }
    }

    public function actionView($id) {
        $modelSensor = new Sensorinuse();

        $modelActuator = new Actuatorinuse();

        $model = $this->findModel($id);

        $details = new SensorinuseSearch();
        $queryParams = array_merge(array(), Yii::$app->request->getQueryParams());
        $queryParams["SensorinuseSearch"]["token_id"] = $id;
        $dataProvider = $details->search($queryParams);

        $newDetails = new ActuatorinuseSearch();
        $newQueryParams = array_merge(array(), Yii::$app->request->getQueryParams());
        $newQueryParams["ActuatorinuseSearch"]["token_id"] = $id;
        $actuatorDataProvider = $newDetails->search($newQueryParams);

        if ($modelSensor->load(Yii::$app->request->post())) {
            $modelSensor->token_id = $model->token_id;
            $modelSensor->save();
            return $this->redirect(['view', 'id' => $model->token_id]);
        } else if ($modelActuator->load(Yii::$app->request->post())) {
            $modelActuator->token_id = $model->token_id;
//            $temperatureSensor=
            if ($modelActuator->temperature_condition != NULL) {
//                break;
                $modelActuator->temperature_condition = "DHT.temperature >= " . $modelActuator->temperature_condition;
            }
            if ($modelActuator->room_humidity_condition != NULL) {
                $modelActuator->room_humidity_condition = "DHT.humidity <= " . $modelActuator->room_humidity_condition;
            }
            if ($modelActuator->soil_humidity_condition != NULL) {
                $modelActuator->soil_humidity_condition = "soil <= " . $modelActuator->soil_humidity_condition;
            }
            $modelActuator->save();
            return $this->redirect(['view', 'id' => $model->token_id]);
        } else {
            return $this->render('view', [
                        'modelSensor' => $modelSensor,
                        'modelActuator' => $modelActuator,
                        'model' => $model,
                        'dataProvider' => $dataProvider,
                        'actuatorDataProvider' => $actuatorDataProvider,
                        'searchModel' => $details,
                        'actuatorSearchModel' => $newDetails,
            ]);
        }

//        return $this->render('view', [
//                    'model' => $this->findModel($id),
//        ]);
    }

    public function actionGeneratePrimaryKey() {
//        $newKey = 'SENS-'. date('Y-m-d') .'-'. '001';
//        $key = Finalconfiguration::find()->orderBy('token_id desc')->one();
//        if (isset($key)) {
//            $newKey = 'SENS-'. date('Y-m-d').'-'. (str_pad(substr($key->token_id, 2) + 1, 3, '0', STR_PAD_LEFT));
//        }
//        return $newKey;

        $newKey = bin2hex(openssl_random_pseudo_bytes(10));
        return $newKey;
    }

    /**
     * Creates a new FinalConfiguration model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new FinalConfiguration();

        if ($model->load(Yii::$app->request->post())) {
            $model->library_list = Yii::$app->generalConf->librarylist();
            $model->global_configuration = Yii::$app->generalConf->globalconfiguration() . "\n" . 'char token[ ] = "' . $model->token_id . '";';
            $model->setup_function = Yii::$app->generalConf->setupfunction();
            $model->open_loop_function = Yii::$app->generalConf->openloop() . "\n" . 'client.print(",\"Token\":\"");' . "\n" . 'client.print(token);' . "\n" . 'client.print("\"");' . "\n";
            $model->close_loop_function = Yii::$app->generalConf->closeloop();
            $model->created_at = date('Y-m-d G:i:s');
            $model->save();
            return $this->redirect(['view', 'id' => $model->token_id]);
        } else {
            return $this->render('create', [
                        'model' => $model,
            ]);
        }
    }

    public function actionLeate() {
        $model = new Finalconfiguration();
        $modelsDetail = [new \backend\models\Sensorinuse];
        if ($model->load(Yii::$app->request->post())) {
            $model->library_list = Yii::$app->generalConf->librarylist();
            $model->global_configuration = Yii::$app->generalConf->globalconfiguration();
            $model->setup_function = Yii::$app->generalConf->setupfunction();
            $model->open_loop_function = Yii::$app->generalConf->openloop();
            $model->close_loop_function = Yii::$app->generalConf->closeloop();
            $model->created_at = date('Y-m-d G:i:s');
            $model->save();
            $modelsDetail = Model::createMultiple(\backend\models\Sensorinuse::classname());
            \backend\models\Model::loadMultiple($modelsDetail, Yii::$app->request->post());



            // validate all models
            $valid = $model->validate();
            $valid = Model::validateMultiple($modelsDetail) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        foreach ($modelsDetail as $modelDetail) {
                            $modelDetail->token_id = $model->token_id;
                            if (!($flag = $modelDetail->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->token_id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        } else {

            return $this->render('create', [
                        'model' => $model,
                        'modelsDetail' => (empty($modelsDetail)) ? [new \backend\models\Sensorinuse] : $modelsDetail
            ]);
        }
    }

    /**
     * Updates an existing FinalConfiguration model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->token_id]);
        } else {
            return $this->render('update', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing FinalConfiguration model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the FinalConfiguration model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return FinalConfiguration the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = FinalConfiguration::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionAjaxFiller($id) {
        $model = new Sensoravailable;
        $model = Sensoravailable::findOne($id);
        echo Json::encode($model);
    }

    public function actionAj2axFiller($id) {
        $model = new ActuatorAvailable;
        $model = ActuatorAvailable::findOne($id);
        echo Json::encode($model);
    }

}
