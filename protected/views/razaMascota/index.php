<?php
$this->breadcrumbs=array(
	'Raza Mascotas',
);

$this->menu=array(
	array('label'=>'Create RazaMascota','url'=>array('create')),
	array('label'=>'Manage RazaMascota','url'=>array('admin')),
);
?>

<h1>Raza Mascotas</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
