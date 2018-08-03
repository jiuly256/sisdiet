<?php
$this->breadcrumbs=array(
	'Raza Mascotas'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List RazaMascota','url'=>array('index')),
	array('label'=>'Manage RazaMascota','url'=>array('admin')),
);
?>

<h1>Create RazaMascota</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>