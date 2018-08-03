<?php
/* @var $this FacturaController */
/* @var $model Factura */

$this->breadcrumbs=array(
	'Facturas'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'Registrar Dieta','url'=>array('dietaDetalle/create')),
	array('label'=>'Actualizar Dieta','url'=>array('dieta/update','id'=>$model->id_dieta)),
	array('label'=>'Dieta','url'=>array('dieta/admin')),
);
?>

<!-- <h1>Create Factura</h1>
 -->
<?php $this->renderPartial('_form', array('model'=>$model)); ?>