<?php
/* @var $this EntradaAlmacenController */
/* @var $model EntradaAlmacen */

$this->breadcrumbs=array(
	'Entrada Almacens'=>array('index'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List EntradaAlmacen', 'url'=>array('index')),
	array('label'=>'Registrar Entrada ', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#entrada-almacen-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1 style="text-align: center">Compras</h1>



<?php $this->widget('bootstrap.widgets.TbGridView',array(
        'type'=>'bordered condensed',
        'itemsCssClass'=>'table table-hover',
	'id'=>'entrada-almacen-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'fecha',
		'observacion',
		 array(
                'class'=>'bootstrap.widgets.TbButtonColumn',
                  'template' => '{detalle} {view} {update} {delete}',
                'buttons'=>array(
                
                  'detalle' => array(
                  'url'=>"CHtml::normalizeUrl(array('precio/create', 'id'=>\$data->id))",
                  'icon'=>'th-list',
                    ),                    
                     
                  ),
              ),
	),
)); ?>
