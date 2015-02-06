<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\BancosContratistas;

/**
 * BancosContratistasSearch represents the model behind the search form about `app\models\BancosContratistas`.
 */
class BancosContratistasSearch extends BancosContratistas
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'banco_id', 'contratista_id'], 'integer'],
            [['num_cuenta', 'ano'], 'safe'],
            [['activo'], 'boolean'],
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
        $query = BancosContratistas::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'banco_id' => $this->banco_id,
            'contratista_id' => $this->contratista_id,
            'ano' => $this->ano,
            'activo' => $this->activo,
        ]);

        $query->andFilterWhere(['like', 'num_cuenta', $this->num_cuenta]);

        return $dataProvider;
    }
}