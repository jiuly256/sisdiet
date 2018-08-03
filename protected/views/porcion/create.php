<?php
$this->breadcrumbs=array(
	'Porcions'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Porcion','url'=>array('index')),
	array('label'=>'Manage Porcion','url'=>array('admin')),
);
?>

<h1>Create Porcion</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>