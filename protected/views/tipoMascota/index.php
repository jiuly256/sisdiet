<?php
$this->breadcrumbs=array(
	'Tipo Mascotas',
);

$this->menu=array(
	array('label'=>'Create TipoMascota','url'=>array('create')),
	array('label'=>'Manage TipoMascota','url'=>array('admin')),
);
?>

<h1>Tipo Mascotas</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
