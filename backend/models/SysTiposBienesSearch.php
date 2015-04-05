<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\SysTiposBienes;

/**
 * SysTiposBienesSearch represents the model behind the search form about `common\models\SysTiposBienes`.
 */
class SysTiposBienesSearch extends SysTiposBienes
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sys_clasificacion_bien_id'], 'integer'],
            [['nombre', 'sys_fecha', 'descripcion'], 'safe'],
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
        $query = SysTiposBienes::find();

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
            'sys_status' => $this->sys_status,
            'sys_fecha' => $this->sys_fecha,
            'sys_clasificacion_bien_id' => $this->sys_clasificacion_bien_id,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'descripcion', $this->descripcion]);

        return $dataProvider;
    }
}
