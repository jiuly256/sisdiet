<?php

class FacturaController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','pdf_factura','admin'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('delete','update'),
				'users'=>array('noentrar'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}


 	    public function actionPdf_factura($id)
  {
      $this->render('pdf_factura',array(
          'model'=>$this->loadModel($id),
      ));
  }
	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Factura;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Factura']))
		{
			$model->attributes=$_POST['Factura'];

$dietac= Dieta::model()->find('id='.$_GET['id']);

$cliente= Cliente::model()->find('id='.$dietac->id_cliente);


$dietasubdieta= DietaSubdieta::model()->findAll('id_dieta='.$_GET['id']);
$descripcion= $dietasubdieta['0']->descripcion;
$cuenta=count($dietasubdieta);
$suma=0;
foreach ($dietasubdieta as $key => $value) {

    $suma+=$dietasubdieta[$key]->total;
}
$sumaf=number_format($suma,2,',','.');

$premios= DietaDetalle::model()->findAllBySql('select * from dieta_detalle,alimento where id_dieta='.$_GET['id'].'
and alimento.id=dieta_detalle.id_alimento
and alimento.tipo_alimento=7');
$descripcionp= 'PREMIO';
$sumap=0;
$cuentap=0;
foreach ($premios as $key => $value) {

	$cuentap+=$premios[$key]->cantidad_gramos;
    $sumap+=$premios[$key]->precio_gramos;
}
$sumapf=number_format($sumap,2,',','.');

$sumasubtotal=$suma+$sumap;
$sumasubtotalf=number_format($sumasubtotal,2,',','.');
$iva=$sumasubtotal*0.12;
$ivaf=number_format($iva,2,',','.');
$total=$sumasubtotal+$iva;
$totalf=number_format($total,2,',','.');

$fecha=date('Y-m-d');
$model->cantidad=$cuenta;
$model->descripcion=$descripcion;
$model->precio=$suma;
$model->cantidadp=$cuentap;
$model->descripcionp=$descripcionp;
$model->preciop=$sumap;
$model->porcentaje=12;
$model->subtotal=$sumasubtotal;
$model->iva=$iva;
$model->total=$total;
$model->id_dieta=$_GET['id'];

			if($model->save())
				$this->redirect(array('view','id'=>$model->id_factura));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Factura']))
		{
			$model->attributes=$_POST['Factura'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_factura));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Factura');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Factura('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Factura']))
			$model->attributes=$_GET['Factura'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Factura the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Factura::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Factura $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='factura-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
