<?php
/* @var $this EntradaAlmacenController */
/* @var $model EntradaAlmacen */

$this->breadcrumbs=array(
	'Entrada Almacens'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	// array('label'=>'List EntradaAlmacen', 'url'=>array('index')),
	// array('label'=>'Create EntradaAlmacen', 'url'=>array('create')),
	// array('label'=>'View EntradaAlmacen', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Entrada almacen', 'url'=>array('admin')),
);
?>

<h1 style="text-align: center">Actualizar Compra<?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>