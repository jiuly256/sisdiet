<?php
$this->breadcrumbs=array(
	'Mascotas'=>array('index'),
	'Manage',
);

$this->menu=array(
//	array('label'=>'List Mascota','url'=>array('index')),
	array('label'=>'Registrar Mascota','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('mascota-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1 style="text-align: center">Mascotas</h1>

<?php
   $this->widget('bootstrap.widgets.TbAlert', array(
        'block'=>true, // display a larger alert block?
        'fade'=>true, // use transitions?
        'closeText'=>'&times;', // close link text - if set to false, no close link is displayed
        'alerts'=>array( // configurations per alert type
        'success'=>array('block'=>true, 'fade'=>true, 'Text'=>'&times;'), // success, info, warning, error or danger
        ),
    )); 
?>

<?php
   $this->widget('bootstrap.widgets.TbAlert', array(
        'block'=>true, // display a larger alert block?
        'fade'=>true, // use transitions?
        'closeText'=>'&times;', // close link text - if set to false, no close link is displayed
        'alerts'=>array( // configurations per alert type
        'error'=>array('block'=>true, 'fade'=>true, 'Text'=>'&times;'), // success, info, warning, error or danger
        ),
    )); 
?>
<?php $this->widget('bootstrap.widgets.TbGridView',array(
        'type'=>'bordered condensed',
        'itemsCssClass'=>'table table-hover',
	'id'=>'mascota-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		//'id_mascota',
		 array (//'header'=>'Cliente',
                'name'=>'nombre2',
               //'filter'=>'',
                'value' => '$data->idCliente->nombre',
                'type'=>'text',),
		   array (//'header'=>'Cliente',
                'name'=>'apellido',
                //'filter'=>'',
                'value' => '$data->idCliente->apellido',
                'type'=>'text',),
		'nombre',
	/* array(
                   'header'=>'Tipo',
                    'name'=>'tipo',
                    'value'=>'$data->idTipo->descripcion' ,
                   'filter' => CHtml::listData(TipoMascota::model()->findAll(array('order'=>'id')), 'id', 'descripcion'),
                   'htmlOptions'=>array('style'=>'width:10px'),
                    ),*/
	 array(
                   'header'=>'Raza',
                    'name'=>'raza',
                    'value'=>'$data->idRaza->descripcion' ,
                   'filter' => CHtml::listData(RazaMascota::model()->findAll(array('condition'=>'id>2','order'=>'id')), 'id', 'descripcion'),
                   // 'htmlOptions'=>array('style'=>'width:20px'),
                    ),
		//'fecha_nacimiento',
		//'edad',
		 array(
                   'header'=>'Clasificacion',
                    'name'=>'clasificacion',
                    'value'=>'$data->idClasificacion->tipo' ,
                   'filter' => CHtml::listData(EdadMascota::model()->findAll(array('order'=>'id')), 'id', 'tipo'),
                   // 'htmlOptions'=>array('style'=>'width:20px'),
                    ),
		 array(
                   'header'=>'Sexo',
                    'name'=>'sexo',
                    'value'=>'$data->idSexo->descripcion' ,
                   'filter' => CHtml::listData(Sexo::model()->findAll(array('condition'=>'id>2','order'=>'id')), 'id', 'descripcion'),
                   // 'htmlOptions'=>array('style'=>'width:20px'),
                    ),
	//	'observacion',
	//	'foto',
		/*
		'color',
		'esterilizado',
		'longitud',
		'longitud_medida',
		'peso',
		'peso_medida',
		'created_date',
		'modified_date',
		'created_by',
		'modified_by',
		*/
		  array(
                'class'=>'bootstrap.widgets.TbButtonColumn',
                  'template' => '{view} {update} {eliminar}',
                'buttons'=>array(
                
                  'eliminar' => array(
                  'url'=>"CHtml::normalizeUrl(array('eliminar', 'id'=>\$data->id_mascota))",
                  'icon'=>'trash',
                    ),                    
                     
                  ),
              ),
	),
)); ?>
