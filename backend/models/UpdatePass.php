<?php

namespace backend\models;

use common\models\User;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property string $username
 * @property string $auth_key
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $id_pegawai
 *
 * @property Dahasrup[] $dahasrups
 * @property Pemasukan[] $pemasukans
 * @property Sisuka[] $sisukas
 * @property Tuppak[] $tuppaks
 * @property Pegawai $idPegawai
 */
class UpdatePass extends \yii\db\ActiveRecord
{
    public $new_password;
    public $repeat_new_password;
    public $old_password;
    
    private $_user = false;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['new_password', 'repeat_new_password', 'old_password'], 'required'],
            [['old_password'], 'validatePassword'],
            [['repeat_new_password'],'compare', 'compareAttribute'=>'new_password', 'operator'=>'==']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'new_password' => 'New Password',
            'old_password' => 'Old Password',
            'repeat_new_password' => 'Repeat New Password',
        ];
    }
    
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->old_password)) {
                $this->addError($attribute, 'Old password is incorrect.');
            }
        }
    }
    
    public function getUser()
    {
        if ($this->_user === false) {
            $this->_user = User::findIdentity(Yii::$app->user->id);
        }

        return $this->_user;
    }
}
