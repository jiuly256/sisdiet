<?php
$this->breadcrumbs=array(
	'Mascotas',
);

$this->menu=array(
	array('label'=>'Create Mascota','url'=>array('create')),
	array('label'=>'Manage Mascota','url'=>array('admin')),
);
?>

<h1>Mascotas</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
