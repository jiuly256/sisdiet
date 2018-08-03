<?php
/* @var $this TipoAlimentoController */
/* @var $model TipoAlimento */

$this->breadcrumbs=array(
	'Tipo Alimentos'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List TipoAlimento', 'url'=>array('index')),
	array('label'=>'Create TipoAlimento', 'url'=>array('create')),
	array('label'=>'View TipoAlimento', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage TipoAlimento', 'url'=>array('admin')),
);
?>

<h1>Update TipoAlimento <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>