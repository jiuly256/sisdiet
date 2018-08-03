<?php
$this->breadcrumbs=array(
	'Alimentos'=>array('index'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List Alimento','url'=>array('index')),
	array('label'=>'Alimentos','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Registrar Alimento</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>