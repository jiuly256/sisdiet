<?php
/* @var $this EntradaAlmacenController */
/* @var $model EntradaAlmacen */

$this->breadcrumbs=array(
	'Entrada Almacens'=>array('index'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List EntradaAlmacen', 'url'=>array('index')),
	array('label'=>'Entrada Almacen', 'url'=>array('admin')),
);
?>

<h1 style="text-align: center">Registrar Compra</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>