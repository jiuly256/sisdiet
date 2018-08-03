<?php
/* @var $this TipoAlimentoController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Tipo Alimentos',
);

$this->menu=array(
	array('label'=>'Create TipoAlimento', 'url'=>array('create')),
	array('label'=>'Manage TipoAlimento', 'url'=>array('admin')),
);
?>

<h1>Tipo Alimentos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
