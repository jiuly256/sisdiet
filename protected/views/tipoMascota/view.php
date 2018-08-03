<?php
$this->breadcrumbs=array(
	'Tipo Mascotas'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List TipoMascota','url'=>array('index')),
	array('label'=>'Create TipoMascota','url'=>array('create')),
	array('label'=>'Update TipoMascota','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete TipoMascota','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage TipoMascota','url'=>array('admin')),
);
?>

<h1>View TipoMascota #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'descripicion',
	),
)); ?>
