<?php
$this->breadcrumbs=array(
	'Dieta Detalles',
);

$this->menu=array(
	array('label'=>'Create DietaDetalle','url'=>array('create')),
	array('label'=>'Manage DietaDetalle','url'=>array('admin')),
);
?>

<h1>Dieta Detalles</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
