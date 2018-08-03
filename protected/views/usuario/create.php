<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	'Create',
);

$this->menu=array(
//	array('label'=>'List Usuario','url'=>array('index')),
	array('label'=>'Usuarios','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Crear Usuario</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>