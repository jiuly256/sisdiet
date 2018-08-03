<?php
$this->breadcrumbs=array(
	'Dietas'=>array('index'),
	'Create',
);

$this->menu=array(
	//array('label'=>'List Dieta','url'=>array('index')),
	array('label'=>'Dieta','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Registrar Dieta</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>