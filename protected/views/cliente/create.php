<?php
$this->breadcrumbs=array(
	'Clientes'=>array('index'),
	'Create',
);

$this->menu=array(
//	array('label'=>'List Cliente','url'=>array('index')),
	array('label'=>'Listar cliente','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Crear Cliente</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>