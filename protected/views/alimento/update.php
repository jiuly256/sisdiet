<?php
$this->breadcrumbs=array(
	'Alimentos'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	// array('label'=>'List Alimento','url'=>array('index')),
	// array('label'=>'Create Alimento','url'=>array('create')),
	// array('label'=>'View Alimento','url'=>array('view','id'=>$model->id)),
	array('label'=>'Alimento','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Actualizar Alimento <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>