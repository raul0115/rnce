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



/**************************   WIDGETS   **************************/



