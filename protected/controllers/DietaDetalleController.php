<?php

class DietaDetalleController extends Controller
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
				'actions'=>array('create','update','create2'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','autocomplete','verprecio','eliminar','verprecio2'),
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
    'nombre_mascota'=>$item->nombre_mascota,
    'cliente'=>$item->nombre.' '.$item->apellido,
    'porcion'=>$item->porcion.' Gr',
    'descripcion'=>$item->descripcion,
    'peso'=>$item->peso,
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

 
 echo CJSON::encode($arr);
 // CJSON::encode();
}
	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */


public function actionVerprecio() {
$resultado = "";
$resultado1 = "";
$acum_preciovegetal=0;
$acum_preciopremiototal=0;
$acum_precioenvasetotal=0;
$porcion=$_POST['DietaDetalle']['porcion'];
$dias = $_POST["DietaDetalle"]["dias"];
$proteina = $_POST["DietaDetalle"]["id_alimento"];
$vegetal=$_POST['DietaDetalle']['cuenta_descripcion'];
$totalvegetales=count($_POST['DietaDetalle']['cuenta_descripcion'],1);


//validaciones 
 if ($porcion==null){

echo "Debe seleccionar una <b>Mascota</b>"; exit;
}
 else if ($proteina==null){

echo "Debe seleccionar una <b>Proteína</b>"; exit;
}
else if ($vegetal==null){

echo "Debe seleccionar al menos un <b>Vegetal</b>"; exit;
}

else{
 
 $resultado1="<tr>
            <th colspan='5' style='text-align:center'>DETALLE</th>
        </tr> ";	

 $resultado1.="<tr>
            <th >Nombre Alimento</th>
            <th >Cantidad en Gramos</th>
            <th >Costo por Gr</th>
            <th >Total BS</th>
            <th >Total por dias BS</th>
          
        </tr> ";


$array = Alimento::model()->find('id='.$proteina);
//echo "<pre>"; print_r($array); exit;
if ($proteina == $array->id)
{
		
			$proteina_gramos=($porcion*0.70);
			$proteina_gramosf=number_format($proteina_gramos,2,',','.');
			$precio= Vistaprecios::model()->find('id_alimento='.$proteina.'');
			$precio_gramo= $precio->precio_venta_gramo; 
		    $precio_total=($proteina_gramos*$precio_gramo);	
		    $precioxdia= $precio_total*$dias;

$resultado1.="<tr >
         <td >".$array->descripcion."</td>
         <td >$proteina_gramosf</td>
         <td >".number_format($precio_gramo,2,",",".")."</td>
         <td >".number_format($precio_total,2,",",".")."</td>
         <td ><b>".number_format($precioxdia,2,",",".")."</b></td>
     </tr> "	;
}

			 $total=count($_POST['DietaDetalle']['cuenta_descripcion'],1);
			for ($i=0;$i<$total;$i++){

			 	$porcentaje=0.30;
			 	$porc=($porcentaje/$total);

			 	$proteina_gramos_veg=($porcion*$porc);
			 	$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['cuenta_descripcion'][$i].'');
	
			 	$precio_gramo_veg= $precio->precio_venta_gramo; 
			 	$precio_total_veg=$proteina_gramos_veg*$precio_gramo_veg;
			 	$precioxdia_veg= $precio_total_veg*$dias;
		
		$array1 = Alimento::model()->find('id='.$_POST['DietaDetalle']['cuenta_descripcion'][$i]);	  

		  $resultado1.="<tr >
         <td >".$array1->descripcion."</td>
         <td >".number_format($proteina_gramos_veg,2,",",".")."</td>
         <td >".number_format($precio_gramo_veg,2,",",".")."</td>
         <td >".number_format($precio_total_veg,2,",",".")."</td>
         <td ><b>".number_format($precioxdia_veg,2,",",".")."</b></td>
    	 </tr> ";

    	 $acum_preciovegetal+=$precioxdia_veg;

			 }

if (isset($_POST['DietaDetalle']['envase'])){
	$envase=$_POST['DietaDetalle']['envase'];
foreach ($envase as $nomb => $val) {
 //echo "$nombre1: $valor1\n"; exit;

		$array3 = Alimento::model()->find('id='.$_POST['DietaDetalle']['envase'][$nomb]);	

		$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['envase'][$nomb].'');
			$cantidade=$_POST['DietaDetalle']['envase_cantidad_'.$nomb];
			$precioenvase= $precio->precio_venta; 
			$precioenvasetotal=$precioenvase*$cantidade;

	  $resultado1.="<tr >
         <td >".$array3->descripcion."</td>
         <td >".$cantidade."</td>
         <td ></td>
         <td >".$precioenvase."</td>
         <td ><b>".number_format($precioenvasetotal,2,",",".")."</b></td>
    	 </tr> ";

    	 $acum_precioenvasetotal+=$precioenvasetotal;
			
}
}
else {
$envase="";
$totalenvase=0;
$precioenvasetotal=0;
$acum_precioenvasetotal=0;

}	


		$subtotalv=$acum_preciovegetal+$precioxdia+$acum_precioenvasetotal;	 
		$subtotal=number_format($subtotalv,2,",",".");	 
		$subtotalivav=$subtotalv*0.12;	
		$subtotaliva=number_format($subtotalivav,2,",","."); 
		$totalformato=number_format($subtotalv+$subtotalivav,2,",",".");	

		 $resultado.="<tr >
         <td >DIETA NUTRIPETS</td>
         <td >1</td>
         <td >".$dias."</td>
         <td >".number_format(($subtotalv/$dias),2,",",".")."</td>
         <td ><b>".$subtotal."</b></td>
    	 </tr> ";	

	$resultado1.="<tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>".$subtotal."</b></td>
    	 </tr> ";	


if (isset($_POST['DietaDetalle']['premio'])){
$premio=$_POST['DietaDetalle']['premio'];

foreach ($premio as $nombre => $valor) {
   $array2 = Alimento::model()->find('id='.$_POST['DietaDetalle']['premio'][$nombre]);	  

	$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['premio'][$nombre].'');
      $cantidad=$_POST['DietaDetalle']['premio_cantidad_'.$nombre];
		$preciopremio= $precio->precio_venta; 
		$preciopremiototal=$preciopremio*$cantidad;
		  $resultado.="<tr >
         <td >".$array2->descripcion."</td>
         <td >".$cantidad."</td>
         <td ></td>
         <td >".$preciopremio."</td>
         <td ><b>".number_format($preciopremiototal,2,",",".")."</b></td>
    	 </tr> ";

    	 $acum_preciopremiototal+=$preciopremiototal;
}
}
else {
$premio="";
$totalpremio=0;
$preciopremiototal=0;
$acum_preciopremiototal=0;

}	

    	$subt=$subtotalv+$acum_preciopremiototal;	 
		$subtf=number_format($subt,2,",",".");	 
		$subtotalivav=round($subt*0.12,2);
		$subtotaliva=number_format($subtotalivav,2,",","."); 
		$totalformato=number_format($subt+$subtotalivav,2,",",".");	

  		$resultado.="<tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Sub-total</b></td>
         <td ><b>".$subtf."</b></td>
              
        </tr> 
            <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Iva 12 %</b></td>
         <td ><b>".$subtotaliva."</b></td>
              
        </tr>
             <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Total a pagar</b></td>
         <td ><b>".$totalformato."</b></td>
              
        </tr>";

if($resultado == "")
{
echo "El nombre ".$nombre." <b>NO</b> se encuentra en la base de datos<br><br>";
}

else
{


echo $resultado.$resultado1;
}
}
    }

public function actionVerprecio2() {
$resultado = "";
$resultado1 = "";
$acum_preciovegetal=0;
$acum_preciopremiototal=0;
$acum_precioenvasetotal=0;
$porcion=$_POST['DietaDetalle']['porcion'];
$dias = $_POST["DietaDetalle"]["dias"];
$proteina = $_POST["DietaDetalle"]["id_alimento"];
$vegetal=$_POST['DietaDetalle']['cuenta_descripcion'];
$totalvegetales=count($_POST['DietaDetalle']['cuenta_descripcion'],1);


//validaciones 
 if ($porcion==null){

echo "Debe seleccionar una <b>Mascota</b>"; exit;
}
 else if ($proteina==null){

echo "Debe seleccionar una <b>Proteína</b>"; exit;
}
else if ($vegetal==null){

echo "Debe seleccionar al menos un <b>Vegetal</b>"; exit;
}

else{
 
 $resultado1="<tr>
            <th colspan='5' style='text-align:center'>DETALLE</th>
        </tr> ";	

 $resultado1.="<tr>
            <th >Nombre Alimento</th>
            <th >Cantidad en Gramos</th>
            <th >Costo por Gr</th>
            <th >Total BS</th>
            <th >Total por dias BS</th>
          
        </tr> ";


$array = Alimento::model()->find('id='.$proteina);
//echo "<pre>"; print_r($array); exit;
if ($proteina == $array->id)
{
		
			$proteina_gramos=($porcion*0.70);
			$proteina_gramosf=number_format($proteina_gramos,2,',','.');
			$precio= Vistaprecios::model()->find('id_alimento='.$proteina.'');
			$precio_gramo= $precio->precio_venta_gramo; 
		    $precio_total=($proteina_gramos*$precio_gramo);	
		    $precioxdia= $precio_total*$dias;

$resultado1.="<tr >
         <td >".$array->descripcion."</td>
         <td >$proteina_gramosf</td>
         <td >".number_format($precio_gramo,2,",",".")."</td>
         <td >".number_format($precio_total,2,",",".")."</td>
         <td ><b>".number_format($precioxdia,2,",",".")."</b></td>
     </tr> "	;
}

			 $total=count($_POST['DietaDetalle']['cuenta_descripcion'],1);
			for ($i=0;$i<$total;$i++){

			 	$porcentaje=0.30;
			 	$porc=($porcentaje/$total);

			 	$proteina_gramos_veg=($porcion*$porc);
			 	$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['cuenta_descripcion'][$i].'');
	
			 	$precio_gramo_veg= $precio->precio_venta_gramo; 
			 	$precio_total_veg=$proteina_gramos_veg*$precio_gramo_veg;
			 	$precioxdia_veg= $precio_total_veg*$dias;
		
		$array1 = Alimento::model()->find('id='.$_POST['DietaDetalle']['cuenta_descripcion'][$i]);	  

		  $resultado1.="<tr >
         <td >".$array1->descripcion."</td>
         <td >".number_format($proteina_gramos_veg,2,",",".")."</td>
         <td >".number_format($precio_gramo_veg,2,",",".")."</td>
         <td >".number_format($precio_total_veg,2,",",".")."</td>
         <td ><b>".number_format($precioxdia_veg,2,",",".")."</b></td>
    	 </tr> ";

    	 $acum_preciovegetal+=$precioxdia_veg;

			 }

if (isset($_POST['DietaDetalle']['envase'])){
	$envase=$_POST['DietaDetalle']['envase'];
foreach ($envase as $nomb => $val) {
 //echo "$nombre1: $valor1\n"; exit;

		$array3 = Alimento::model()->find('id='.$_POST['DietaDetalle']['envase'][$nomb]);	

		$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['envase'][$nomb].'');
			$cantidade=$_POST['DietaDetalle']['envase_cantidad_'.$nomb];
			$precioenvase= $precio->precio_venta; 
			$precioenvasetotal=$precioenvase*$cantidade;

	  $resultado1.="<tr >
         <td >".$array3->descripcion."</td>
         <td >".$cantidade."</td>
         <td ></td>
         <td >".$precioenvase."</td>
         <td ><b>".number_format($precioenvasetotal,2,",",".")."</b></td>
    	 </tr> ";

    	 $acum_precioenvasetotal+=$precioenvasetotal;
			
}
}
else {
$envase="";
$totalenvase=0;
$precioenvasetotal=0;
$acum_precioenvasetotal=0;

}	


		$subtotalv=$acum_preciovegetal+$precioxdia+$acum_precioenvasetotal;	 
		$subtotal=number_format($subtotalv,2,",",".");	 
		$subtotalivav=$subtotalv*0.12;	
		$subtotaliva=number_format($subtotalivav,2,",","."); 
		$totalformato=number_format($subtotalv+$subtotalivav,2,",",".");	

		 $resultado.="<tr >
         <td >DIETA NUTRIPETS</td>
         <td >1</td>
         <td >".$dias."</td>
         <td >".number_format(($subtotalv/$dias),2,",",".")."</td>
         <td ><b>".$subtotal."</b></td>
    	 </tr> ";	

	$resultado1.="<tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>".$subtotal."</b></td>
    	 </tr> ";	


if (isset($_POST['DietaDetalle']['premio'])){
$premio=$_POST['DietaDetalle']['premio'];

foreach ($premio as $nombre => $valor) {
   $array2 = Alimento::model()->find('id='.$_POST['DietaDetalle']['premio'][$nombre]);	  

	$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['premio'][$nombre].'');
      $cantidad=$_POST['DietaDetalle']['premio_cantidad_'.$nombre];
		$preciopremio= $precio->precio_venta; 
		$preciopremiototal=$preciopremio*$cantidad;
		  $resultado.="<tr >
         <td >".$array2->descripcion."</td>
         <td >".$cantidad."</td>
         <td ></td>
         <td >".$preciopremio."</td>
         <td ><b>".number_format($preciopremiototal,2,",",".")."</b></td>
    	 </tr> ";

    	 $acum_preciopremiototal+=$preciopremiototal;
}
}
else {
$premio="";
$totalpremio=0;
$preciopremiototal=0;
$acum_preciopremiototal=0;

}	

    	$subt=$subtotalv+$acum_preciopremiototal;	 
		$subtf=number_format($subt,2,",",".");	 
		$subtotalivav=round($subt*0.12,2);
		$subtotaliva=number_format($subtotalivav,2,",","."); 
		$totalformato=number_format($subt+$subtotalivav,2,",",".");	

  		$resultado.="<tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Sub-total</b></td>
         <td ><b>".$subtf."</b></td>
              
        </tr> 
            <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Iva 12 %</b></td>
         <td ><b>".$subtotaliva."</b></td>
              
        </tr>
             <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Total a pagar</b></td>
         <td ><b>".$totalformato."</b></td>
              
        </tr>";

if($resultado == "")
{
echo "El nombre ".$nombre." <b>NO</b> se encuentra en la base de datos<br><br>";
}

else
{


echo $resultado.$resultado1;
}
}
    }    

  

	public function actionCreate()
	{
		$model=new DietaDetalle;
		$model->scenario='crear';

			// if it is ajax validation request
		$this->performAjaxValidation($model);

		if(isset($_POST['DietaDetalle']))
		{

			
			$model->attributes=$_POST['DietaDetalle'];
	if($model->validate())
	{
		

 			  if ($_POST['DietaDetalle']['id_alimento']==''){
                        Yii::app()->user->setFlash('error','<b>Proteínas</b> no puede ser vacio');
                        $this->redirect(array('dietaDetalle/create/'));
                    }

                      else if 
                    	($_POST['DietaDetalle']['cuenta_descripcion']==''){
                        Yii::app()->user->setFlash('error','<b>Vegetales-Complementos</b> no puede ser vacio');
                        $this->redirect(array('dietaDetalle/create/'));
                    }
                    

            $dieta0=new Dieta;
            $dieta0->fecha=$_POST['DietaDetalle']['fecha'];
			$dieta0->id_cliente=$_POST['DietaDetalle']['id_cliente'];
			$dieta0->id_mascota=$_POST['DietaDetalle']['id_mascota'];
			$dieta0->save();
        
			$iddieta=$dieta0->id;

			$dietasub0=new DietaSubdieta;
            $dietasub0->descripcion='DIETA NUTRIPETS';
			$dietasub0->id_dieta=$iddieta;
			$dietasub0->save();


			$iddietasub=$dietasub0->id;

	    	$sql= Vistadetalle::model()->find('id='.$iddieta);
		
			$porcentajep=($sql->porcentaje_proteina/100);
			$porcentajev=($sql->porcentaje_vegetal/100);

			$porcion=$sql->porcion;
			$proteina_gramos=($porcion*0.70);
			$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['id_alimento'].'');
			$precio_gramo= $precio->precio_venta_gramo; 
		    $precio_total=($proteina_gramos*$precio_gramo);

		    $model->id_dieta=$iddieta;
		    $model->id_alimento=$_POST['DietaDetalle']['id_alimento'];
		    $model->cantidad_gramos=$proteina_gramos;
		    $model->costo_gramos=$precio_gramo;
		    $model->precio_gramos=$precio_total;
		    $model->id_subdieta=$iddietasub;
		

			$id=$iddieta;
 			$sql= Vistadetalle::model()->find('id='.$id.'');
		

			if($model->save()){
	
			$porcionveg=$sql->porcion;
			$total=count($_POST['DietaDetalle']['cuenta_descripcion'],1);
			for ($i=0;$i<$total;$i++){

				$porcentaje=0.30;
				$porc=($porcentaje/$total);

				$proteina_gramos_veg=($porcionveg*$porc);
				$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['cuenta_descripcion'][$i].'');
	
				$precio_gramo_veg= $precio->precio_venta_gramo; 
				$precio_total_veg=$proteina_gramos_veg*$precio_gramo_veg;
		
				$vegetales=new DietaDetalle;
				$vegetales->id_dieta=$iddieta;
		        $vegetales->id_alimento=$_POST['DietaDetalle']['cuenta_descripcion'][$i];
		        $vegetales->cantidad_gramos=$proteina_gramos_veg;
		        $vegetales->costo_gramos=$precio_gramo_veg;
		        $vegetales->precio_gramos=$precio_total_veg;
		        $vegetales->id_subdieta=$iddietasub;
		        $vegetales->save();


			}

			if (isset($_POST['DietaDetalle']['premio'])){
			$premio=$_POST['DietaDetalle']['premio'];
					foreach ($premio as $key => $value) {
					
				$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['premio'][$key].'');
	
				$preciopremio= $precio->precio_venta; 
						
				$premio=new DietaDetalle;
				$premio->id_dieta=$iddieta;
		        $premio->id_alimento=$_POST['DietaDetalle']['premio'][$key];
		        $premio->cantidad_gramos=$_POST['DietaDetalle']['premio_cantidad_'.$key];
		        $premio->costo_gramos=$preciopremio;
		        $premio->precio_gramos=$preciopremio*$_POST['DietaDetalle']['premio_cantidad_'.$key];
		        $premio->id_subdieta=$iddietasub;
		        $premio->save();


			}
		}

			if (isset($_POST['DietaDetalle']['envase'])){
			$envase=$_POST['DietaDetalle']['envase'];
			foreach ($envase as $key => $value) {

				$precioe= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['envase'][$key].'');
	
				$precioenvase= $precioe->precio_venta; 
						
				$envase=new DietaDetalle;
				$envase->id_dieta=$iddieta;
		        $envase->id_alimento=$_POST['DietaDetalle']['envase'][$key];
		        $envase->cantidad_gramos=$_POST['DietaDetalle']['envase_cantidad_'.$key];
		        $envase->costo_gramos=$precioenvase;
		        $envase->precio_gramos=$precioenvase*$_POST['DietaDetalle']['envase_cantidad_'.$key];
		        $envase->id_subdieta=$iddietasub;
		        $envase->save();


			}
		}

			$preciodieta= DietaDetalle::model()->findBySql('select sum(dieta_detalle.precio_gramos) as suma from dieta_detalle,alimento where  alimento.tipo_alimento between 1 and 6  and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.'');

			$precioenvase= DietaDetalle::model()->findBySql('select sum(dieta_detalle.precio_gramos) as suma from dieta_detalle,alimento where  alimento.tipo_alimento=0 and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.'');

			 $dietasub= DietaSubdieta::model()->find('id_dieta='.$iddieta);
			 $dietasub->monto=(($preciodieta->suma*$_POST['DietaDetalle']['dias'])+$precioenvase->suma)/$_POST['DietaDetalle']['dias'];
	         $dietasub->dias=$_POST['DietaDetalle']['dias'];
	 		 $dietasub->total=($preciodieta->suma*$_POST['DietaDetalle']['dias'])+$precioenvase->suma;
			 $dietasub->save();

			 	$preciodieta0= DietaSubdieta::model()->findBySql('select sum(round( CAST(float8 (total::numeric) as numeric), 2)) as suma from dieta_subdieta where id_dieta='.$iddieta.'');


				$preciodietapremio= DietaDetalle::model()->findBySql('select sum(dieta_detalle.precio_gramos) as suma from dieta_detalle,alimento where  alimento.tipo_alimento in (7) and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.'');
		
			 $dieta= Dieta::model()->find('id='.$iddieta);
			 $dieta->precio_diario=$preciodieta0->suma;
	         $dieta->dias=$_POST['DietaDetalle']['dias'];
	 		 $dieta->precio_dias=$preciodieta0->suma+$preciodietapremio->suma;
			 $dieta->iva=12;
		     $dieta->monto_iva=($preciodieta0->suma*0.12)+($preciodietapremio->suma*0.12);
			 $dieta->precio_total=($preciodieta0->suma+$preciodieta0->suma*0.12)+($preciodietapremio->suma+$preciodietapremio->suma*0.12);
			 $dieta->save();			 
			
			$this->redirect(array('/dieta/view/','id'=>$iddieta));
		}
}
}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	public function actionCreate2()
	{
		$model=new DietaDetalle;
	

		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);

		if(isset($_POST['DietaDetalle']))
		{

			
			$model->attributes=$_POST['DietaDetalle'];

if($model->validate()){
//echo "<pre>"; print_r($_POST['DietaDetalle']); exit;
	//echo $model->id; exit;
 			if ($_POST['DietaDetalle']['id_alimento']==''){
                        Yii::app()->user->setFlash('error','<b>Proteínas</b> no puede ser vacio');
                        $this->redirect(array('dietaDetalle/create2/id2/'.$_POST['DietaDetalle']['id2']));
                    }

                      else if 
                    	($_POST['DietaDetalle']['cuenta_descripcion']==''){
                        Yii::app()->user->setFlash('error','<b>Vegetales-Complementos</b> no puede ser vacio');
                        $this->redirect(array('dietaDetalle/create2/id2/'.$_POST['DietaDetalle']['id2']));
                    }
 

			if($model->save()){


			$iddieta=$_POST['DietaDetalle']['id2'];

			$dietasub0=new DietaSubdieta;
            $dietasub0->descripcion='DIETA NUTRIPETS';
			$dietasub0->id_dieta=$iddieta;
			$dietasub0->save();

			$iddietasub=$dietasub0->id;

	    	$sql= Vistadetalle::model()->find('id='.$iddieta);
		
			$porcentajep=($sql->porcentaje_proteina/100);
			$porcentajev=($sql->porcentaje_vegetal/100);

			$porcion=$sql->porcion;
			$proteina_gramos=($porcion*0.70);
			$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['id_alimento'].'');
			$precio_gramo= $precio->precio_venta_gramo; 
		    $precio_total=($proteina_gramos*$precio_gramo);

		    $model->id_dieta=$iddieta;
		    $model->id_alimento=$_POST['DietaDetalle']['id_alimento'];
		    $model->cantidad_gramos=$proteina_gramos;
		    $model->costo_gramos=$precio_gramo;
		    $model->precio_gramos=$precio_total;
		    $model->id_subdieta=$iddietasub;
		    $model->save();
			$id=$iddieta;
 			$sql= Vistadetalle::model()->find('id='.$id.'');
		
	
			$porcionveg=$sql->porcion;
			$total=count($_POST['DietaDetalle']['cuenta_descripcion'],1);
			for ($i=0;$i<$total;$i++){

				$porcentaje=0.30;
				$porc=($porcentaje/$total);

				$proteina_gramos_veg=($porcionveg*$porc);
				$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['cuenta_descripcion'][$i].'');
	
				$precio_gramo_veg= $precio->precio_venta_gramo; 
				$precio_total_veg=$proteina_gramos_veg*$precio_gramo_veg;
		
				$vegetales=new DietaDetalle;
				$vegetales->id_dieta=$iddieta;
		        $vegetales->id_alimento=$_POST['DietaDetalle']['cuenta_descripcion'][$i];
		        $vegetales->cantidad_gramos=$proteina_gramos_veg;
		        $vegetales->costo_gramos=$precio_gramo_veg;
		        $vegetales->precio_gramos=$precio_total_veg;
		        $vegetales->id_subdieta=$iddietasub;
		        $vegetales->save();
			}


			if (isset($_POST['DietaDetalle']['premio'])){
			$premio=$_POST['DietaDetalle']['premio'];
					foreach ($premio as $key => $value) {
					
				$precio= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['premio'][$key].'');
	
				$preciopremio= $precio->precio_venta; 
						
				$premio=new DietaDetalle;
				$premio->id_dieta=$iddieta;
		        $premio->id_alimento=$_POST['DietaDetalle']['premio'][$key];
		        $premio->cantidad_gramos=$_POST['DietaDetalle']['premio_cantidad_'.$key];
		        $premio->costo_gramos=$preciopremio;
		        $premio->precio_gramos=$preciopremio*$_POST['DietaDetalle']['premio_cantidad_'.$key];
		        $premio->id_subdieta=$iddietasub;
		        $premio->save();


			}
		}

			if (isset($_POST['DietaDetalle']['envase'])){
			$envase=$_POST['DietaDetalle']['envase'];
			foreach ($envase as $key => $value) {

				$precioe= Vistaprecios::model()->find('id_alimento='.$_POST['DietaDetalle']['envase'][$key].'');
	
				$precioenvase= $precioe->precio_venta; 
						
				$envase=new DietaDetalle;
				$envase->id_dieta=$iddieta;
		        $envase->id_alimento=$_POST['DietaDetalle']['envase'][$key];
		        $envase->cantidad_gramos=$_POST['DietaDetalle']['envase_cantidad_'.$key];
		        $envase->costo_gramos=$precioenvase;
		        $envase->precio_gramos=$precioenvase*$_POST['DietaDetalle']['envase_cantidad_'.$key];
		        $envase->id_subdieta=$iddietasub;
		        $envase->save();


			}
		}
		
		//	$preciodieta= DietaDetalle::model()->findBySql('sselect sum(round( CAST(float8 (dieta_detalle.precio_gramos::numeric) as numeric), 2)) as suma from dieta_detalle,alimento where  alimento.tipo_alimento between 1 and 6  and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.' and id_subdieta='.$iddietasub );
			$preciodieta= DietaDetalle::model()->findBySql('select sum(dieta_detalle.precio_gramos) as suma from dieta_detalle,alimento where  alimento.tipo_alimento between 1 and 6  and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.' and id_subdieta='.$iddietasub.' ');

//echo "<pre>"; print_r($preciodieta); exit;

			$precioenvase= DietaDetalle::model()->findBySql('select sum(round( CAST(float8 (dieta_detalle.precio_gramos::numeric) as numeric), 2)) as suma from dieta_detalle,alimento where  alimento.tipo_alimento=0 and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.' and id_subdieta='.$iddietasub);

			 $dietasub= DietaSubdieta::model()->find('id='.$iddietasub);
			 $dietasub->monto=(($preciodieta->suma*$_POST['DietaDetalle']['dias'])+$precioenvase->suma)/$_POST['DietaDetalle']['dias'];
			// echo $dietasub->monto; exit;
	         $dietasub->dias=$_POST['DietaDetalle']['dias'];
	 		 $dietasub->total=($preciodieta->suma*$_POST['DietaDetalle']['dias'])+$precioenvase->suma;
			 $dietasub->save();

			 	$preciodieta0= DietaSubdieta::model()->findBySql('select sum(round( CAST(float8 (total::numeric) as numeric), 2)) as suma from dieta_subdieta where id_dieta='.$iddieta.'');


			$preciodietapremio= DietaDetalle::model()->findBySql('select sum(round( CAST(float8 (dieta_detalle.precio_gramos::numeric) as numeric), 2)) as suma from dieta_detalle,alimento where  alimento.tipo_alimento in (7) and alimento.id=dieta_detalle.id_alimento and id_dieta='.$iddieta.'');
		
			 $dieta= Dieta::model()->find('id='.$iddieta);
			 $dieta->precio_diario=$preciodieta0->suma;
	         $dieta->dias=$_POST['DietaDetalle']['dias'];
	 		 $dieta->precio_dias=$preciodieta0->suma+$preciodietapremio->suma;
			 $dieta->iva=12;
		     $dieta->monto_iva=($preciodieta0->suma*0.12)+($preciodietapremio->suma*0.12);
			 $dieta->precio_total=($preciodieta0->suma+$preciodieta0->suma*0.12)+($preciodietapremio->suma+$preciodietapremio->suma*0.12);
			 $dieta->save();			 
			
			$this->redirect(array('/dieta/view/','id'=>$iddieta));
		}
}
}

		$this->render('create2',array(
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

		if(isset($_POST['DietaDetalle']))
		{
			$model->attributes=$_POST['DietaDetalle'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
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
		$dataProvider=new CActiveDataProvider('DietaDetalle');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new DietaDetalle('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['DietaDetalle']))
			$model->attributes=$_GET['DietaDetalle'];

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
		$model=DietaDetalle::model()->findByPk($id);
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
		$model=$this->loadModel($id);
		$iddieta=$model->id_dieta;

		
		$this->loadModel($id)->delete();
        
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
