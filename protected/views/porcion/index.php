<?php
$this->breadcrumbs=array(
	'Porcions',
);

$this->menu=array(
	array('label'=>'Create Porcion','url'=>array('create')),
	array('label'=>'Manage Porcion','url'=>array('admin')),
);
?>

<h1>Porcions</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
