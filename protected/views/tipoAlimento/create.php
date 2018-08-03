<?php
/* @var $this TipoAlimentoController */
/* @var $model TipoAlimento */

$this->breadcrumbs=array(
	'Tipo Alimentos'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List TipoAlimento', 'url'=>array('index')),
	array('label'=>'Manage TipoAlimento', 'url'=>array('admin')),
);
?>

<h1>Create TipoAlimento</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>