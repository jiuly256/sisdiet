<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	$model->id,
);

$this->menu=array(
//	array('label'=>'List Usuario','url'=>array('index')),
//	array('label'=>'Create Usuario','url'=>array('create')),
//	array('label'=>'Update Usuario','url'=>array('update','id'=>$model->id)),
//	array('label'=>'Delete Usuario','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Listar usuarios','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Usuario #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'username',
		'password',
		'int_cedula',
		'str_nombre',
		'str_apellido',
		/*'blnborrado',
		'created_date',
		'modified_date',
		'created_by',
		'modified_by',
		'id_perfil',
                 */
	),
)); ?>
