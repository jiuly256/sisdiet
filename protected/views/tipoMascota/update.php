<?php
$this->breadcrumbs=array(
	'Tipo Mascotas'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List TipoMascota','url'=>array('index')),
	array('label'=>'Create TipoMascota','url'=>array('create')),
	array('label'=>'View TipoMascota','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage TipoMascota','url'=>array('admin')),
);
?>

<h1>Update TipoMascota <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>