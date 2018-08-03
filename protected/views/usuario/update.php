<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
//	array('label'=>'List Usuario','url'=>array('index')),
//	array('label'=>'Create Usuario','url'=>array('create')),
//	array('label'=>'View Usuario','url'=>array('view','id'=>$model->id)),
	array('label'=>'Listar usuario','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Actualizar Usuario <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>