<?php
$this->breadcrumbs=array(
	'Dieta Detalles'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
//	array('label'=>'List DietaDetalle','url'=>array('index')),
//	array('label'=>'Create DietaDetalle','url'=>array('create')),
//	array('label'=>'View DietaDetalle','url'=>array('view','id'=>$model->id)),
//	array('label'=>'Manage DietaDetalle','url'=>array('admin')),
);
?>

<h1>Update DietaDetalle <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>