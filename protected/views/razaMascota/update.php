<?php
$this->breadcrumbs=array(
	'Raza Mascotas'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List RazaMascota','url'=>array('index')),
	array('label'=>'Create RazaMascota','url'=>array('create')),
	array('label'=>'View RazaMascota','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage RazaMascota','url'=>array('admin')),
);
?>

<h1>Update RazaMascota <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>