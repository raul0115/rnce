<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Contratistas;

/**
 * ContratistasSearch represents the model behind the search form about `common\models\Contratistas`.
 */
class ContratistasSearch extends Contratistas
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'natural_juridica_id', 'estatus_contratista_id'], 'integer'],
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
        $query = Contratistas::find();

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
            'natural_juridica_id' => $this->natural_juridica_id,
            'estatus_contratista_id' => $this->estatus_contratista_id,
        ]);

        return $dataProvider;
    }
}
