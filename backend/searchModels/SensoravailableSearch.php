<?php

namespace backend\searchModels;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\SensorAvailable;

/**
 * SensoravailableSearch represents the model behind the search form about `backend\models\SensorAvailable`.
 */
class SensoravailableSearch extends SensorAvailable
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['sensor_name', 'variable_type', 'pin_options', 'created_at'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = SensorAvailable::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'created_at' => $this->created_at,
        ]);

        $query->andFilterWhere(['like', 'sensor_name', $this->sensor_name])
            ->andFilterWhere(['like', 'variable_type', $this->variable_type])
            ->andFilterWhere(['like', 'pin_options', $this->pin_options]);

        return $dataProvider;
    }
}
