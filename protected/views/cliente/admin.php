<?php
$this->breadcrumbs=array(
	'Clientes'=>array('index'),
	'Manage',
);

$this->menu=array(
//	array('label'=>'List Cliente','url'=>array('index')),
	array('label'=>'Crear Cliente','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('cliente-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1 style="text-align: center"> Clientes</h1>
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
	'id'=>'cliente-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'cedula',
		'nombre',
		'apellido',
		 array(
                   'header'=>'Sexo',
                    'name'=>'sexo',
                    'value'=>'$data->idSexo->descripcion' ,
                   'filter' => CHtml::listData(Sexo::model()->findAll(array('condition'=>'id<3','order'=>'id')), 'id', 'descripcion'),
                   // 'htmlOptions'=>array('style'=>'width:20px'),
                    ),
		'direccion',
		/*
		'telefono',
		'telefono_casa',
		'correo_electronico',
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
                  'url'=>"CHtml::normalizeUrl(array('eliminar', 'id'=>\$data->id))",
                  'icon'=>'trash',
                    ),                    
                     
                  ),
              ),
	),
)); ?>
