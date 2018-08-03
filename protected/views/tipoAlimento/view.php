<?php
/* @var $this TipoAlimentoController */
/* @var $model TipoAlimento */

$this->breadcrumbs=array(
	'Tipo Alimentos'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List TipoAlimento', 'url'=>array('index')),
	array('label'=>'Create TipoAlimento', 'url'=>array('create')),
	array('label'=>'Update TipoAlimento', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete TipoAlimento', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage TipoAlimento', 'url'=>array('admin')),
);
?>

<h1>View TipoAlimento #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'descripcion',
	),
)); ?>
