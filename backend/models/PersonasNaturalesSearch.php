<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\PersonasNaturales;

/**
 * PersonasNaturalesSearch represents the model behind the search form about `common\models\PersonasNaturales`.
 */
class PersonasNaturalesSearch extends PersonasNaturales
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'ci', 'creado_por'], 'integer'],
            [['nombre', 'apellido', 'rif', 'sys_fecha'], 'safe'],
            [['sys_status'], 'boolean'],
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
        $query = PersonasNaturales::find();

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
            'ci' => $this->ci,
            'sys_status' => $this->sys_status,
            'sys_fecha' => $this->sys_fecha,
            'creado_por' => $this->creado_por,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'apellido', $this->apellido])
            ->andFilterWhere(['like', 'rif', $this->rif]);

        return $dataProvider;
    }
}
