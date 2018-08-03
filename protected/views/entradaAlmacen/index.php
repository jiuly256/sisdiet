<?php
/* @var $this EntradaAlmacenController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Entrada Almacens',
);

$this->menu=array(
	array('label'=>'Create EntradaAlmacen', 'url'=>array('create')),
	array('label'=>'Manage EntradaAlmacen', 'url'=>array('admin')),
);
?>

<h1>Entrada Almacens</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
