<?php
$this->breadcrumbs=array(
	'Tipo Mascotas'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List TipoMascota','url'=>array('index')),
	array('label'=>'Manage TipoMascota','url'=>array('admin')),
);
?>

<h1>Create TipoMascota</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>