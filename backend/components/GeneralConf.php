<?php

namespace backend\components;

use Yii;
use yii\base\Component;
use yii\base\InvalidConfigException;
use backend\models\Generalconfiguration;

class GeneralConf extends Component {

    private $id = 1;

    public function confid() {
        return $this->id;
    }

    public function librarylist() {
        $model = Generalconfiguration::findOne($this->id);
        return $model->library_list;
    }

    public function globalconfiguration() {
        $model = Generalconfiguration::findOne($this->id);
        return $model->global_configuration;
    }

    public function setupfunction() {
        $model = Generalconfiguration::findOne($this->id);
        return $model->setup_function;
    }

    public function openloop() {
        $model = Generalconfiguration::findOne($this->id);
        return $model->open_loop_function;
    }

    public function closeloop() {
        $model = Generalconfiguration::findOne($this->id);
        return $model->close_loop_function;
    }

}
