<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\SysInpc;

/**
 * SysInpcSearch represents the model behind the search form about `common\models\SysInpc`.
 */
class SysInpcSearch extends SysInpc
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'mes', 'anho'], 'integer'],
            [['indice'], 'number'],
            [['sys_status'], 'boolean'],
            [['sys_fecha'], 'safe'],
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
        $query = SysInpc::find();

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
            'mes' => $this->mes,
            'indice' => $this->indice,
            'anho' => $this->anho,
            'sys_status' => $this->sys_status,
            'sys_fecha' => $this->sys_fecha,
        ]);

        return $dataProvider;
    }
}
