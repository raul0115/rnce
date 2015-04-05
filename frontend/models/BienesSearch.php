<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Bienes;

/**
 * BienesSearch represents the model behind the search form about `app\models\Bienes`.
 */
class BienesSearch extends Bienes
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sys_tipo_bien_id', 'principio_contable', 'contratista_id'], 'integer'],
            [['depreciable', 'deterioro', 'propio'], 'boolean'],
            [['detalle', 'origen', 'fecha_origen'], 'safe'],
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
        $query = Bienes::find();

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
            'sys_tipo_bien_id' => $this->sys_tipo_bien_id,
            'principio_contable' => $this->principio_contable,
            'depreciable' => $this->depreciable,
            'deterioro' => $this->deterioro,
            'fecha_origen' => $this->fecha_origen,
            'contratista_id' => $this->contratista_id,
            'propio' => $this->propio,
        ]);

        $query->andFilterWhere(['like', 'detalle', $this->detalle])
            ->andFilterWhere(['like', 'origen', $this->origen]);

        return $dataProvider;
    }
}
