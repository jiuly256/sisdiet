<?php

class DietaController extends Controller
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
				'actions'=>array('admin','autocomplete','dietatotal','pdf','eliminar','pdf_factura','view2'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('delete'),
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
  $criteria->compare('LOWER(nombre_mascota)', strtolower($_GET['term']), true, 'OR');


//$criteria->addCondition('blnborrado=false');
 $criteria->order = 'cedula';
 $criteria->limit = 15; 
 $data = Vistacm::model()->findAll($criteria);

 if (!empty($data))
 {
  $arr = array();
  foreach ($data as $item) {
   $arr[] = array(
    'id' => $item->id,
    'id_mascota'=>$item->id_mascota,
    'value' => $item->cedula.'-'.$item->nombre.' '.$item->apellido.' :'.$item->nombre_mascota,
    'label' => $item->cedula.'-'.$item->nombre.' '.$item->apellido.' :'.$item->nombre_mascota,
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

  $data2 = Mascota::model()->findAllBySql('select * from mascota where id_cliente='.$data[0]->id.'');
//echo "<pre>"; print_r($data2); exit;
  if (!empty($data2))
 {
  $arr2 = array();
  foreach ($data2 as $item2) {
   $arr2[] = array(
    'id_mascota' => $item2->id_mascota,
    //'value' => $item->cedula.'-'.$item->nombre.' '.$item->apellido,
   // 'label' => $item->cedula.'-'.$item->nombre.' '.$item->apellido,
   );
  }
 }
 echo CJSON::encode($arr,$arr2);
 // CJSON::encode();
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

		public function actionView2($id)
	{
		$this->render('view2',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Dieta;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Dieta']))
		{
			$model->attributes=$_POST['Dieta'];
			if($model->save())
				$this->redirect(array('/dietaDetalle/create','id'=>$model->id));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	public function actionDietatotal($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Dieta']))
		{
			$model->attributes=$_POST['Dieta'];
			if($model->save()){
				$this->redirect(array('/dietaDetalle/create','id'=>$model->id));
			}
		}

		$this->render('dietatotal',array(
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

		if(isset($_POST['Dieta']))
		{
			$model->attributes=$_POST['Dieta'];
			 // $model->dias=$model->dias;
	 	 // 	 $dieta->precio_dias=($model->precio_diario*$model->dias);
			 //  $dieta->iva=12;
		  //    $dieta->monto_iva=($model->precio_diario*$model->dias)*0.12;
			 //  $dieta->precio_total=($model->precio_diario*$model->dias)+($model->precio_diario*$model->dias)*0.12;
			if($model->save()){
				$this->redirect(array('/dietaDetalle/create2/id2/'.$model->id));
			}
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	    public function actionPdf($id)
  {
      $this->render('pdf',array(
          'model'=>$this->loadModel($id),
      ));
  }

  	    public function actionPdf_factura($id)
  {
      $this->render('pdf_factura',array(
          'model'=>$this->loadModel($id),
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
			$dietadet=DietaDetalle::model()->findAll('id_dieta='.$id.'');
			$this->loadModel($id)->delete();
				if (count($dietadet)>=1){
			for($a=0;$a<count($dietadet);$a++){
				$dietadet[$a]->delete();
			}
		}
		$dietasub=DietaSubdieta::model()->findAll('id_dieta='.$id.'');
			$this->loadModel($id)->delete();
				if (count($dietasub)>=1){
			for($a=0;$a<count($dietasub);$a++){
				$dietasub[$a]->delete();
			}
		}
			else{}


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
		$dataProvider=new CActiveDataProvider('Dieta');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Dieta('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Dieta']))
			$model->attributes=$_GET['Dieta'];

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
		$model=Dieta::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='dieta-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

		 public function actionEliminar($id)
	{
		$modelsubdieta=DietaSubdieta::model()->findByPk($id);
		$iddieta=$modelsubdieta->id_dieta;
        
        

		$modelsubdieta->delete();	

		$dietadet=DietaDetalle::model()->with('Alimento')->findAll('id_subdieta='.$modelsubdieta->id.' and tipo_alimento!=7');
				if (count($dietadet)>=1){
			for($a=0;$a<count($dietadet);$a++){
				$dietadet[$a]->delete();
			}
		}

		 $preciodieta0= DietaSubdieta::model()->findBySql('select sum(round( CAST(float8 (total::numeric) as numeric), 2)) as suma from dieta_subdieta where id_dieta='.$iddieta.'');


			$preciodietapremio= DietaDetalle::model()->findBySql('select sum(round( CAST(float8 (dieta_detalle.precio_gramos::numeric) as numeric), 2)) as suma from dieta_detalle,alimento where  alimento.tipo_alimento in (7) and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.'');
		
			 $dieta= Dieta::model()->find('id='.$iddieta);
			 $dieta->precio_diario=$preciodieta0->suma;
	        // $dieta->dias=$_POST['DietaDetalle']['dias'];
	 		 $dieta->precio_dias=$preciodieta0->suma+$preciodietapremio->suma;
			 $dieta->iva=12;
		     $dieta->monto_iva=($preciodieta0->suma*0.12)+($preciodietapremio->suma*0.12);
			 $dieta->precio_total=($preciodieta0->suma+$preciodieta0->suma*0.12)+($preciodietapremio->suma+$preciodietapremio->suma*0.12);
			 $dieta->save();	   
               
                        Yii::app()->user->setFlash('success', "El Alimento <strong></strong> ha sido eliminado exitosamente.");
                        $this->redirect(array('dieta/update/','id'=>$iddieta)); 

                }
}
