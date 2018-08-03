<?php
$this->breadcrumbs=array(
	'Alimentos',
);

$this->menu=array(
	array('label'=>'Create Alimento','url'=>array('create')),
	array('label'=>'Manage Alimento','url'=>array('admin')),
);
?>

<h1>Alimentos</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
