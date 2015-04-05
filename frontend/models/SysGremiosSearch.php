<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\SysGremios;

/**
 * SysGremiosSearch represents the model behind the search form about `app\models\SysGremios`.
 */
class SysGremiosSearch extends SysGremios
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'persona_juridica_id'], 'integer'],
            [['direccion', 'sys_fecha'], 'safe'],
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
        $query = SysGremios::find();

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
            'persona_juridica_id' => $this->persona_juridica_id,
            'sys_status' => $this->sys_status,
            'sys_fecha' => $this->sys_fecha,
        ]);

        $query->andFilterWhere(['like', 'direccion', $this->direccion]);

        return $dataProvider;
    }
}
