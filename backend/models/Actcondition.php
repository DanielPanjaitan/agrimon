<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "act_condition".
 *
 * @property integer $id
 * @property integer $actuator_in_use_id
 * @property string $sensor_name
 * @property string $constraint
 *
 * @property ActuatorInUse $actuatorInUse
 */
class Actcondition extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'act_condition';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['actuator_in_use_id'], 'integer'],
            [['sensor_name', 'constraint'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'actuator_in_use_id' => 'Actuator In Use ID',
            'sensor_name' => 'Sensor Name',
            'constraint' => 'Constraint',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActuatorInUse()
    {
        return $this->hasOne(ActuatorInUse::className(), ['id' => 'actuator_in_use_id']);
    }
}
