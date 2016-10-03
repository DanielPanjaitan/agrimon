<?php

namespace backend\searchModels;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Sensorinuse;

/**
 * SensorinuseSearch represents the model behind the search form about `backend\models\Sensorinuse`.
 */
class SensorinuseSearch extends Sensorinuse
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sensor_name'], 'integer'],
            [['identifier', 'token_id', 'pin_in_use'], 'safe'],
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
        $query = Sensorinuse::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC,
                ]
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'sensor_name' => $this->sensor_name,
        ]);

        $query->andFilterWhere(['like', 'identifier', $this->identifier])
            ->andFilterWhere(['like', 'token_id', $this->token_id])
            ->andFilterWhere(['like', 'pin_in_use', $this->pin_in_use]);

        return $dataProvider;
    }
}
