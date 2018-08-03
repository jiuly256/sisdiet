<?php
$this->breadcrumbs=array(
	'Dietas',
);

$this->menu=array(
	array('label'=>'Create Dieta','url'=>array('create')),
	array('label'=>'Manage Dieta','url'=>array('admin')),
);
?>

<h1>Dietas</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
