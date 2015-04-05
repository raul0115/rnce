<?php


/**************************   FORMATEO DE  DATOS   **************************/


echo Yii::$app->formatter->asPercent(0.125, 2); // output: 12.50%
echo "<br>";
echo Yii::$app->formatter->asEmail('cebe@example.com'); // output: <a href="mailto:cebe@example.com">cebe@example.com</a>
echo "<br>";
echo Yii::$app->formatter->asBoolean(true); // output: Yes
echo "<br>";
// it also handles display of null values:
echo Yii::$app->formatter->asDate(null); // output: (Not set)
echo "<br>";
        //Yii::$app->formatter->locale = 'es-MX';
echo Yii::$app->formatter->asDate('2014-12-20'); // output: January 1, 2014
echo "<br>";
echo Yii::$app->formatter->asTime(1412599260); // 14:41:00
echo "<br>";
echo Yii::$app->formatter->asDateTime('2014-10-06 12:41:00'); // 14:41:00
echo "<br>";
echo Yii::$app->formatter->asTime('2014-10-06 14:41:00 CEST'); // 14:41:00
echo "<br>";
echo Yii::$app->formatter->asDecimal(20000000000.66464565); // 14:41:00
echo "<br>";
echo Yii::$app->formatter->asCurrency(1412599260); // 14:41:00
echo "<br>";
echo Yii::$app->formatter->asTime(1412599260); // 14:41:00
echo "<br>";
/*echo "<br>";
Yii::$app->formatter->locale = 'de-DE';
echo Yii::$app->formatter->asDate('2014-01-01'); // output: 1. Januar 2014
echo "<br>";
Yii::$app->formatter->locale = 'ru-RU';

/**************************  TIPS A TOMAR EN CUENTA  **************************/

Para hacer una busqueda en todos los elementos usar: CLASSNAME::FIND()->ALL(), EJ --> SysFormasOrg::find()->all()


/**************************   SNIPPETS *******************************/

/**************************   WIDGETS   **************************/


/**************************   MANEJO DE BASE DE DATOS   **************************/

                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $modelCustomer->save(false)) {
                        foreach ($modelsAddress as $modelAddress) {
                            $modelAddress->customer_id = $modelCustomer->id;
                            if (! ($flag = $modelAddress->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $modelCustomer->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }

?>

<?php // Fuentes:
// http://snapcode.co/snap/list/category/122/yii2

?>

<?php 
//Check if request is ajax request.

public function actionDelete() {
        if (Yii::$app->request->isAjax) {
            // request is ajax request
        }
        else {
            // not ajax request
            // for example redirect
        }
}
?>

<?php
//dropdown field without $form->model
//Code for select input made from table. Dropdown not using $form->model
use yii\helpers\ArrayHelper;

 $dimensionTypes = ArrayHelper::map(DimensionType::find()->orderBy('name')->all(), 'id', 'name') ?>
<?= Html::dropDownList('price_type_id', null, $dimensionTypes, array('label' => 'Dimension type')) ?>

<?php
	//make dropdown select from database foreign key value

	//view active form
 $priceTypes = ArrayHelper::map(\app\models\PriceType::find()->orderBy('name')->all(), 'id', 'name') ?>
<?= $form->field($model, 'price_type_id')->dropDownList($priceTypes, ['prompt' => '---- Select price type ----'])->label('price type') ?>

<?php
//Yii2 check if record exists with where condition
 $exists = ModelName::find()->where([ 'column_name' => $value])->andWhere(['column_name' => $value])->exists();
//returns true or false
?>


<?php
//Gettin logged user in yii2 framework
//whole logged user
$user = \Yii::$app->user->identity;

//id of logged user
$userId = \Yii::$app->user->identity->id
?>



<?php
//Getting parameter from request
//geting all parameters
$parameters = \yii::$app->getRequest()->getQueryParams();
?>



<?php
//find many to many relationship objects
/*
For example. Product can have many tags. Product tags can be found with this active record query:

table structure:

table: Product
-   id

table: Tag
-   id
-   name

table:  Product_tag
-   id
- product_id
- tag_id*/


$currentTags = Tag::find()->innerJoin('product_tag', 'tag.id = product_tag.tag_id')->where(['product_id' => $model->id])->all();

?>
