<?php

namespace backend\searchModels;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ActuatorAvailable;

/**
 * ActuatoravailableSearch represents the model behind the search form about `backend\models\ActuatorAvailable`.
 */
class ActuatoravailableSearch extends ActuatorAvailable
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['actuator_name', 'pin_name', 'pin_assignment', 'setup_code', 'actuation_code', 'json_code', 'pin_options', 'created_at'], 'safe'],
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
        $query = ActuatorAvailable::find();

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

        $query->andFilterWhere(['like', 'actuator_name', $this->actuator_name])
            ->andFilterWhere(['like', 'pin_name', $this->pin_name])
            ->andFilterWhere(['like', 'pin_assignment', $this->pin_assignment])
            ->andFilterWhere(['like', 'setup_code', $this->setup_code])
            ->andFilterWhere(['like', 'actuation_code', $this->actuation_code])
            ->andFilterWhere(['like', 'json_code', $this->json_code])
            ->andFilterWhere(['like', 'pin_options', $this->pin_options]);

        return $dataProvider;
    }
}
