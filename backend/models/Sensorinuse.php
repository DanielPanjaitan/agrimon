<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "sensor_in_use".
 *
 * @property integer $id
 * @property string $identifier
 * @property string $token_id
 * @property integer $sensor_name
 * @property string $pin_in_use
 *
 * @property SensorAvailable $sensorName
 * @property FinalConfiguration $token
 */
class Sensorinuse extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sensor_in_use';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sensor_name'], 'integer'],
            [['pin_in_use'], 'string'],
            [['identifier'], 'string', 'max' => 255],
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
            'identifier' => 'Identifier',
            'token_id' => 'Token ID',
            'sensor_name' => 'Jenis Sensor',
            'pin_in_use' => 'Pin yang digunakan',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSensorName()
    {
        return $this->hasOne(SensorAvailable::className(), ['id' => 'sensor_name']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getToken()
    {
        return $this->hasOne(FinalConfiguration::className(), ['token_id' => 'token_id']);
    }
}
