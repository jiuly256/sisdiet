<?php
$this->breadcrumbs=array(
	'Porcions'=>array('index'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List Porcion','url'=>array('index')),
	//array('label'=>'Create Porcion','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('porcion-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1 style="text-align: center">Porciones</h1>


<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'porcion-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		 array(
                   'header'=>'Peso',
                    'name'=>'id_peso',
                    'value'=>'$data->idPeso->cantidad.$data->idPeso->medida' ,
                   'filter' => CHtml::listData(PesoMascota::model()->findAll(array('order'=>'id')), 'id', 'cantidad'),
                   // 'htmlOptions'=>array('style'=>'width:20px'),
                    ),
		 array(
                   'header'=>'Edad',
                    'name'=>'id_edad',
                    'value'=>'$data->idEdad->tipo." (".$data->idEdad->descripcion.")"' ,
                   'filter' => CHtml::listData(EdadMascota::model()->findAll(array('order'=>'id')), 'id', 'tipo'),
                   // 'htmlOptions'=>array('style'=>'width:20px'),
                    ),
		'cantidad_gramos',
	//	'porcentaje_grasa',
		'porcentaje_proteina',
		'porcentaje_vegetal',
		/*
		
		*/
		  array(
                'class'=>'bootstrap.widgets.TbButtonColumn',
                  'template' => '{update} ',
                'buttons'=>array(
                
                  // 'eliminar' => array(
                  // 'url'=>"CHtml::normalizeUrl(array('eliminar', 'id'=>\$data->id_mascota))",
                  // 'icon'=>'trash',
                  //   ),                    
                     
                  ),
              ),
	),
)); ?>
