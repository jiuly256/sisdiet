<?php
$this->breadcrumbs=array(
	'Mascotas'=>array('index'),
	'Create',
);

$this->menu=array(
//	array('label'=>'List Mascota','url'=>array('index')),
	array('label'=>'Listar mascota','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Registrar Mascota</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>