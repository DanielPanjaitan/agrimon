<?php

namespace backend\searchModels;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Actcondition;

/**
 * ActconditionSearch represents the model behind the search form about `backend\models\Actcondition`.
 */
class ActconditionSearch extends Actcondition
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'actuator_in_use_id'], 'integer'],
            [['sensor_name', 'constraint'], 'safe'],
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
        $query = Actcondition::find();

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
            'actuator_in_use_id' => $this->actuator_in_use_id,
        ]);

        $query->andFilterWhere(['like', 'sensor_name', $this->sensor_name])
            ->andFilterWhere(['like', 'constraint', $this->constraint]);

        return $dataProvider;
    }
}
