<?php
$this->breadcrumbs=array(
	'Porcions'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Porcion','url'=>array('index')),
	array('label'=>'Create Porcion','url'=>array('create')),
	array('label'=>'Update Porcion','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Porcion','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Porcion','url'=>array('admin')),
);
?>

<h1>View Porcion #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_peso',
		'id_edad',
		'cantidad_gramos',
		'porcentaje_grasa',
		'porcentaje_proteina',
		'porcentaje_vegetal',
	),
)); ?>
