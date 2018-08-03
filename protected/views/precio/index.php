<?php
$this->breadcrumbs=array(
	'Precios',
);

$this->menu=array(
	array('label'=>'Create Precio','url'=>array('create')),
	array('label'=>'Manage Precio','url'=>array('admin')),
);
?>

<h1>Precios</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
