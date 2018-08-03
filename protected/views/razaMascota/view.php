<?php
$this->breadcrumbs=array(
	'Raza Mascotas'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List RazaMascota','url'=>array('index')),
	array('label'=>'Create RazaMascota','url'=>array('create')),
	array('label'=>'Update RazaMascota','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete RazaMascota','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage RazaMascota','url'=>array('admin')),
);
?>

<h1>View RazaMascota #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_tipo',
		'descripcion',
		'foto',
	),
)); ?>
