<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "sensor_data".
 *
 * @property integer $id
 * @property string $token_id
 * @property string $data
 * @property string $created_at
 *
 * @property FinalConfiguration $token
 */
class SensorData extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sensor_data';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['created_at'], 'safe'],
            [['token_id'], 'string', 'max' => 20],
            [['data'], 'string', 'max' => 255]
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
            'data' => 'Data',
            'created_at' => 'Created At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getToken()
    {
        return $this->hasOne(FinalConfiguration::className(), ['token_id' => 'token_id']);
    }
}
