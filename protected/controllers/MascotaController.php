<?php

class MascotaController extends Controller
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
				'actions'=>array('admin','autocomplete','autocomplete2'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('delete','eliminar'),
				'users'=>array('admin'),
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
 $criteria->condition="cedula=$numero";
 $criteria->compare('LOWER(nombre)', strtolower($_GET['term']), true,'OR');
 $criteria->compare('LOWER(apellido)', strtolower($_GET['term']), true, 'OR');

//$criteria->addCondition('blnborrado=false');
 $criteria->order = 'cedula';
 $criteria->limit = 15; 
 $data = Cliente::model()->findAll($criteria);

 if (!empty($data))
 {
  $arr = array();
  foreach ($data as $item) {
   $arr[] = array(
    'id' => $item->id,
    'value' => $item->cedula.'-'.$item->nombre.' '.$item->apellido,
    'label' => $item->cedula.'-'.$item->nombre.' '.$item->apellido,
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

public function actionAutocomplete2($term) 
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
 $data = RazaMascota::model()->findAll($criteria);

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
		$model=new Mascota;
                $model->scenario='create';


		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Mascota']))
		{
			$model->attributes=$_POST['Mascota'];
			if($model->validate()) {
                        $cuenta0=$_POST["Mascota"]["cuenta_descripcion"];
                        $cuenta= explode("-", $cuenta0);
                        $padre = Cliente::model()->find('"cedula"=:cedula',array(':cedula'=>$cuenta[0]));
                        $model->id_cliente=$padre->id;  }          
			if($model->save()){
				$this->redirect(array('view','id'=>$model->id_mascota));
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
                $model->scenario='create';


		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Mascota']))
		{
			$model->attributes=$_POST['Mascota'];
                        if ($model->fecha_nacimiento==''){
                            $model->fecha_nacimiento=null;
                        }
			if($model->save()){
				$this->redirect(array('view','id'=>$model->id_mascota));
                }}

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
		$dataProvider=new CActiveDataProvider('Mascota');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Mascota('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Mascota']))
			$model->attributes=$_GET['Mascota'];

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
		$model=Mascota::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='mascota-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	public function actionEliminar($id)
	{ 
            $mascota= Mascota::model()->findByPk($id);
        
               
                $detalle= Dieta::model()->findAll('id_mascota=:id_mascota',array('id_mascota'=>$id));
               
                if ( count($detalle)>=1){
                Yii::app()->user->setFlash('error', "La mascota <strong>$mascota->nombre </strong> no puede ser eliminada, porque está asociada a una dieta.");
                $this->redirect(array('admin')); 
               
              
                }else{  
            
			$model = Mascota::model()->findByPk($id);
                        $model->delete();
                      
                        Yii::app()->user->setFlash('success', "La mascota <strong>$mascota->nombre </strong> ha sido eliminada exitosamente.");
                        $this->redirect(array('admin')); 
		}
           
        
                }
}
