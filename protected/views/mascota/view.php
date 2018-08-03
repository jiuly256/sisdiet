<?php
$this->breadcrumbs=array(
	'Mascotas'=>array('index'),
	$model->id_mascota,
);

$this->menu=array(
//	array('label'=>'List Mascota','url'=>array('index')),
//	array('label'=>'Create Mascota','url'=>array('create')),
//	array('label'=>'Update Mascota','url'=>array('update','id'=>$model->id_mascota)),
//	array('label'=>'Delete Mascota','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id_mascota),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Listar mascota','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Mascota #<?php echo $model->id_mascota; ?></h1>
<?php $cliente=$model->nombrecompleto($model->id_cliente);
?>
<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id_mascota',
		 array(
           'header'=>'Cliente',
            'name'=>'cliente',
            'value'=>$cliente
                    ),
		'nombre',
		'idTipo.descripcion',
		'idRaza.descripcion',
		'fecha_nacimiento',
		//'edad',
		'idClasificacion.tipo',
		'idSexo.descripcion',
		'color',
		'idSino.descripcion',
		'longitud',
		'idMedida.descripcion',
		'peso',
		'idMedida2.descripcion',
		'foto',
		'observacion',
//		'created_date',
//		'modified_date',
//		'created_by',
//		'modified_by',
	),
)); ?>
