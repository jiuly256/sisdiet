<?php
$this->breadcrumbs=array(
	'Mascotas'=>array('index'),
	$model->id_mascota=>array('view','id'=>$model->id_mascota),
	'Update',
);

$this->menu=array(
//	array('label'=>'List Mascota','url'=>array('index')),
	array('label'=>'Registrar Mascota','url'=>array('create')),
	array('label'=>'Ver Mascota','url'=>array('view','id'=>$model->id_mascota)),
	array('label'=>'Listar mascota','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Actualizar registro Mascota <?php echo $model->id_mascota; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>