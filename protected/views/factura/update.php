<?php
/* @var $this FacturaController */
/* @var $model Factura */

$this->breadcrumbs=array(
	'Facturas'=>array('index'),
	$model->id_factura=>array('view','id'=>$model->id_factura),
	'Update',
);

$this->menu=array(
	array('label'=>'List Factura', 'url'=>array('index')),
	array('label'=>'Create Factura', 'url'=>array('create')),
	array('label'=>'View Factura', 'url'=>array('view', 'id'=>$model->id_factura)),
	array('label'=>'Manage Factura', 'url'=>array('admin')),
);
?>

<h1>Update Factura <?php echo $model->id_factura; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>