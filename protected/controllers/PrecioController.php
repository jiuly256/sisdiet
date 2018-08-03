<?php

class PrecioController extends Controller
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
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete','autocomplete'),
				'users'=>array('@'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

public function actionAutocomplete($term) 
{
 $criteria = new CDbCriteria;
 $numero= intval($_GET['term']);
 //echo $numero; exit;
// $criteria->condition="cedula=$numero";
 $criteria->compare('LOWER(descripcion)', strtolower($_GET['term']), true);
 //$criteria->compare('LOWER(apellido)', strtolower($_GET['term']), true, 'OR');

//$criteria->addCondition('blnborrado=false');
 $criteria->order = 'id';
 $criteria->limit = 15; 
 $data = Alimento::model()->findAll($criteria);

 if (!empty($data))
 {
  $arr = array();
  foreach ($data as $item) {
   $arr[] = array(
    'id' => $item->id,
    'value' => $item->descripcion,
    'label' => $item->descripcion,
   );
  }
 }
 else
 {
  $arr = array();
  $arr[] = array(
   'id' => '',
   'value' => 'No se han encontrado resultados para su búsqueda',
   'label' => 'No se han encontrado resultados para su búsqueda',
  );
 }
  
 echo CJSON::encode($arr);
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
		$model=new Precio;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Precio']))
		{
			$model->attributes=$_POST['Precio'];
			$model->id_entrada_almacen=$_GET['id'];
			$entrada= EntradaAlmacen::model()->find('id='.$_GET['id'].'');
			$model->fecha=$entrada->fecha;

			
			if($model->save()){
					$this->redirect(array('create','id'=>$model->id_entrada_almacen));
			}
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

		if(isset($_POST['Precio']))
		{
			$model->attributes=$_POST['Precio'];
			$entrada= EntradaAlmacen::model()->find('id='.$model->id_entrada_almacen.'');
			//echo "<pre>"; print_r($entrada); exit;
			$model->fecha=$entrada->fecha;
			if($model->save()){
					$this->redirect(array('create','id'=>$model->id_entrada_almacen));
			}
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
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Precio');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Precio('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Precio']))
			$model->attributes=$_GET['Precio'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=Precio::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='precio-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
