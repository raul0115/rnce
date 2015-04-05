<?php

namespace frontend\controllers;

use common\models\Bienes;

class ActivosController extends \common\components\BaseController
{
    public function actionAsociarFactura()
    {
        return $this->render('asociar-factura');
    }

    public function actionCargarDocumento()
    {
        return $this->render('cargar-documento');
    }

    public function actionDatosAvaluo()
    {
        return $this->render('datos-avaluo');
    }

    public function actionDeterioro()
    {
        return $this->render('deterioro');
    }

    public function actionIndex()
    {
        $modelBienes = new Bienes();
        return $this->render('index',['modelBienes'=>$modelBienes]);
    }

    public function actionModelosDeam()
    {
        return $this->render('modelos-deam');
    }

    public function actionRegistrarBien()
    {
        return $this->render('registrar-bien');
    }

}
