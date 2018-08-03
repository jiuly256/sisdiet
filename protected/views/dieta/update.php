<?php
$this->breadcrumbs=array(
	'Dietas'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
//	array('label'=>'List Dieta','url'=>array('index')),
//	array('label'=>'Create Dieta','url'=>array('create')),
	array('label'=>'Ver Dieta','url'=>array('view','id'=>$model->id)),
	array('label'=>'Dieta','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Actualizar Dieta <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>