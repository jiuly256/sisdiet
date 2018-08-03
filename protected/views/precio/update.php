<?php
$this->breadcrumbs=array(
	'Precios'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Precio','url'=>array('index')),
	array('label'=>'Create Precio','url'=>array('create')),
	array('label'=>'View Precio','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage Precio','url'=>array('admin')),
);
?>

<h1>Update Precio <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>