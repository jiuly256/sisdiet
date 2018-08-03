<?php
$this->breadcrumbs=array(
	'Clientes'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
//	array('label'=>'List Cliente','url'=>array('index')),
//	array('label'=>'Create Cliente','url'=>array('create')),
//	array('label'=>'View Cliente','url'=>array('view','id'=>$model->id)),
	array('label'=>'Listar cliente','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Actualizar Cliente <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>