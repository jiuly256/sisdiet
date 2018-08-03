<?php
$this->breadcrumbs=array(
	'Clientes'=>array('index'),
	$model->id,
);

$this->menu=array(
//	array('label'=>'List Cliente','url'=>array('index')),
//	array('label'=>'Create Cliente','url'=>array('create')),
//	array('label'=>'Update Cliente','url'=>array('update','id'=>$model->id)),
//	array('label'=>'Delete Cliente','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Listar clientes','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Cliente #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'cedula',
		'nombre',
		'apellido',
		'Sexoid.descripcion',
		'direccion',
		'telefono',
		'telefono_casa',
		'correo_electronico',
//		'created_date',
//		'modified_date',
//		'created_by',
//		'modified_by',
	),
)); ?>
