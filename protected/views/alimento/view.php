<?php
$this->breadcrumbs=array(
	'Alimentos'=>array('index'),
	$model->id,
);

$this->menu=array(
	// array('label'=>'List Alimento','url'=>array('index')),
	// array('label'=>'Create Alimento','url'=>array('create')),
	// array('label'=>'Update Alimento','url'=>array('update','id'=>$model->id)),
	// array('label'=>'Delete Alimento','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Alimento','url'=>array('admin')),
);
?>

<h1>Alimento #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'descripcion',
		'tipo_alimento',
	),
)); ?>
