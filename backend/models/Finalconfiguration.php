<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "final_configuration".
 *
 * @property string $token_id
 * @property string $identifier
 * @property string $library_list
 * @property string $global_configuration
 * @property string $setup_function
 * @property string $open_loop_function
 * @property string $close_loop_function
 * @property string $created_at
 *
 * @property ActuatorInUse[] $actuatorInUses
 * @property SensorData[] $sensorDatas
 * @property SensorInUse[] $sensorInUses
 */
class Finalconfiguration extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'final_configuration';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['token_id'], 'required'],
            [['identifier', 'library_list', 'global_configuration', 'setup_function', 'open_loop_function', 'close_loop_function'], 'string'],
            [['created_at'], 'safe'],
            [['token_id'], 'string', 'max' => 20]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'token_id' => 'Token ID',
            'identifier' => 'Nama',
            'library_list' => 'Library List',
            'global_configuration' => 'Global Configuration',
            'setup_function' => 'Setup Function',
            'open_loop_function' => 'Open Loop Function',
            'close_loop_function' => 'Close Loop Function',
            'created_at' => 'Created At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActuatorInUses()
    {
        return $this->hasMany(ActuatorInUse::className(), ['token_id' => 'token_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSensorDatas()
    {
        return $this->hasMany(SensorData::className(), ['token_id' => 'token_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSensorInUses()
    {
        return $this->hasMany(SensorInUse::className(), ['token_id' => 'token_id']);
    }
}
