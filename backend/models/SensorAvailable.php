<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "sensor_available".
 *
 * @property integer $id
 * @property string $sensor_name
 * @property string $variable_type
 * @property string $pin_options
 * @property string $created_at
 *
 * @property SensorInUse[] $sensorInUses
 */
class SensorAvailable extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sensor_available';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pin_options'], 'string'],
            [['created_at'], 'safe'],
            [['sensor_name'], 'string', 'max' => 255],
            [['variable_type'], 'string', 'max' => 12]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sensor_name' => 'Sensor Name',
            'variable_type' => 'Variable Type',
            'pin_options' => 'Pin Options',
            'created_at' => 'Created At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSensorInUses()
    {
        return $this->hasMany(SensorInUse::className(), ['sensor_name' => 'id']);
    }
}
