<?php
$this->breadcrumbs=array(
	'Alimentos'=>array('index'),
	'Manage',
);

$this->menu=array(
//	array('label'=>'List Alimento','url'=>array('index')),
	array('label'=>'Crear alimento','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('alimento-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1 style="text-align: center">Alimentos</h1>
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
	'id'=>'alimento-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'descripcion',
                array(
                    'header'=>'Tipo',
                    'name'=>'tipo_alimento',
                    'value'=>'@$data->tipoAlimento->descripcion',
                    'filter' => CHtml::listData(TipoAlimento::model()->findAll(array()), 'id', 'descripcion'), 

                ),
                 array(
                    'header'=>'Cantidad',
                    'name'=>'cantidad',
                    'value'=>'@$data->calculacantidad(@$data->id)',
                    // 'filter' => CHtml::listData(TipoAlimento::model()->findAll(array()), 'id', 'descripcion'), 

                ),
                array(
                    'header'=>'Unidad medida',
                    'name'=>'id_unidad',
                    'value'=>'@$data->idUnidad->descripcion',
                     'filter' => CHtml::listData(UnidadMedida::model()->findAll(array()), 'id', 'descripcion'), 

                ),

//                  'tipo_alimento',
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
