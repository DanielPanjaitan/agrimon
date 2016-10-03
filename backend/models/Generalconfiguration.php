<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "general_configuration".
 *
 * @property integer $id
 * @property string $library_list
 * @property string $global_configuration
 * @property string $setup_function
 * @property string $open_loop_function
 * @property string $close_loop_function
 */
class Generalconfiguration extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'general_configuration';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['library_list', 'global_configuration', 'setup_function', 'open_loop_function', 'close_loop_function'], 'required'],
            [['library_list', 'global_configuration', 'setup_function', 'open_loop_function', 'close_loop_function'], 'string']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'library_list' => 'Library List',
            'global_configuration' => 'Global Configuration',
            'setup_function' => 'Setup Function',
            'open_loop_function' => 'Open Loop Function',
            'close_loop_function' => 'Close Loop Function',
        ];
    }
}
