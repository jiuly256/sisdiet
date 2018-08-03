<?php
/* @var $this EntradaAlmacenController */
/* @var $model EntradaAlmacen */

$this->breadcrumbs=array(
	'Entrada Almacens'=>array('index'),
	$model->id,
);

$this->menu=array(
	// array('label'=>'List EntradaAlmacen', 'url'=>array('index')),
	// array('label'=>'Create EntradaAlmacen', 'url'=>array('create')),
	// array('label'=>'Update EntradaAlmacen', 'url'=>array('update', 'id'=>$model->id)),
	// array('label'=>'Delete EntradaAlmacen', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Entrada Almacen', 'url'=>array('admin')),
);
?>

<h1>Compra #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'fecha',
		'observacion',
	),
)); ?>
