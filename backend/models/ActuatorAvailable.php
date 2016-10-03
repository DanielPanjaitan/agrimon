<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "actuator_available".
 *
 * @property integer $id
 * @property string $actuator_name
 * @property string $pin_name
 * @property string $pin_assignment
 * @property string $setup_code
 * @property string $actuation_code
 * @property string $json_code
 * @property string $pin_options
 * @property string $created_at
 *
 * @property ActuatorInUse[] $actuatorInUses
 */
class ActuatorAvailable extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'actuator_available';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pin_assignment', 'setup_code', 'actuation_code', 'json_code', 'pin_options'], 'string'],
            [['created_at'], 'safe'],
            [['actuator_name', 'pin_name'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'actuator_name' => 'Actuator Name',
            'pin_name' => 'Pin Name',
            'pin_assignment' => 'Pin Assignment',
            'setup_code' => 'Setup Code',
            'actuation_code' => 'Actuation Code',
            'json_code' => 'Json Code',
            'pin_options' => 'Pin Options',
            'created_at' => 'Created At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActuatorInUses()
    {
        return $this->hasMany(ActuatorInUse::className(), ['actuator_name' => 'id']);
    }
}
