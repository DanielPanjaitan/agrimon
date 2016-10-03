<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "actuator_in_use".
 *
 * @property integer $id
 * @property string $token_id
 * @property integer $actuator_name
 * @property string $pin_in_use
 *
 * @property ActuatorAvailable $actuatorName
 * @property FinalConfiguration $token
 */
class Actuatorinuse extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'actuator_in_use';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['actuator_name'], 'integer'],
            [['pin_in_use'], 'string'],
            [['token_id'], 'string', 'max' => 20]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'token_id' => 'Token ID',
            'actuator_name' => 'Actuator Name',
            'pin_in_use' => 'Pin In Use',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActuatorName()
    {
        return $this->hasOne(ActuatorAvailable::className(), ['id' => 'actuator_name']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getToken()
    {
        return $this->hasOne(FinalConfiguration::className(), ['token_id' => 'token_id']);
    }
}
