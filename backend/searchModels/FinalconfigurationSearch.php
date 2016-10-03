<?php

namespace backend\searchModels;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Finalconfiguration;

/**
 * FinalconfigurationSearch represents the model behind the search form about `backend\models\Finalconfiguration`.
 */
class FinalconfigurationSearch extends Finalconfiguration
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['token_id', 'identifier', 'library_list', 'global_configuration', 'setup_function', 'open_loop_function', 'close_loop_function', 'created_at'], 'safe'],
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
        $query = Finalconfiguration::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'created_at' => SORT_DESC,
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
            'created_at' => $this->created_at,
        ]);

        $query->andFilterWhere(['like', 'token_id', $this->token_id])
            ->andFilterWhere(['like', 'identifier', $this->identifier])
            ->andFilterWhere(['like', 'library_list', $this->library_list])
            ->andFilterWhere(['like', 'global_configuration', $this->global_configuration])
            ->andFilterWhere(['like', 'setup_function', $this->setup_function])
            ->andFilterWhere(['like', 'open_loop_function', $this->open_loop_function])
            ->andFilterWhere(['like', 'close_loop_function', $this->close_loop_function]);

        return $dataProvider;
    }
}
